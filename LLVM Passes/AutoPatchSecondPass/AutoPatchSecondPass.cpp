// AutoPatch Patching tool

#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include <cxxabi.h>
#include <iostream>
#include <map>
#include <memory>
#include <queue>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/ADT/SCCIterator.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Dominators.h"
#include <llvm/IR/DebugLoc.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include "llvm/IR/Verifier.h"
#include "llvm/Support/FileSystem.h"
#include <fstream>
#include <llvm/Bitcode/BitcodeWriter.h>

using namespace llvm;
using namespace std;

#define __DEBUG__

// Output strings for debugging
std::string debug_str;
raw_string_ostream debug(debug_str);

// Strings for output
std::string output_str;
raw_string_ostream output(output_str);



cl::opt<std::string> FuncPatchName("func-patch-name",
  cl::desc("Specify the name of the function to patch"),
  cl::value_desc("function name"));

cl::list<int> LineNumPatch("line-num-patch",
  cl::CommaSeparated,
  cl::desc("Specify the line numbers to patch"),
  cl::value_desc("line numbers"));

cl::opt<std::string> OutputDir("output-dir",
  cl::desc("Specify the output directory for the hotpatch file"),
  cl::value_desc("directory name"));

cl::opt<std::string> CVEIDNAME("cve-id",
  cl::desc("Specify the name of CVE"),
  cl::value_desc("CVE ID"));

cl::opt<std::string> TypePatch("type-patch",
  cl::desc("Specify type of the patch"),
  cl::init("drop")); // Set default value to drop

cl::opt<std::string> TypeoffPatch("type-offpatch",
  cl::desc("Specify type of the offcial patch"),
  cl::init("filter")); // Set default value to filter

// Demangles the function name.
std::string demangle(const char *name) {
  int status = -1;

  std::unique_ptr<char, void (*)(void *)> res{
      abi::__cxa_demangle(name, NULL, NULL, &status), std::free};
  return (status == 0) ? res.get() : std::string(name);
}

// Function to attach debug Metadata to an instruction
void addDebugMetaData(Instruction *I, char *debugInfo) {
  LLVMContext &C = I->getContext();
  MDNode *N = MDNode::get(C, MDString::get(C, debugInfo));
  char DebugMetadata[100];
  strcpy(DebugMetadata, "autopatchDebug.");
  strcat(DebugMetadata, debugInfo);
  I->setMetadata(DebugMetadata, N);
}

// Returns the source code line number cooresponding to the LLVM instruction.
// Returns -1 if the instruction has no associated Metadata.
int getSourceCodeLine(Instruction *I) {
  // Get debugInfo associated with every instruction.
  llvm::DebugLoc debugInfo = I->getDebugLoc();
  int line = -1;
  if (debugInfo)
    line = debugInfo.getLine();
  return line;
}


// Topologically sort all the basic blocks in a function.
// Handle cycles in the directed graph using Tarjan's algorithm
// of Strongly Connected Components (SCCs).
vector<BasicBlock *> topoSortBBs(Function &F) {
  vector<BasicBlock *> tempBB;
  for (scc_iterator<Function *> I = scc_begin(&F), IE = scc_end(&F); I != IE;
       ++I) {

    // Obtain the vector of BBs in this SCC and print it out.
    const std::vector<BasicBlock *> &SCCBBs = *I;

    for (std::vector<BasicBlock *>::const_iterator BBI = SCCBBs.begin(),
                                                   BBIE = SCCBBs.end();
         BBI != BBIE; ++BBI) {

      BasicBlock *b = const_cast<llvm::BasicBlock *>(*BBI);
      tempBB.push_back(b);
    }
  }

  reverse(tempBB.begin(), tempBB.end());
  return tempBB;
}

void printStringSet(std::vector<string> * x) {
    bool first = true;
    debug << "{";

    for (std::vector<string>::iterator it=x->begin(), iend=x->end(); it!=iend; ++it) {
      if (!first) {
        debug << ", ";
      }
      else {
        first = false;
      }
      debug << (*it);
    }
    debug << "}\n";
}

std::string getShortValueName(Value * v) {
    if (v->getName().str().length() > 0) {
      return "%" + v->getName().str();
    }
    else if (isa<Instruction>(v)) {
      std::string s = "";
      raw_string_ostream * strm = new raw_string_ostream(s);
      v->print(*strm);
      std::string inst = strm->str();
      size_t idx1 = inst.find("%");
      size_t idx2 = inst.find(" ",idx1);
      if (idx1 != std::string::npos && idx2 != std::string::npos) {
       return inst.substr(idx1,idx2-idx1);
      }
      else {
       return "\"" + inst + "\"";
      }
    }
    else if (ConstantInt * cint = dyn_cast<ConstantInt>(v)) {
      std::string s = "";
      raw_string_ostream * strm = new raw_string_ostream(s);
      cint->getValue().print(*strm,true);
      return strm->str();
    }
    else {
      std::string s = "";
      raw_string_ostream * strm = new raw_string_ostream(s);
      v->print(*strm);
      std::string inst = strm->str();
      return "\"" + inst + "\"";
    }
  }

namespace {
struct AutoPatchSecondPass : public FunctionPass{

  //map<int, BasicBlock *> triggerInfo;
  Instruction *patchInst;



  //***These values are the most important values that we have to work on them and also get information from them.***//
  map<int, BasicBlock *> triggerInfoPDT;
  int triggerLoopLine;
  BasicBlock* triggerLoopBlock;
  //set<Instruction *> patchInstSet;//All patch instructions
  vector<Instruction *> patchInstSet;//All patch instructions
  //set<Value *> patchValueSet;//All important patch value
  map<Instruction *,std::vector<Value *>> patchValueMap;//All important patch value
  map<int,string> Result;
  unordered_set<Value *> Tainted;
  set<MDNode *> metadatapatch;

  vector<Instruction *> hotPatchInstSet;//Final result (generated hotpatch)
  vector<Instruction *> temp_hotPatchInstSet;
  vector<GlobalVariable *> hotPatchInstSet_globalVar; 
  vector<GlobalVariable *> patchGlobalVar;
  vector<StructType *> hotPatchInstSet_structure; 
  vector<Instruction *> alloc_vars_temp;
  vector<Instruction *> alloc_vars;

  //string pathc_type = "FILTER";
  map<Instruction *,Instruction *> trackOldNewInstr;

  std::string typePatch = TypePatch;
  std::string pathc_type = TypeoffPatch;



  // void writeVectorsToFile(const std::string &FileName, const std::vector<Instruction *> &temp_hotPatchInstSet, const std::vector<GlobalVariable *> &hotPatchInstSet_globalVar) {
  void writeVectorsToFile(const std::vector<Instruction *> &temp_hotPatchInstSet, const std::vector<GlobalVariable *> &hotPatchInstSet_globalVar, const std::vector<StructType *> &hotPatchInstSet_structure, vector<int> lnum) {

    if (OutputDir.empty()) {
        debug << "Output directory not specified!\n";
        return;
    }

    std::string FileName = OutputDir.getValue();
    


    // Create a new LLVM module
    LLVMContext Context;
    std::unique_ptr<Module> M = std::make_unique<Module>("my_module", Context);

    // // Create a new function in the module
    //StructType *StackFrameTy = StructType::create(Context, "stack_frame");
    // PointerType *StackFramePtrTy = PointerType::getUnqual(StackFrameTy);
    // FunctionType *FT = FunctionType::get(Type::getInt64Ty(Context), {PointerType::get(StackFrameTy, 0)}, false);

    // Function *F = Function::Create(FT, Function::ExternalLinkage, "filter", M.get());




    // Add a global variable for each element in hotPatchInstSet_structure
    for (StructType *ST : hotPatchInstSet_structure) {
      GlobalVariable *GV = new GlobalVariable(*M, ST, false, GlobalValue::ExternalLinkage, nullptr);
      // Set an appropriate name for the global variable, e.g., "struct.CBW"
      GV->setName(ST->getName());
    }

    // Add a global variable for each element in hotPatchInstSet_globalVar
    for (GlobalVariable *GV : hotPatchInstSet_globalVar) {
      GlobalVariable *NewGV = new GlobalVariable(*M, GV->getType()->getElementType(), GV->isConstant(), GlobalValue::ExternalLinkage, GV->getInitializer());
      // Set an appropriate name for the global variable, e.g., "memory_size"
      NewGV->setName(GV->getName());
    }



    // Define the function signature
    Type *Int8Ty = Type::getInt8Ty(Context);
    Type *Int16Ty = Type::getInt16Ty(Context);
    Type *Int32Ty = Type::getInt32Ty(Context);
    Type *Int64Ty = Type::getInt64Ty(Context);
    Type* ptr32Type = Type::getInt32PtrTy(Context);
    Type* ptr16Type = Type::getInt16PtrTy(Context);
    Type* ptr8Type = Type::getInt8PtrTy(Context);
  
    Type *StackFramePtrTy = PointerType::getUnqual(StructType::create(Context, {Int32Ty, Int32Ty, Int32Ty, Int32Ty, Int32Ty, Int32Ty, Int32Ty, Int32Ty}, "stack_frame"));
    FunctionType *InfoFuncTy = FunctionType::get(Int64Ty, {StackFramePtrTy}, false);
    
    // Create the "printf" function declaration
    FunctionType* printfType = FunctionType::get(IntegerType::getInt32Ty(Context), PointerType::get(IntegerType::getInt8Ty(Context), 0), true);
    Function* printfFunc = Function::Create(printfType, Function::ExternalLinkage, "printf", M.get());


    if (CVEIDNAME.empty()) {
        debug << "CVE ID not specified!\n";
        return;
    }

    std::string CVENAME = CVEIDNAME.getValue();


    // Create the function
    Function *InfoFunc = Function::Create(InfoFuncTy, Function::ExternalLinkage, "filter_" + CVENAME, M.get());

    // Create the entry block
    BasicBlock *Entry = BasicBlock::Create(Context, "entry", InfoFunc);
    IRBuilder<> Builder(Entry);
    
    // Allocate space for op and ret_code on the stack
    AllocaInst *OpAlloca = Builder.CreateAlloca(Int32Ty, nullptr, "op");
    AllocaInst *RetCodeAlloca = Builder.CreateAlloca(Int32Ty, nullptr, "ret_code");
    
    // Load the values of the stack frame into variables
    Value *StackFrame = &*InfoFunc->arg_begin();
    Value *R0 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 0), "r0");
    Value *R1 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 1), "r1");
    Value *R2 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 2), "r2");
    Value *R3 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 2), "r3");
    Value *R6 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 6), "r6"); //pc
    Value *R7 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 7), "r7"); //xpsr

    // Value *R2 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 2), "r2");
    // Value *R3 = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 3), "r3");
    // Value *IP = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 4), "ip");
    // Value *LR = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 5), "lr");
    // Value *PC = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 6), "pc");
    // Value *XPSR = Builder.CreateLoad(Builder.CreateStructGEP(StackFrame, 7), "xpsr");

    // Set op and ret_code to 0
    Builder.CreateStore(ConstantInt::get(Int32Ty, 0), OpAlloca);
    Builder.CreateStore(ConstantInt::get(Int32Ty, 0), RetCodeAlloca);
    
    // // Create the "printf" function declaration
    // FunctionType* printfType = FunctionType::get(IntegerType::getInt32Ty(Context), PointerType::get(IntegerType::getInt8Ty(Context), 0), true);
    // Function* printfFunc = Function::Create(printfType, Function::ExternalLinkage, "printf", M.get());

    // // Create the string constant
    // Constant *formatStr = ConstantDataArray::getString(Context, "hello\n");

    // // Create a global variable to hold the string constant
    // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str");

    // // Create the "printf" call instruction
    // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("hello\\n")});


    // for (auto inst : alloc_vars) {
    //   if(!isInMap2(inst)){
    //     // debug << " Allocation : " << *inst << "\n";
    //     if (isa<llvm::AllocaInst>(inst)) {
    //         AllocaInst *AI = cast<AllocaInst>(inst); 
    //         debug << " Alocation is instruction: " << *(AI->getAllocatedType()) << "\n";


    //         ////////////////********PROBLEMS******//////////////////
    //         // Instruction *ins_temp = Builder.CreateAlloca(AI->getAllocatedType(), nullptr);
    //         // Instruction *ins_temp = Builder.CreateAlloca(Int8Ty, nullptr);

    //         Instruction *ins_temp = inst->clone();
    //         trackOldNewInstr[inst] = ins_temp;
    //         ins_temp->setName(inst->getName());
    //         Builder.Insert(ins_temp);



    //         //trackOldNewInstr[inst] = ins_temp;
    //     }
    //     //AllocaInst *SI = cast<AllocaInst>(inst); 
    //     //debug << " Alocation : " << SI->getAllocatedType() << "\n";
    //     //Type *old_alloc_type = SI->getType()->getPointerElementType();
    //     // Instruction *ins_temp = Builder.CreateAlloca(Int8Ty, nullptr);;
    //     // trackOldNewInstr[inst] = ins_temp;
    //     // ins_temp->setName(inst->getName());
    //     //Builder.Insert(ins_temp);
    //   }
    // }


    // Create a vector of values to assign to the allocation instructions.
    std::vector<Value*> values = {R0, R1, R2, R3};
    int i = 0;
    //debug << " size: " << alloc_vars.size() << "\n";
    // Iterate over each allocation instruction and assign the corresponding value.
    //for (size_t i = 0; i < alloc_vars.size(); ++i) {


    //This part is used when the TRAMPOLINE is near the patch. 
    for (auto inst : alloc_vars) {
      //Value *I = trackOldNewInstr[alloc_vars[i]];
      //Value *V = values[i % values.size()];  // Select the corresponding value to assign.
      if(!isInMap2(inst)){
        debug << "************* Allocation : " << *inst << "\n";
          if (AllocaInst *AI = dyn_cast<AllocaInst>(inst)) {
            if(AI->getName() != "retval"){
              if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 8){
                // debug << "I am 8 bit variable \n";
                Instruction *ins_temp = Builder.CreateAlloca(Int8Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                Value *V = values[i % values.size()];
                Value *convOp1 = Builder.CreateTrunc(V, Int8Ty);
                // Builder.CreateStore(V, ins_temp);
                Builder.CreateStore(convOp1, ins_temp);
              }else if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 16){
                // debug << "I am 16 bit variable \n";
                Instruction *ins_temp = Builder.CreateAlloca(Int16Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                Value *V = values[i % values.size()];
                Value *convOp2 = Builder.CreateTrunc(V, Int16Ty);
                // Value *convOp2 = Builder.CreateZExt(V, Int16Ty);
                Builder.CreateStore(convOp2, ins_temp);
              }else if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 32) {
                // debug << "I am 32 bit variable \n";
                Instruction *ins_temp = Builder.CreateAlloca(Int32Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                Value *V = values[i % values.size()];
                // Value *convOp2 = Builder.CreateZExt(V, Int32Ty);
                // Builder.CreateStore(convOp2, ins_temp);
                Builder.CreateStore(V, ins_temp);
              }
              i++;
            }else{
              // debug << "*Allocation instruction is retval: " << *AI << "\n"; 
              // Instruction *ins_temp = inst->clone();
              // trackOldNewInstr[inst] = ins_temp;
              // ins_temp->setName(inst->getName());
              // Builder.Insert(ins_temp);
            }
          }
        }

      
      // debug << " Instruction and Value : " << *I << " , " << *V << "\n";

      // debug << " Types : " << *(I->getType()) << " , " << *(V->getType()) << "\n";

     
      // LoadInst *loadInst = cast<LoadInst>(V);
      // AllocaInst *allocInst = cast<AllocaInst>(I);

      // // Get the type of the loaded value
      // Type* loadedType = loadInst->getType();

      // // Get the type of the allocated pointer
      // Type* allocatedType = allocInst->getAllocatedType();

      // Check if the types match
      // if (loadedType != allocatedType) {
      //   debug << " Types1 : " << *loadedType << " , " << *allocatedType << "\n";
      //   Value *convOp2 = Builder.CreateZExt(V, Int32Ty);
      //   Builder.CreateStore(convOp2, I);
      // }else{
      //   debug << " Types2 : " << *loadedType << " , " << *allocatedType << "\n";
        // Builder.CreateStore(V, I);             // Assign the value to the instruction.
      // }
    }


    // BasicBlock *EntryBB = BasicBlock::Create(Context, "entry", F);
    // IRBuilder<> Builder(EntryBB);

    // Value *Arg = F->arg_begin();
    // LoadInst *Load = Builder.CreateLoad(Arg);


    // Get a non-const reference to temp_hotPatchInstSet
    // vector<Instruction *> &temp_hotPatchInstSetRef = const_cast<vector<Instruction *> &>(temp_hotPatchInstSet);

    // for (auto inst : alloc_vars) {
    //   debug << " Instruction and Value : " << *inst << "\n";
    //   temp_hotPatchInstSetRef.push_back(inst);
    // }



    // Add allocation instructions to the entry basic block to avoid creating a new entry basic block!

    //for (auto inst : temp_hotPatchInstSet) { 
    for (auto inst : alloc_vars_temp) { 

      if(isInMap2(inst)){

        if(AllocaInst *AI = dyn_cast<AllocaInst>(inst)){
        // debug << "*Allocation instruction is : " << *AI << "\n";
        // Instruction *ins_temp = inst->clone();
        // trackOldNewInstr[inst] = ins_temp;
        // ins_temp->setName(inst->getName());
        // Builder.Insert(ins_temp);
        // AllocaInst *ins_allocation = cast<AllocaInst>(ins_temp); 
        if(AI->getName() != "retval"){ 
          // if(i < values.size()){ //Check for more than 4 variables in the program 
            if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 8){
                Instruction *ins_temp = Builder.CreateAlloca(Int8Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                if(i < values.size()){
                  Value *V = values[i % values.size()];
                  Value *convOp1 = Builder.CreateTrunc(V, Int8Ty);
                  // Builder.CreateStore(V, ins_temp);
                  Builder.CreateStore(convOp1, ins_temp);
                  // debug << "I am 8 bit \n " ; 
                }
            }else if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 16){
                Instruction *ins_temp = Builder.CreateAlloca(Int16Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                if(i < values.size()){
                  Value *V = values[i % values.size()];
                  // Value *convOp2 = Builder.CreateZExt(V, Int16Ty);
                  Value *convOp2 = Builder.CreateTrunc(V, Int16Ty);
                  Builder.CreateStore(convOp2, ins_temp);
                  // debug << "I am 16 bit \n " ; 
                }
            }else if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 32) {
                Instruction *ins_temp = Builder.CreateAlloca(Int32Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                if(i < values.size()){
                  Value *V = values[i % values.size()];
                  // Value *convOp2 = Builder.CreateZExt(V, Int32Ty);
                  // Builder.CreateStore(convOp2, ins_temp);
                  Builder.CreateStore(V, ins_temp);
                  // debug << "I am 32 bit \n " ; 
                }
            }else if(AI->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && AI->getAllocatedType()->getIntegerBitWidth() == 64) {
                Instruction *ins_temp = Builder.CreateAlloca(Int64Ty, nullptr, AI->getName());
                trackOldNewInstr[AI] = ins_temp;
                if(i < values.size()){
                  Value *V = values[i % values.size()];
                  Value *convOp2 = Builder.CreateZExt(V, Int64Ty);
                  // Builder.CreateStore(convOp2, ins_temp);
                  Builder.CreateStore(convOp2, ins_temp);
                  // debug << "I am 32 bit \n " ; 
                }
            }else if (AI->getAllocatedType()->isPointerTy() && AI->getAllocatedType()->getPointerElementType()->isIntegerTy() && AI->getAllocatedType()->getPointerElementType()->getIntegerBitWidth() == 8) {
              Instruction *ins_temp = Builder.CreateAlloca(ptr8Type, nullptr, AI->getName());
              trackOldNewInstr[AI] = ins_temp;
              if(i < values.size()){
                Value *V = values[i % values.size()];
                // Value *convOp2 = Builder.CreateZExt(V, Int16Ty);
                Value *convOp3 = Builder.CreateIntToPtr(V, ptr8Type);
                Builder.CreateStore(convOp3, ins_temp);
                // debug << "I am a 16-bit integer pointer \n";
              }
            }else if (AI->getAllocatedType()->isPointerTy() && AI->getAllocatedType()->getPointerElementType()->isIntegerTy() && AI->getAllocatedType()->getPointerElementType()->getIntegerBitWidth() == 16) {
              Instruction *ins_temp = Builder.CreateAlloca(ptr16Type, nullptr, AI->getName());
              trackOldNewInstr[AI] = ins_temp;
              if(i < values.size()){
                Value *V = values[i % values.size()];
                // Value *convOp2 = Builder.CreateZExt(V, Int16Ty);
                Value *convOp3 = Builder.CreateIntToPtr(V, ptr16Type);
                Builder.CreateStore(convOp3, ins_temp);
                // debug << "I am a 16-bit integer pointer \n";
              }
            }else if (AI->getAllocatedType()->isPointerTy() && AI->getAllocatedType()->getPointerElementType()->isIntegerTy() && AI->getAllocatedType()->getPointerElementType()->getIntegerBitWidth() == 32) {
              Instruction *ins_temp = Builder.CreateAlloca(ptr32Type, nullptr, AI->getName());
              trackOldNewInstr[AI] = ins_temp;
              if(i < values.size()){
                Value *V = values[i % values.size()];
                // Value *convOp2 = Builder.CreateZExt(V, Int32Ty);
                Value *convOp3 = Builder.CreateIntToPtr(V, ptr32Type);
                Builder.CreateStore(convOp3, ins_temp);
                // debug << "I am a 32-bit integer pointer \n";
              }
            }
            else{ //Temporary
              Instruction *ins_temp = inst->clone();
              trackOldNewInstr[inst] = ins_temp;
              ins_temp->setName(inst->getName());
              Builder.Insert(ins_temp);
            }
            // debug << "I am not retval so store" << *ins_allocation << " " << *(ins_allocation->getAllocatedType()) << "\n";
            // // if(AI->getAllocatedType() == Int8Ty){
            // if (ins_allocation->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && ins_allocation->getAllocatedType()->getIntegerBitWidth() == 8) {
            //     Value *V = values[i % values.size()];
            //     Builder.CreateStore(V, ins_allocation);
            //     debug << "I am 8 bit \n " ; 
            // }
            // // else if(AI->getAllocatedType() == Int16Ty) {
            // else if (ins_allocation->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && ins_allocation->getAllocatedType()->getIntegerBitWidth() == 16) {
            //     Value *V = values[i % values.size()];
            //     Value *convOp2 = Builder.CreateZExt(V, Int16Ty);
            //     AllocaInst *temp = Builder.CreateAlloca(Int16Ty, nullptr, "temp");
            //     Builder.CreateStore(convOp2, temp);

            //     // Builder.CreateStore(convOp2, ins_allocation);
            //     debug << "I am 16 bit \n";
            // }
            // // else if(AI->getAllocatedType() == Int32Ty){
            // else if (ins_allocation->getAllocatedType()->getTypeID() == llvm::Type::IntegerTyID && ins_allocation->getAllocatedType()->getIntegerBitWidth() == 32) {
            //   Value *V = values[i % values.size()];
            //   // Value *convOp3 = Builder.CreateZExt(V, Int32Ty);
            //   // Builder.CreateStore(convOp3, ins_temp);
            //   debug << "I am 32 bit \n";
            // }
            i++;
          // }
        }else{
          // debug << "*Allocation instruction is retval: " << *AI << "\n"; //I think we don't need to create a retval allocation since we don't use it.
          // Instruction *ins_temp = inst->clone();
          // trackOldNewInstr[inst] = ins_temp;
          // ins_temp->setName(inst->getName());
          // Builder.Insert(ins_temp);
        }
      }
      }
    }

    for(GlobalVariable *GV : patchGlobalVar){
      // debug << "*Global Variable is : " << *GV  << " and " << i << "\n";
      Value *V = values[i];
      // Builder.CreateStore(V, GV);

    }

    

    // Create a vector of basic blocks
    std::vector<BasicBlock *> BBs;

    // Insert the elements of the vectors into the appropriate basic block
    for (auto I : temp_hotPatchInstSet) {
        // debug << "Instruction that we see is : " << *I << "\n";
        if(isa<AllocaInst>(I)){ //We should not consider the basic block of allocation instructions because we already add them to the new entry basic block
          continue;
        }

        BasicBlock *BB = I->getParent();
        if (std::find(BBs.begin(), BBs.end(), BB) == BBs.end()) {
            // If the basic block is not already in the vector, add it
            BBs.push_back(BB);
        }
    }

    // Create the basic blocks in the function
    std::map<BasicBlock *, BasicBlock *> BBMap;
    for (auto BB : BBs) {
        BasicBlock *NewBB = BasicBlock::Create(Context, BB->getName(), InfoFunc);
        BBMap[BB] = NewBB;
    }

    
    Builder.CreateBr(BBMap[BBs[0]]);

    // Insert the instructions into the appropriate basic block
    //IRBuilder<> Builder(BBMap[BBs[0]]);
    Builder.SetInsertPoint(BBMap[BBs[0]]);

    bool normal = true;
    BasicBlock *ThenBB = nullptr;
    BasicBlock *ExitBB = nullptr;

    //For replace patch
    bool seeBranch = false;

    for (auto I : temp_hotPatchInstSet) {
      // debug << "see: " << *I << "\n";
      // if(isa<CallInst>(I)){
        // continue;
      // }
      if(auto CI = dyn_cast<CallInst>(I)){ 
        //I changed to specific call instructions because it has issue with CVE-2020-10063
        //This CVE has call instruction, but before changing this, it didn't store it to the file!
        StringRef CIFuncName = CI->getCalledFunction()->getName();
        string DemangledFuncCallName = demangle(CIFuncName.str().c_str());
        if (DemangledFuncCallName.find("printf") != string::npos || 
              DemangledFuncCallName.find("dbg") != string::npos) {
                // debug << *CI << "\n";
                continue;
        }
        // if (DemangledFuncCallName.find("dbg") != string::npos) {
        //         continue;
        // }

        // Get the function definition
        Function *func = CI->getModule()->getFunction(CIFuncName);
        // debug << "The function is: " << *func << "\n";
        // if (func) {
        //   // Add the function definition to the Builder
        //   // M->getOrInsertFunction(func->getName(), func->getFunctionType());
        //   if (!func->empty()) {
        //     // Create a new function in the new module with the same function type and name
        //     Function *newFunc = Function::Create(func->getFunctionType(),
        //                                         func->getLinkage(),
        //                                         func->getName(),
        //                                         M.get());
        //     // Create a new basic block in the new function
        //     BasicBlock *newBB = BasicBlock::Create(M.get()->getContext(), "", newFunc);

        //     // Set the insertion point of the IRBuilder to the new basic block
        //     Builder.SetInsertPoint(newBB);

        //     // Iterate over the basic blocks of the source function
        //     for (auto &BB : *func) {
        //       // Iterate over the instructions within each basic block
        //       for (BasicBlock::const_iterator It = BB.begin(); It != BB.end(); ++It) {
        //         // Clone the instruction
        //         Instruction *instemp = const_cast<llvm::Instruction *>(&*It);
        //         debug << "InjA : " << *instemp << "\n";
        //         Instruction *newInst = instemp->clone();
        //         trackOldNewInstr[instemp] = newInst;
        //         newInst->setName(instemp->getName());
        //         // Insert the cloned instruction into the new basic block using the IRBuilder
        //         Builder.Insert(newInst);
        //       }
        //     }
        //   }else{
        //     // Add the function definition to the Builder
        //     M->getOrInsertFunction(func->getName(), func->getFunctionType());
        //   }
        // }

        if (func) {
          // Add the function definition to the Builder
          // M->getOrInsertFunction(func->getName(), func->getFunctionType());
          if (!func->empty()) {
              // Create a new function in the new module with the same function type and name
              Function *newFunc = Function::Create(func->getFunctionType(),
                                                  func->getLinkage(),
                                                  func->getName(),
                                                  M.get());
              // Set the names of the arguments in the new function to the names of the arguments in the original function
              Function::arg_iterator newArg = newFunc->arg_begin();
              for (Function::arg_iterator arg = func->arg_begin(); arg != func->arg_end(); ++arg) {
                  newArg->setName(arg->getName());
                  ++newArg;
              }

              
              // // Create a new basic block in the new function
              // BasicBlock *newBB2 = BasicBlock::Create(M.get()->getContext(), "entry", newFunc);

              // // Set the insertion point of the IRBuilder to the new basic block
              // Builder.SetInsertPoint(newBB2);

              bool oneFuncTime = true;

              // Iterate over the basic blocks of the source function
              for (auto &BB : *func) {
                BasicBlock *newBB = BasicBlock::Create(M->getContext(), BB.getName(), newFunc);
                Builder.SetInsertPoint(newBB);
                if(oneFuncTime){
                  oneFuncTime = false;
                  
                  // Constant *formatStr2 = ConstantDataArray::getString(Context, "Hello new func\n");
                  // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
                  // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Hello new func\\n")});
                }
                // Iterate over the instructions within each basic block
                for (BasicBlock::const_iterator It = BB.begin(); It != BB.end(); ++It) {
                    Instruction *instemp = const_cast<llvm::Instruction *>(&*It);

                    // debug << "These are instruction in function : " << *instemp << "\n";
                    
                    if(auto CI = dyn_cast<CallInst>(instemp)){ 
                      StringRef CIFuncName = CI->getCalledFunction()->getName();
                      string DemangledFuncCallName = demangle(CIFuncName.str().c_str());
                      if(DemangledFuncCallName.find("dbg") != string::npos 
                      || DemangledFuncCallName.find("TRAMPOLINE_FUNCTION") != string::npos){
                        continue;
                      }
                    }

                    // Clone the instruction
                    Instruction *newInst = instemp->clone();
                    trackOldNewInstr[instemp] = newInst;

                    // Set the names of the operands in the new instruction to the names of the operands in the original instruction
                    // for (unsigned int i = 0; i < newInst->getNumOperands(); i++) {
                    //     if (Value *v = dyn_cast<Value>(newInst->getOperand(i))) {
                    //         if (v->hasName()) {
                    //             v->setName(trackOldNewInstr[v->getName()]);
                    //         }
                    //     }
                    // }
                    // Insert the cloned instruction into the new basic block using the IRBuilder
                    Builder.Insert(newInst);
                }
              }
          }else{
              // Add the function definition to the Builder
              M->getOrInsertFunction(func->getName(), func->getFunctionType());
          }
        }
      }else if(BranchInst *BI = dyn_cast<BranchInst>(I)){
        
        if(BI->isUnconditional()){
          BasicBlock *ifExitBB = BI->getSuccessor(0);
          std::string endBBName = ifExitBB->getName().str();
          if(endBBName.find("inc") != std::string::npos){
            debug << "This branch is for Continue : " << *BI << "\n" ;
            BasicBlock *ExitBB2 = BasicBlock::Create(Context, "exit.continue", InfoFunc);

            Builder.SetInsertPoint(ExitBB2);
            Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
            Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

            Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
            Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

            Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
            Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");
            Builder.CreateRet(OpRetSum2);

            Builder.SetInsertPoint(BBMap[I->getParent()]);
            BranchInst *BI_temp =  Builder.CreateBr(ExitBB2);
            trackOldNewInstr[BI] = BI_temp;
            continue;
          
          }
        }

        if(pathc_type == "filter"){
          if(BI->getNumSuccessors() == 2){



            BasicBlock *ifThenBB = BI->getSuccessor(0);
            BasicBlock *ifEndBB = BI->getSuccessor(1);
            std::string thenBBName = ifThenBB->getName().str();
            std::string endBBName = ifEndBB->getName().str();

            // debug << "Branch Labels: " << thenBBName << " , " << endBBName << "\n";


            // BasicBlock *ifThenBBN = BasicBlock::Create(Context, thenBBName, InfoFunc);
            // Builder.SetInsertPoint(ifThenBBN);
            // Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
            // Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
            // Value *opValue = Builder.CreateLoad(OpAlloca);
            // Value *convOp = Builder.CreateZExt(opValue, Type::getInt64Ty(Context));
            // Value *retCodeValue = Builder.CreateLoad(RetCodeAlloca);
            // Value *convRetCode = Builder.CreateZExt(retCodeValue, Type::getInt64Ty(Context));
            // Value *ShiftedOp = Builder.CreateShl(convOp, 32, "shifted_op_then");
            // Value *OpRetSum = Builder.CreateAdd(ShiftedOp, convRetCode, "op_ret_sum_then");
            // Builder.CreateRet(OpRetSum);



            // BasicBlock *ifEndBBN = BasicBlock::Create(Context, endBBName, InfoFunc);

          

            if (BI->isConditional()) {
              if (BI->getNumOperands() > 1) {
                debug << *BI << "\n";
                
                // if (std::find(BBs.begin(), BBs.end(), ifThenBB) != BBs.end()) {
                //   debug << "The Then basic block is in the BBs " << ifThenBB->getName().str() << " " << *(ifThenBB->getTerminator()) << "\n";
                //   if(BranchInst *BI_ttemp = dyn_cast<BranchInst>(ifThenBB->getTerminator())){
                //     if(BI_ttemp->getNumSuccessors() != 1){
                //       ThenBB = BasicBlock::Create(Context, thenBBName , InfoFunc);
                //     }else{
                //       ThenBB = BasicBlock::Create(Context, "if_then", InfoFunc);
                //     }
                //   }
                // }

                if (std::find(BBs.begin(), BBs.end(), ifEndBB) != BBs.end()) {
                  // debug << "The End basic block is in the BBs " << ifEndBB->getName().str() << " " << *(ifEndBB->getTerminator()) << "\n";
                  if(BranchInst *BI_ttemp = dyn_cast<BranchInst>(ifEndBB->getTerminator())){
                    if(BI_ttemp->getNumSuccessors() != 1){
                      // debug << "It has 2 blocks for jumping \n";
                      normal = false;
                      if(ThenBB==NULL){

                        // debug<< "******* I AM HERE 1\n"; 
                        ThenBB = BasicBlock::Create(Context, "if_then", InfoFunc);
                        ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
                        Builder.SetInsertPoint(ThenBB);

                        if(typePatch == "drop"){
                          // debug << "It is drop patch \n";
                          Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
                          Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
                        }else if(typePatch == "redirect"){
                          // debug << "It is redirect patch \n";
                          Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);

                          //Get value from pc (R6) in the stackframe then add a offset value (for now, "fixed value 4")
                          Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4)); 
                          Builder.CreateStore(R6_plus, RetCodeAlloca);
                        }
                        // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                        // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!\n");
                        // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str");
                        // Builder.CreateCall(printfFunc, {Builder.CreateBitCast(formatStrVar, Builder.getInt8PtrTy())});

                        Builder.CreateBr(ExitBB);
                        Builder.SetInsertPoint(ExitBB);

                        Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
                        Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

                        Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
                        Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

                        Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
                        Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");

                        // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                        // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
                        // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
                        // Builder.CreateCall(printfFunc, {Builder.CreateBitCast(formatStrVar2, Builder.getInt8PtrTy())});

                        Builder.CreateRet(OpRetSum2);

                      }
                      Builder.SetInsertPoint(BBMap[I->getParent()]);
                      BranchInst *BI_temp =  Builder.CreateCondBr(BI->getCondition(),ThenBB,ifEndBB->getTerminator()->getParent());
                      trackOldNewInstr[BI] = BI_temp;

                      continue;
                    }else{
                      // debug << "It has 1 block for jumping \n";

                    }
                  }
                }else if(endBBName.find("end") != std::string::npos){
                  if(ThenBB==NULL){
                        // debug<< "******* I AM HERE 2\n"; 

                        ThenBB = BasicBlock::Create(Context, "if_then", InfoFunc);
                        ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
                        Builder.SetInsertPoint(ThenBB);

                        if(typePatch == "drop"){
                          // debug << "It is drop patch \n";
                          Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
                          Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
                        }else if(typePatch == "redirect"){
                          // debug << "It is redirect patch \n";
                          Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);

                          //Get value from pc (R6) in the stackframe then add a offset value (for now, "fixed value 4")
                          Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4)); //4 is an example, you should think for general offset
                          Builder.CreateStore(R6_plus, RetCodeAlloca);
                        }

                        // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                        // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!\n");
                        // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str");
                        // Builder.CreateCall(printfFunc, {Builder.CreateBitCast(formatStrVar, Builder.getInt8PtrTy())});


                        Builder.CreateBr(ExitBB);
                        Builder.SetInsertPoint(ExitBB);
                        Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
                        Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

                        Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
                        Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

                        Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
                        Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");

                        // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                        // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
                        // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
                        // Builder.CreateCall(printfFunc, {Builder.CreateBitCast(formatStrVar2, Builder.getInt8PtrTy())});

                        Builder.CreateRet(OpRetSum2);
                  }
                  // debug<< "******* I AM HERE 3\n"; 
                  Builder.SetInsertPoint(BBMap[I->getParent()]);
                  BranchInst *BI_temp =  Builder.CreateCondBr(BI->getCondition(),ThenBB,ExitBB);
                  trackOldNewInstr[BI] = BI_temp;
                  continue;
                }
              }
            }

            if(normal){ 
              ThenBB = BasicBlock::Create(Context, "if_then", InfoFunc);
              ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
              BranchInst *BI_temp =  Builder.CreateCondBr(BI->getCondition(),ThenBB,ExitBB);
              trackOldNewInstr[BI] = BI_temp;
              

              Builder.SetInsertPoint(ThenBB);

              if(typePatch == "drop"){
                // debug << "It is drop patch \n";
                Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
                Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
              }else if(typePatch == "redirect"){
                // debug << "It is redirect patch \n";
                Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);

                //Get value from pc (R6) in the stackframe then add a offset value (for now, "fixed value 4")
                Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4)); 
                Builder.CreateStore(R6_plus, RetCodeAlloca);
              }

              //else if(typePatch == "none"){
                // debug << "It is none patch \n"; 
              //}
              
              // Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
              // Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);

              // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
              // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!  ");
              // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str1");
              // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Malicious Input, Fixed!   ")});



              Builder.CreateBr(ExitBB);


              Builder.SetInsertPoint(ExitBB);
              Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
              Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

              Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
              Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

              Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
              Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");






              // Create the "printf" function declaration
              // FunctionType* printfType = FunctionType::get(IntegerType::getInt32Ty(Context), PointerType::get(IntegerType::getInt8Ty(Context), 0), true);
              // Function* printfFunc = Function::Create(printfType, Function::ExternalLinkage, "printf", M.get());

              // *** For validating the generated patch uncomment these, but for Evaluation comment them:

              // // Create the string constant
              // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
              // // Create a global variable to hold the string constant
              // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
              // // Create the "printf" call instruction
              // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Done2\\n")});



              Builder.CreateRet(OpRetSum2);
              // Builder.SetInsertPoint(ifEndBBN);
              // Builder.CreateBr(ExitBB);
            }
          }
          //else{

            // debug << "see2: " << *I << "\n";
            // BasicBlock *ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
            // Builder.SetInsertPoint(ExitBB);
            // Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
            // Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

            // Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
            // Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

            // Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
            // Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");
          //}

          continue;
        }//End of checking "filter" type

        else if(pathc_type == "replace"){
          if(BI->getNumSuccessors() == 1){
            // debug << "I am here for " << *BI << "\n";
            BasicBlock *ifEndBB = BI->getSuccessor(0);
            std::string endBBName = ifEndBB->getName().str();
            if(endBBName.find("end") != std::string::npos && std::find(lnum.begin(), lnum.end(), getSourceCodeLine(ifEndBB->getFirstNonPHI())) != lnum.end()){
              
              Builder.SetInsertPoint(BBMap[I->getParent()]);
              Instruction *ins_temp = I->clone();
              trackOldNewInstr[I] = ins_temp;
              ins_temp->setName(I->getName());
              Builder.Insert(ins_temp);
              continue;
            }
            else if(endBBName.find("end") != std::string::npos){
              
              // debug << "IT has end " << getSourceCodeLine(ifEndBB->getFirstNonPHI()) << " , " << *(ifEndBB->getFirstNonPHI()) <<"\n";
              seeBranch = true;

              if(ExitBB==NULL){

                ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
                Builder.SetInsertPoint(ExitBB);

                if(typePatch == "drop"){
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
                }else if(typePatch == "redirect"){
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);
                  Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4)); //4 is an example, you should think for general offset
                  Builder.CreateStore(R6_plus, RetCodeAlloca);
                }
                // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!  ");
                // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str1");
                // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Malicious Input, Fixed!   ")});


                Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
                Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

                Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
                Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

                Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
                Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");

                // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
                // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
                // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Done2\\n")});
                
                Builder.CreateRet(OpRetSum2);

              }
              Builder.SetInsertPoint(BBMap[I->getParent()]);
              BranchInst *BI_temp =  Builder.CreateBr(ExitBB);
              trackOldNewInstr[BI] = BI_temp;

              continue;
            }
          }else if(BI->getNumSuccessors() == 2){


            BasicBlock *ifThenBB = BI->getSuccessor(0);
            BasicBlock *ifEndBB = BI->getSuccessor(1);
            std::string thenBBName = ifThenBB->getName().str();
            std::string endBBName = ifEndBB->getName().str();

            if(endBBName.find("end") != std::string::npos){
              if(BranchInst *BI_ttemp = dyn_cast<BranchInst>(ifEndBB->getTerminator())){
                if(BI_ttemp->getNumSuccessors() != 1){
                  Builder.SetInsertPoint(BBMap[I->getParent()]);
                  BranchInst *BI_temp =  Builder.CreateCondBr(BI->getCondition(),ifThenBB,ifEndBB->getTerminator()->getParent());
                  trackOldNewInstr[BI] = BI_temp;
                  continue;
                }
              }
              seeBranch = true;

              if(ExitBB==NULL){

                ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
                Builder.SetInsertPoint(ExitBB);

                if(typePatch == "drop"){
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
                }else if(typePatch == "redirect"){
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);
                  Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4)); 
                  Builder.CreateStore(R6_plus, RetCodeAlloca);
                }
                // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!  ");
                // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str1");
                // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Malicious Input, Fixed!   ")});


                Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
                Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

                Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
                Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

                Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
                Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");

                // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
                // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
                // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Done2\\n")});
                
                Builder.CreateRet(OpRetSum2);

              }
              Builder.SetInsertPoint(BBMap[I->getParent()]);
              BranchInst *BI_temp =  Builder.CreateCondBr(BI->getCondition(),ifThenBB,ExitBB);
              trackOldNewInstr[BI] = BI_temp;

              continue;

            }else if(thenBBName.find("end") != std::string::npos){
              seeBranch = true;

              if(ExitBB==NULL){

                ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
                Builder.SetInsertPoint(ExitBB);

                if(typePatch == "drop"){
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
                }else if(typePatch == "redirect"){
                  Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);
                  Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4)); 
                  Builder.CreateStore(R6_plus, RetCodeAlloca);
                }
                // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!  ");
                // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str1");
                // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Malicious Input, Fixed!   ")});


                Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
                Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

                Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
                Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

                Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
                Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");

                // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
                // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
                // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
                // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Done2\\n")});
                
                Builder.CreateRet(OpRetSum2);

              }
              Builder.SetInsertPoint(BBMap[I->getParent()]);
              BranchInst *BI_temp =  Builder.CreateCondBr(BI->getCondition(),ExitBB,ifEndBB);
              trackOldNewInstr[BI] = BI_temp;

              continue;
            }
          }
        }//End of checking "replace" type
      }else if(isa<AllocaInst>(I)){
        continue; //We already add the allocations to the entry basic block.
      }else if(StoreInst *SI = dyn_cast<StoreInst>(I)){
        // What are you storing?
        auto val1 = SI->getOperand(0);
        // Where are you storing?
        auto val2 = SI->getOperand(1);
        if((!isa<Instruction>(val1)) && (isa<Instruction>(val2) && (val2->getName() == "retval"))){
          continue;
        }
      }else if(isa<ReturnInst>(I)){
        continue;
      }
      // else if(LoadInst *LI = dyn_cast<LoadInst>(I)){

      //   Type *Ty = LI->getPointerOperand()->getType()->getPointerElementType();
      //   if (Ty->isIntegerTy(8)) { // Check if the loaded value is of type i8
      //       Value *LoadedValue = Builder.CreateLoad(LI->getPointerOperand());
      //       Value *ZExtValue = Builder.CreateZExt(LoadedValue, Type::getInt32Ty(LI->getContext()));
      //   }
      // }
      // else if(LoadInst *BI = dyn_cast<LoadInst>(I)){
      //   continue;
      // }else if(isa<llvm::ZExtInst>(I)){
      //   continue;
      // }
      Builder.SetInsertPoint(BBMap[I->getParent()]);
      Instruction *ins_temp = I->clone();
      trackOldNewInstr[I] = ins_temp;
      ins_temp->setName(I->getName());
      Builder.Insert(ins_temp);
    }

    if(ExitBB==NULL && !seeBranch){
      // debug << "The patch is so simple and does not have any if! \n";

      ExitBB = BasicBlock::Create(Context, "return", InfoFunc);
      Builder.SetInsertPoint(ExitBB);

      if(typePatch == "drop"){
        Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 1), OpAlloca);
        Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), -22), RetCodeAlloca);
      }else if(typePatch == "redirect"){
        Builder.CreateStore(ConstantInt::get(Type::getInt32Ty(Context), 2), OpAlloca);
        Value *R6_plus = Builder.CreateAdd(R6, ConstantInt::get(Type::getInt32Ty(Context), 4));
        Builder.CreateStore(R6_plus, RetCodeAlloca);
      }
      // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
      // Constant *formatStr = ConstantDataArray::getString(Context, "Malicious Input, Fixed!  ");
      // GlobalVariable *formatStrVar = new GlobalVariable(*M, formatStr->getType(), true, GlobalValue::PrivateLinkage, formatStr, ".str1");
      // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Malicious Input, Fixed!   ")});


      Value *Op = Builder.CreateLoad(OpAlloca, "op_val");
      Value *convOp2 = Builder.CreateZExt(Op, Type::getInt64Ty(Context));

      Value *RetCode2 = Builder.CreateLoad(RetCodeAlloca, "ret_code_val");
      Value *convRetCode2 = Builder.CreateZExt(RetCode2, Type::getInt64Ty(Context));

      Value *ShiftedOp2 = Builder.CreateShl(convOp2, 32, "shifted_op");
      Value *OpRetSum2 = Builder.CreateAdd(ShiftedOp2, convRetCode2, "op_ret_sum");

      // // *** For validating the generated patch uncomment these, but for Evaluation comment them:
      // Constant *formatStr2 = ConstantDataArray::getString(Context, "Done2\n");
      // GlobalVariable *formatStrVar2 = new GlobalVariable(*M, formatStr2->getType(), true, GlobalValue::PrivateLinkage, formatStr2, ".str");
      // Builder.CreateCall(printfFunc, {Builder.CreateGlobalStringPtr("Done2\\n")});
      
      Builder.CreateRet(OpRetSum2);


      Builder.SetInsertPoint(BBMap[(temp_hotPatchInstSet.back())->getParent()]);
      BranchInst *BI_temp =  Builder.CreateBr(ExitBB);

    }
    for(auto &Inst : trackOldNewInstr){
      Instruction *instemp = Inst.second;
      for (unsigned int i = 0; i < instemp->getNumOperands(); i++) {
        Value* op = instemp->getOperand(i); // Operands of new Instructions
        for (auto &oldNew : trackOldNewInstr) {
          if (oldNew.first == op) {
            instemp->setOperand(i, oldNew.second);
            break;
          }
        }
      }
      // debug << "New Instr is: " << *instemp << "\n";
      if(LoadInst *LI = dyn_cast<LoadInst>(instemp)){
        Value *pointerOperand = LI->getPointerOperand();
        Type *pointerType = pointerOperand->getType()->getPointerElementType();
        Type *loadedValueType = LI->getType();

        // if (loadedValueType != pointerType) {
        //   debug << "It is not the same for " << *instemp << " , " << *pointerType << " , " << *LI->getOperand(0) << "\n";
        //   Value* oldPtr = LI->getPointerOperand(); // Get the old pointer operand
        //   LLVMContext& context = LI->getContext(); // Get the context for the new type
        //   PointerType* newPtrType = PointerType::get(Type::getInt32Ty(context), oldPtr->getType()->getPointerAddressSpace()); // Create the new pointer type
        //   Value* newPtr = new BitCastInst(oldPtr, newPtrType, "", LI); // Create a new bitcast instruction to cast the old pointer to the new pointer type
        //   LI->setOperand(0, newPtr); // Set the new pointer operand for the load instruction
        // }
      }
    }

    std::vector<BasicBlock*> emptyBBs;

    // Iterate over the basic blocks of the function
    for (BasicBlock &BB : *InfoFunc) {
      // Check if the basic block is empty
      if (BB.empty()) {
        // Store the empty basic block in the vector
        emptyBBs.push_back(&BB);
      }
    }

    // Iterate over the empty basic blocks and remove them from the function
    for (BasicBlock *BB : emptyBBs) {
      // Erase the basic block from the function
      InfoFunc->getBasicBlockList().erase(BB);
    }

    


    // Verify the module
    verifyModule(*M);

    // Write the module to a file
    std::error_code EC;
    raw_fd_ostream OS(FileName, EC, sys::fs::FA_Write);


    if (EC) {
        debug << "Error opening file: " << EC.message() << " for " << FileName << "\n";
        return;
    }
   
    OS << *M;
    OS.close();
    debug << "Storing your hotpatch in: " << FileName << " is completed." << "\n";
  }

  static char ID;
  AutoPatchSecondPass() : FunctionPass(ID) {}

  void insertInMap(Instruction *I) {
    //debug << "Inserting into set: " << *I << "\n";
    //patchInstSet.insert(I);
    if (!isInVec(I)) {
      //debug << "Inserting into vector: " << *I << "\n";
      patchInstSet.push_back(I);
    }
  }
  bool isInVec(Instruction *I) {

    if (std::find(patchInstSet.begin(), patchInstSet.end(), I) != patchInstSet.end())
      return true;

    return false;
  }
  // void insertInMap(int linenum, BasicBlock *BB_tempp) {
  //   debug << "Inserting into map: " << linenum << "\n";
  //   triggerInfo[linenum] = BB_tempp;
  // }

  void insertInMapPDT(int linenum, BasicBlock *BB_tempp) {
    //debug << "Inserting into map: " << linenum << "\n";
    triggerInfoPDT[linenum] = BB_tempp;
  }


  bool isInMap(Instruction *I) {

    if (std::find(hotPatchInstSet.begin(), hotPatchInstSet.end(), I) != hotPatchInstSet.end())
      return true;

    return false;
  }
  bool isInMap2(Instruction *I) {

    if (std::find(temp_hotPatchInstSet.begin(), temp_hotPatchInstSet.end(), I) != temp_hotPatchInstSet.end())
      return true;

    return false;
  }
  bool isInMap3(Instruction *I) {

    if (std::find(alloc_vars_temp.begin(), alloc_vars_temp.end(), I) != alloc_vars_temp.end())
      return true;

    return false;
  }

  bool isInMap4(Instruction *I) {

    if (std::find(alloc_vars.begin(), alloc_vars.end(), I) != alloc_vars.end())
      return true;

    return false;
  }

  bool isInMap5(GlobalVariable *GV){

    if (std::find(hotPatchInstSet_globalVar.begin(), hotPatchInstSet_globalVar.end(), GV) != hotPatchInstSet_globalVar.end())
      return true;

    return false;
  }
  
  bool isInMap6(GlobalVariable *GV){

    if (std::find(patchGlobalVar.begin(), patchGlobalVar.end(), GV) != patchGlobalVar.end())
      return true;

    return false;
  }
  //bool isPatchInstr(Instruction *I){

  //  if(patchInstSet.find(I) != patchInstSet.end())
  //    return true;
    
  //  return false;
  //}

  //void deleteFromMap(Instruction *I) {

  //  auto iter = hotPatchInstSet.find(I);
  //  if (iter != hotPatchInstSet.end()) {
  //    debug << "Removing from set: " << *I << "\n";
  //    hotPatchInstSet.erase(iter);
  //  }
  //}

  void insertInSet(Instruction *I) {

    if (!isInMap(I)) {
      // debug << "Inserting into vector: " << *I << "\n";
      hotPatchInstSet.push_back(I);
    }
  }

  void insertInSet2(Instruction *I) {

    if (!isInMap2(I)) {
      // debug << "Inserting into vector2: " << *I << "\n";
      temp_hotPatchInstSet.push_back(I);
    }

  }

  void insertInSet3(Instruction *I) {

    if (!isInMap3(I)) {
      //debug << "Inserting into vector3: " << *I << "\n";
      alloc_vars_temp.push_back(I);
    }

  }

  void insertInSet4(Instruction *I) {

    if (!isInMap4(I)) {
      //debug << "Inserting into vector4: " << *I << "\n";
      alloc_vars.push_back(I);
    }

  }

  void deleteFromVector(Instruction *I){
    auto it = std::find(alloc_vars_temp.begin(), alloc_vars_temp.end(), I);
    if (it != alloc_vars_temp.end()) {
      alloc_vars_temp.erase(it);
    }
  }

  void deleteFromVector2(Instruction *I){
    auto it = std::find(patchInstSet.begin(), patchInstSet.end(), I);
    if (it != patchInstSet.end()) {
      patchInstSet.erase(it);
    }
  }

  


  // void insertInSet(Value *I) {
  //   debug << "Inserting into set: " << *I << "\n";
  //   patchValueSet.insert(I);
  // }

  //void insertInMapPVM(Instruction *I, std::vector<Value *> V) {
  //  debug << "Inserting into patchValueMap: " << I << ", and" << *V << "\n";
  //  patchValueMap[I] = V;
  //}

  Loop* instrIsInLoop(LoopInfo &LoopInfo, Instruction *Instr1) {
    for (auto Loop : LoopInfo)
      if (instrIsInLoopUtil(Loop, Instr1))
        return Loop;
    return NULL;
  }

  bool instrIsInLoopUtil(Loop *Loop, Instruction *Instr) {
    if (Loop->contains(Instr))
      return true;

    return false;
  }

  bool instrIsInIf(Instruction *ins, BasicBlock *BB_End, DominatorTree &DT){
    // debug << "It is analyzing the instructuion for if: " << *ins << "\n";
    BasicBlock *BB_DI = ins->getParent();
    return DT.dominates(BB_DI, BB_End); //If instruction is not in the if then return true. 
  }


  // This function finds Basic Blocks between "patch" and "call patch"//
  vector<BasicBlock *> findBBs(BasicBlock *BB_CP, BasicBlock *BB_P, Function &F, DominatorTree &DT, PostDominatorTree &PDT, bool isInLoop) {
    vector<BasicBlock *> tempBB;
    for (scc_iterator<Function *> I = scc_begin(&F), IE = scc_end(&F); I != IE; ++I) {

      // Obtain the vector of BBs in this SCC and print it out.
      const std::vector<BasicBlock *> &SCCBBs = *I;

      for (std::vector<BasicBlock *>::const_iterator BBI = SCCBBs.begin(), BBIE = SCCBBs.end(); BBI != BBIE; ++BBI) {

        BasicBlock *b = const_cast<llvm::BasicBlock *>(*BBI);
        
        // if(isInLoop){
        //   if(DT.dominates(BB_P,b)){
        //     tempBB.push_back(b);
        //     debug << "Added a BB**" << *(b->getFirstNonPHI())<< "\n";
        //     continue;
        //   }
        // }

        if(PDT.dominates(BB_P,b) && DT.dominates(BB_CP,b)){
          tempBB.push_back(b);
          // debug << "Added a BB**" << *(b->getFirstNonPHI())<< "\n";
        }
      }
    }
    //reverse(tempBB.begin(), tempBB.end());
    // tempBB.push_back(BB_P); 
    return tempBB;
  }

  void logTaintedLine(Instruction *I, std::vector<Value *> TaintedVar) {
    //for (BasicBlock::const_iterator It = b->begin(); It != b->end(); ++It) {
    //      Instruction *ins = const_cast<llvm::Instruction *>(&*It);
    int LineNumber = getSourceCodeLine(I);
    for(auto iter = TaintedVar.begin(); iter != TaintedVar.end(); iter++){
    //for(vector<Value*>::iterator iter = TaintedVar.begin(); iter != TaintedVar.end(); iter++){
      Value *value_temp = const_cast<llvm::Value *>(*iter);
      //string ResultString = "Line " + to_string(LineNumber) + ": " +
      //                    (*iter)->getName().str() + " is tainted";
      
      // debug << "Values: " << *value_temp << "\n";

      //Result[LineNumber] = ResultString;
    }
    
    //OrderedTaintedVariableLines[TaintedVar] = LineNumber;
    //OrderedTaintedVariables[LineNumber] = TaintedVar;
  }


  //*************Finalize the result**************//
  //Removing repeated instructions, sort it. Finally, concat the instructions to the official patch.
  void hotpatchGenerating(queue<Instruction *> Worklist , vector<BasicBlock *> allBB , vector<int> lnum){

    bool see = false;
    
    debug << "Start Finalizing :) \n";
    
    //Removing Duplicate Instructions:
    while(!Worklist.empty()){
      Instruction *temp_instr = Worklist.front();
      // debug << "INSTRUCTION IS :::  " << *temp_instr << "\n";
      Worklist.pop();
      insertInSet(temp_instr);
      if(isa<AllocaInst>(temp_instr)){
        // debug << "Allocation INSTRUCTION IS :::  " << *temp_instr << "\n";
        insertInSet2(temp_instr);
      }
      // insertInSet2(temp_instr);
    }

    //Sorting the hotpatch:
    reverse(allBB.begin(), allBB.end());
    for (auto b : allBB) {
    // Iterate over all the instructions within a basic block.
      for (BasicBlock::const_iterator It = b->begin(); It != b->end(); ++It) {
        Instruction *ins = const_cast<llvm::Instruction *>(&*It);
        // debug << "The Impact Instructions: "<< *ins << "\n";
        if(isInMap(ins) && !isInVec(ins)){
          insertInSet2(ins);
        }
      }
    }
    //OutPut: Sorted instructions in  "temp_hotPatchInstSet"

    // for (auto ins_temp : patchInstSet){
    //   debug << "The Patch Instructions: " << *ins_temp << "\n" ;
    // }
    // for (auto ins_temp2 : temp_hotPatchInstSet){
    //   debug << "The Temp Instructions: " << *ins_temp2 << "\n" ;
    // }
    
    for(auto Ins : patchInstSet){
      Instruction *ins = const_cast<llvm::Instruction *>(&*Ins);
      if(auto CI = dyn_cast<CallInst>(ins)){
        StringRef name = CI->getCalledFunction()->getName();
        if(name == "TRAMPOLINE_FUNCTION"){
            // debug << "This is TRAMPOLINE IN the Patch, Remove IT: " << *CI << "\n";
        }
      }
    }

    //Concat to the official patch: (temp_hotPatchInstSet   and     patchInstSet)
    temp_hotPatchInstSet.insert(temp_hotPatchInstSet.end(), patchInstSet.begin(), patchInstSet.end());
    
    
    //auto end = temp_hotPatchInstSet.end();

    //for (auto it = temp_hotPatchInstSet.begin(); it != end; ++it) {
    //    end = std::remove(it + 1, end, *it);
    //}
 
    //temp_hotPatchInstSet.erase(end, temp_hotPatchInstSet.end());

    // debug << "\n \n*********************Congratulations :)***************************\n";
    // debug << "*********************The Patching is Done***************************"<< "\n";
    // debug << "********************************************************************"<< "\n";

    // for (auto stVar : hotPatchInstSet_structure) {
    //   debug << "Global Structure:" << *stVar << "\n";
    // }
    // for (auto globVar : hotPatchInstSet_globalVar) {
    //   debug << "Global Variable:" << *globVar << "\n";
    // }

    // for (auto inst : temp_hotPatchInstSet) {
    //   debug << *inst << "\n";
    // }

    writeVectorsToFile(temp_hotPatchInstSet , hotPatchInstSet_globalVar, hotPatchInstSet_structure, lnum);
  }
  



  //*************************************************************************//
  //LLVM has some methods for instruction, and we can check does it write in memory or have side effects. We can check these things when
  //we are analyzing the patch, and for example say to RTOS developer, this patch are writing in memory. Alarm to him.

  //Function to analyze basic blocks (instructions) for calculating the correct patch.
  void backwardAnalyze(vector<BasicBlock *> allBB, vector<int> lnum, int lnump, BasicBlock *BB_CP, BasicBlock *BB_P, Function &F, DominatorTree &DT, PostDominatorTree &PDT, LoopInfo &LoopInfo, BasicBlock *BB_End){
    //Iterate on basicblocks (start from the patch instructions) and go backward//
    
    queue<Instruction *> Worklist;
    queue<Instruction *> temp_Worklist;
    bool inFor = false;
    bool inIf = false;

    debug << "Start Analysing :) \n";

    //Iterate on patch values.
    for(auto It = patchValueMap.cbegin(); It != patchValueMap.cend();++It){
      Instruction *inst_temp = It->first;//The corresponding patch instruction for that values. 
      std::vector<Value *> valvector_temp = It->second;//The vector of values for that instruction.

      //logTaintedLine(inst_temp, valvector_temp);

      for(auto iter = valvector_temp.begin(); iter != valvector_temp.end(); iter++){
        Value *val_temp = const_cast<llvm::Value *>(*iter);
        //debug << "Working on Value: "<< *val_temp << "\n";

        if(isa<AllocaInst>(val_temp)){
          // debug << "*****************GLOBAL1" << *val_temp <<"\n";
          Instruction *ValueUserInst = dyn_cast<Instruction>(val_temp);
          temp_Worklist.push(ValueUserInst);
        }
        
        if(isa<GlobalVariable>(val_temp)){
          GlobalVariable *ValueUserGV = dyn_cast<GlobalVariable>(val_temp);
          if(!isInMap5(ValueUserGV)){
            // debug << "*****************GLOBAL1" << *val_temp <<"\n";
            hotPatchInstSet_globalVar.push_back(ValueUserGV);
          }
          patchGlobalVar.push_back(ValueUserGV);
        }


        if (!isa<Constant>(val_temp)){ //We need to check this due to for example if one value is "1", they insert all instructions that one of their operand is "1".
          for(User *U : val_temp->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              if(Loop* l = instrIsInLoop(LoopInfo,ValueUserInst)){ //Attention: I think we need also check this for other values in the "While"
                inFor = true;
                for (auto *Block : l->getBlocks()) {
                  for (auto &Inst : *Block) {
                    //debug << "*First Round* Pushing to the Worklist (for loops): " << &Inst <<"\n";
                    Worklist.push(&Inst);
                    temp_Worklist.push(&Inst);
                  }
                }
              }else if(!instrIsInIf(ValueUserInst, BB_End, DT) && !inFor){ //This instruction is in the "if" and not in the "for"
                //debug << "This instruction is in the if statement: " << *ValueUserInst <<"\n";
                inIf = true;
                BasicBlock *BB = ValueUserInst->getParent();
                Instruction *TI = BB->getTerminator();
                //debug << "The terminator instruction is: " << *TI <<"\n";
                
                if (TI->getNumSuccessors() == 2) {
                    BasicBlock *IfBlock = TI->getSuccessor(0);
                    BasicBlock *ElseBlock = TI->getSuccessor(1);
                    bool inIf = true;
                    for (BasicBlock *Block : { IfBlock, ElseBlock }) {
                        for (Instruction &Inst : make_range(Block->begin(), Block->end())) {
                            //debug << "*First Round* Pushing to the Worklist (if/else): " << Inst << "\n";
                            Worklist.push(&Inst);
                            temp_Worklist.push(&Inst);
                            if (&Inst == TI) {
                                inIf = false;
                            }
                        }
                        if (!inIf) {
                            std::swap(IfBlock, ElseBlock);
                        }
                  }
                }
                else{
                  BasicBlock *IfBlock = TI->getParent();
                  for (Instruction &Inst : make_range(IfBlock->begin(), IfBlock->end())) {
                        //debug << "*First Round* Pushing to the Worklist (if): " << Inst << "\n";
                        Worklist.push(&Inst);
                        temp_Worklist.push(&Inst);
                  }
                }

                BasicBlock *PredBB = BB->getSinglePredecessor();
                Instruction *TermInst = PredBB->getTerminator();
                //debug << "The terminator instruction is: " << *TermInst <<"\n";

                if (BranchInst *BI = dyn_cast<BranchInst>(TermInst)) {
                  if (BI->isConditional()) {
                    Value *Cond = BI->getCondition();
                    if (Instruction *CondInst = dyn_cast<Instruction>(Cond)) {

                      for (Use &U : CondInst->operands()) {
                          if (Instruction *OpInst = dyn_cast<Instruction>(U.get())) {
                              //debug << "*First Round* Pushing to the Worklist (condition): " << *OpInst << "\n";
                              Worklist.push(OpInst);
                              temp_Worklist.push(OpInst);
                          }
                      }
                    }
                  }
                }
                // Value *Cond = TI->getCondition();
                // if (Instruction *CondInst = dyn_cast<Instruction>(Cond)) {
                //       for (Use &U : CondInst->operands()) {
                //           if (Instruction *OpInst = dyn_cast<Instruction>(U.get())) {
                //               debug << "*First Round* Pushing to the Worklist (condition): " << *OpInst << "\n";
                //               Worklist.push(OpInst);
                //               temp_Worklist.push(OpInst);
                //           }
                //       }
                // }
              }else{
                //debug << "*First Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
                Worklist.push(ValueUserInst);
                temp_Worklist.push(ValueUserInst);
              }
              if (BranchInst *BI = dyn_cast<BranchInst>(ValueUserInst)) {
                if (BI->isConditional()) {
                    Value *Cond = BI->getCondition();
                    if (Instruction *CondInst = dyn_cast<Instruction>(Cond)) {
                      for (Use &U : CondInst->operands()) {
                          if (Instruction *OpInst = dyn_cast<Instruction>(U.get())) {
                              //debug << "*First Round* Pushing to the Worklist (condition): " << *OpInst << "\n";
                              Worklist.push(OpInst);
                              temp_Worklist.push(OpInst);
                          }
                      }
                    }
                }
              }              
              //Tainted.insert(ValueUserInst);
            }
          }
        }
      }
    }
    while(!Worklist.empty()){
      Instruction *ValueUser = Worklist.front();
      Worklist.pop();
      // debug << "*** While *** User Instruction: " << *ValueUser <<"\n";
      //if(Tainted.count(ValueUser) > 0){
      //  continue;
      //}

      if(isa<llvm::StoreInst>(ValueUser)){
        //Recursively explore patch value user instructions
        StoreInst *SI = cast<StoreInst>(ValueUser);
        //debug << "*** While *** User Instruction for value: " << *SI <<"\n";

        if(!SI){
          continue;
        }

        //auto val1 = dyn_cast<Instruction>(&*SI->getOperand(0));
        //auto val2 = dyn_cast<Instruction>(&*SI->getOperand(1));
        //debug << "*** While *** User Instruction for value: " << *val1 << " , " << *val2 <<"\n";
        
        auto val1 = SI->getOperand(0);
        auto val2 = SI->getOperand(1);
        //debug << "*** While *** User Instruction for value: " << *val1 << " , " << *val2 <<"\n";

        //if(!val1 || !val2){
        //  continue;
        //}

        if(isa<AllocaInst>(val1)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST StoreInst1: " << *ValueUserInst <<"\n";
        }
        if(isa<AllocaInst>(val2)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val2);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST StoreInst2: " << *ValueUserInst <<"\n";
        }

        if(isa<GlobalVariable>(val1)){
          // debug << "*****************GLOBAL2" << *val1 <<"\n";
          GlobalVariable *ValueUserGV = dyn_cast<GlobalVariable>(val1);
          if(!isInMap5(ValueUserGV)){
            hotPatchInstSet_globalVar.push_back(ValueUserGV);
          }
        }
        if(isa<GlobalVariable>(val2)){
          // debug << "*****************GLOBAL3" << *val2 <<"\n";
          GlobalVariable *ValueUserGV = dyn_cast<GlobalVariable>(val2);
          if(!isInMap5(ValueUserGV)){
            hotPatchInstSet_globalVar.push_back(ValueUserGV);
          }
        }




        //Value 1
        if(Tainted.count(val1) > 0 || isa<Constant>(*val1)){
            //Nothing
        }else{
          Tainted.insert(val1);

          Instruction *val1_temp = dyn_cast<Instruction>(val1);

          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
              // debug << "* INSERTING INTO WORKLIST StoreInst3: " << *val1_temp <<"\n";
          }

          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);

          // debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";

          for(User *U : val1->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val1 << " is " << *ValueUserInst <<"\n";
              //debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
              // debug << "* INSERTING INTO WORKLIST StoreInst4: " << *ValueUserInst <<"\n";
            }
          }
        }

        //Value 2
        if(Tainted.count(val2) > 0 || isa<Constant>(*val2)){
            //Nothing
        }
        else{
          Tainted.insert(val2);

          Instruction *val1_temp = dyn_cast<Instruction>(val2);
          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
              // debug << "* INSERTING INTO WORKLIST StoreInst5: " << *val1_temp <<"\n";
          }
          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);
          // debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";


          //debug << "*** While *** User Instruction for value: " << val2 << "\n";
          for(User *U : val2->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val2 << " is " << *ValueUserInst <<"\n";
              //debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              // debug << "* INSERTING INTO WORKLIST StoreInst6: " << *ValueUserInst <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
            }
          }
        }




        

        // if(auto TaintedVar = dyn_cast<Instruction>(&*(SI->getPointerOperand()))){
          
        //   if(Tainted.count(TaintedVar) > 0){
        //     continue;
        //   }
        //   Tainted.insert(TaintedVar);

        //   if(isa<AllocaInst>(TaintedVar)){
        //     temp_Worklist.push(TaintedVar);
        //   }

        //   for(User *U : TaintedVar->users()){
        //     Instruction *ValueUserInst = dyn_cast<Instruction>(U);

        //     int LineNumber = getSourceCodeLine(ValueUserInst);
        //     if(LineNumber < lnum[0] && LineNumber > lnump){
        //       //debug << "*** While *** User Instruction for value: " << *TaintedVar << " is " << *ValueUserInst <<"\n";
        //       debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
        //       Worklist.push(ValueUserInst);
        //       temp_Worklist.push(ValueUserInst);
        //     }
        //   }
        // }
        
      }else if (isa<llvm::BinaryOperator>(ValueUser)) {
      //else if (auto BO = dyn_cast<BinaryOperator>(&*ValueUser)) {
        BinaryOperator *BO = cast<BinaryOperator>(ValueUser);
        //debug << "*** While *** User Instruction for value: " << *BO <<"\n";

        if(!BO){
          continue;
        }

        //auto val1 = dyn_cast<Instruction>(&*BO->getOperand(0));
        //auto val2 = dyn_cast<Instruction>(&*BO->getOperand(1));
        //debug << "*** While *** User Instruction for value: " << *BO <<"\n";

        auto val1 = BO->getOperand(0);
        auto val2 = BO->getOperand(1);

        //if(!val1 || !val2){
        //  continue;
        //}

        if(isa<AllocaInst>(val1)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST BinaryOperator1: " << *ValueUserInst <<"\n";
        }
        if(isa<AllocaInst>(val2)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val2);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST BinaryOperator2: " << *ValueUserInst <<"\n";
        }

        if(isa<GlobalVariable>(val1)){
          // debug << "*****************GLOBAL4" << *val1 <<"\n";
          GlobalVariable *ValueUserGV = dyn_cast<GlobalVariable>(val1);
          if(!isInMap5(ValueUserGV)){
            hotPatchInstSet_globalVar.push_back(ValueUserGV);
          }
        }
        if(isa<GlobalVariable>(val2)){
          // debug << "*****************GLOBAL5" << *val2 <<"\n";
          GlobalVariable *ValueUserGV = dyn_cast<GlobalVariable>(val2);
          if(!isInMap5(ValueUserGV)){
            hotPatchInstSet_globalVar.push_back(ValueUserGV);
          }
        }

        if(Tainted.count(val1) > 0 || isa<Constant>(*val1)){
            //Nothing
        }else{
          Tainted.insert(val1);

          Instruction *val1_temp = dyn_cast<Instruction>(val1);

          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
              // debug << "* INSERTING INTO WORKLIST BinaryOperator3: " << *val1_temp <<"\n";
          }

          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);
          // debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";

          for(User *U : val1->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val1 << " is " << *ValueUserInst <<"\n";
              // debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              // debug << "* INSERTING INTO WORKLIST BinaryOperator4: " << *val1_temp <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
            }
          }
        }
        if(Tainted.count(val2) > 0 || isa<Constant>(*val2)){
            //Nothing
        }
        else{
          Tainted.insert(val2);

          Instruction *val1_temp = dyn_cast<Instruction>(val2);

          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
              // debug << "* INSERTING INTO WORKLIST BinaryOperator5: " << *val1_temp <<"\n";
          }
          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);
          // debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";

          //debug << "*** While *** User Instruction for value: " << val2 << "\n";
          for(User *U : val2->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val2 << " is " << *ValueUserInst <<"\n";
              // debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              // debug << "* INSERTING INTO WORKLIST BinaryOperator6: " << *ValueUserInst <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
            }
          }
        }
      }else if(isa<llvm::ZExtInst>(ValueUser)){ //Specially for CVE-2020-10021

        ZExtInst *ZE = cast<ZExtInst>(ValueUser);
        //debug << "*** While *** User Instruction for value: " << *ZE <<"\n";
        auto val1 = ZE->getOperand(0);
        //debug << "*** Special *** : " << *val1 <<"\n";

        if(isa<AllocaInst>(val1)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST ZExtInst1: " << *ValueUserInst <<"\n";
        }

        if(Tainted.count(val1) > 0 || isa<Constant>(*val1)){
            //Nothing
        }else{
          Tainted.insert(val1);

          Instruction *val1_temp = dyn_cast<Instruction>(val1);

          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
              // debug << "* INSERTING INTO WORKLIST ZExtInst2: " << *val1_temp <<"\n";
          }

          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);
          // debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";

          for(User *U : val1->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val1 << " is " << *ValueUserInst <<"\n";
              // debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              // debug << "* INSERTING INTO WORKLIST ZExtInst3: " << *ValueUserInst <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
            }
          }
        }
      }else if(isa<llvm::LoadInst>(ValueUser)){
        LoadInst *LI = cast<LoadInst>(ValueUser);


        // From where are you loading?
        auto val1 = LI->getOperand(0);
        // debug << "*****************LOAD     " << *val1 <<"\n";

        // if (auto* GEP = dyn_cast<GetElementPtrInst>(val1)) {
        //   debug << "*****************Khoddaaaa     ********************" <<"\n";
        //   Value* ptrOp = GEP->getPointerOperand();
        //   Type* ptrType = ptrOp->getType()->getPointerElementType();
        //   debug << "*****************Khoddaaaa     " << *ptrOp <<"\n";
        // }


        if(isa<AllocaInst>(val1)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST LOAD1: " << *ValueUserInst <<"\n";
        }

        // if (auto* GEP = dyn_cast<GetElementPtrInst>(val1)) {
        //   Value* ptrOp = GEP->getPointerOperand();
        //   if (auto* GV = dyn_cast<GlobalVariable>(ptrOp)) {
        //     debug << "*****************GLOBAL: " << *GV << "\n";
        //     hotPatchInstSet_globalVar.push_back(GV);
        //   }
        // }

        if(isa<GlobalVariable>(val1)){
          // debug << "*****************GLOBAL6" << *val1 <<"\n";
          GlobalVariable *ValueUserGV = dyn_cast<GlobalVariable>(val1);
          if(!isInMap5(ValueUserGV)){
            hotPatchInstSet_globalVar.push_back(ValueUserGV);
          }
        }

        if(Tainted.count(val1) > 0 || isa<Constant>(*val1)){
            //Nothing
        }else{
          Tainted.insert(val1);

          Instruction *val1_temp = dyn_cast<Instruction>(val1);
          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              // debug << "* INSERTING INTO WORKLIST LOAD2: " << *val1_temp <<"\n";
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
          }
          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);
          //debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";

          for(User *U : val1->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val1 << " is " << *ValueUserInst <<"\n";
              //debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              // debug << "* INSERTING INTO WORKLIST LOAD3: " << *ValueUserInst <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
            }
          }
        }
      }else if(isa<llvm::IntToPtrInst>(ValueUser)){ 

        IntToPtrInst *ZE = cast<IntToPtrInst>(ValueUser);
        //debug << "*** While *** User Instruction for value: " << *ZE <<"\n";
        auto val1 = ZE->getOperand(0);

        if(isa<AllocaInst>(val1)){
          Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
          temp_Worklist.push(ValueUserInst);
          // debug << "* INSERTING INTO WORKLIST IntToPtrInst1: " << *ValueUserInst <<"\n";
        }

        if(Tainted.count(val1) > 0 || isa<Constant>(*val1)){
            //Nothing
        }else{
          Tainted.insert(val1);

          Instruction *val1_temp = dyn_cast<Instruction>(val1);

          int LineNumber = getSourceCodeLine(val1_temp);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
              // debug << "* INSERTING INTO WORKLIST IntToPtrInst2: " << *val1_temp <<"\n";
          }

          // Worklist.push(val1_temp);
          // temp_Worklist.push(val1_temp);
          // debug << "*Second Round* New Pushing to the Worklist: " << *val1_temp <<"\n";

          for(User *U : val1->users()){
            Instruction *ValueUserInst = dyn_cast<Instruction>(U);

            int LineNumber = getSourceCodeLine(ValueUserInst);
            if(LineNumber < lnum[0] && LineNumber > lnump){
              //debug << "*** While *** User Instruction for value: " << *val1 << " is " << *ValueUserInst <<"\n";
              // debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst <<"\n";
              // debug << "* INSERTING INTO WORKLIST IntToPtrInst3: " << *ValueUserInst <<"\n";
              Worklist.push(ValueUserInst);
              temp_Worklist.push(ValueUserInst);
            }
          }
        }
      }else if (isa<GetElementPtrInst>(ValueUser)) {
          GetElementPtrInst *GEP = cast<GetElementPtrInst>(ValueUser);
          // debug << "*** While *** User Instruction for value: " << *GEP << "\n";
          auto val1 = GEP->getOperand(0);
          //debug << "*** Special *** : " << *val1 << "\n";

          // Check if val1 is an AllocaInst
          if (isa<AllocaInst>(val1)) {
              Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
              temp_Worklist.push(ValueUserInst);
              //debug << "* INSERTING INTO WORKLIST GetElementPtrInst1: " << *ValueUserInst << "\n";
          }

          if (Tainted.count(val1) > 0 || isa<Constant>(*val1)) {
              // Nothing
          } else {
              Tainted.insert(val1);

              Instruction *val1_temp = dyn_cast<Instruction>(val1);

              int LineNumber = getSourceCodeLine(val1_temp);
              if (LineNumber < lnum[0] && LineNumber > lnump) {
                  Worklist.push(val1_temp);
                  temp_Worklist.push(val1_temp);
                  //debug << "* INSERTING INTO WORKLIST GetElementPtrInst2: " << *val1_temp << "\n";
              }

              for (User *U : val1->users()) {
                  Instruction *ValueUserInst = dyn_cast<Instruction>(U);

                  int LineNumber = getSourceCodeLine(ValueUserInst);
                  if (LineNumber < lnum[0] && LineNumber > lnump) {
                      //debug << "*** While *** User Instruction for value: " << *val1 << " is " << *ValueUserInst << "\n";
                      //debug << "*Second Round* Pushing to the Worklist: " << *ValueUserInst << "\n";
                      Worklist.push(ValueUserInst);
                      temp_Worklist.push(ValueUserInst);
                      //debug << "* INSERTING INTO WORKLIST GetElementPtrInst3: " << *ValueUserInst << "\n";
                  }
              }
          }
      }else if (auto *BC = dyn_cast<BitCastInst>(ValueUser)) {
          // debug << "*** While *** User Instruction for value: " << *BC << "\n";
          auto val1 = BC->getOperand(0);
          if (isa<AllocaInst>(val1)) {
            Instruction *ValueUserInst = dyn_cast<Instruction>(val1);
            temp_Worklist.push(ValueUserInst);
          }
          if (Tainted.count(val1) > 0 || isa<Constant>(*val1)) {
            //Nothing
          } else {
            Tainted.insert(val1);

            Instruction *val1_temp = dyn_cast<Instruction>(val1);

            int LineNumber = getSourceCodeLine(val1_temp);
            if (LineNumber < lnum[0] && LineNumber > lnump) {
              Worklist.push(val1_temp);
              temp_Worklist.push(val1_temp);
            }

            for (User *U : val1->users()) {
              Instruction *ValueUserInst = dyn_cast<Instruction>(U);

              int LineNumber = getSourceCodeLine(ValueUserInst);
              if (LineNumber < lnum[0] && LineNumber > lnump) {
                Worklist.push(ValueUserInst);
                temp_Worklist.push(ValueUserInst);
              }
            }
          }
        }


      for(User *U: ValueUser->users()){
        Instruction *Ins = dyn_cast<Instruction>(U);
        if(Tainted.count(Ins) > 0 || isa<llvm::CallInst>(Ins)){
          continue;
        }
        //debug << "*Third Round* Pushing to the Worklist: " << *Ins <<"\n";
        int LineNumber = getSourceCodeLine(Ins);
          if(LineNumber < lnum[0] && LineNumber > lnump){
              // debug << "* INSERTING INTO WORKLIST: " << *Ins <<"\n";
              Worklist.push(Ins);
              temp_Worklist.push(Ins);
              Tainted.insert(Ins);
        }
        // Worklist.push(Ins);
        // temp_Worklist.push(Ins);
        // Tainted.insert(Ins);
      }
    }

    //Final Step
    hotpatchGenerating(temp_Worklist,allBB,lnum);


    //for(auto &line: Result){
    //  debug << line.second << "\n";
    //}


    // Instruction *ins_temp = (*(patchInstSet.begin()))->getPrevNonDebugInstruction();//Get the previous instruction of the patch's first instruction. 

    // for (auto b : findBBs(BB_CP, BB_P, F, DT, PDT)) {
    //   // Iterate over all the instructions within a basic block.
    //   for (BasicBlock::reverse_iterator It = b->rbegin(), e = b->rend(); It != e; ++It) {
    //     Instruction *ins = const_cast<llvm::Instruction *>(&*It);

        
    //     //if(ins_temp == NULL && b == BB_P){
    //       //If patch code is the first instruction of basic block -> So ignore this basic block and continue to other basic blocks.//
    //       //break;
    //     //}
    //     if(patchInstSet.find(ins) == patchInstSet.end()){
    //       //*ins* is not one of the patch instruction, so we need to analyze it.

    //       if(getSourceCodeLine(ins) == lnump){
    //         debug << "*********The Patching is Done********"<< "\n";
    //         break;
    //       }
    //       else{
    //         //debug << "backwardAnalyze Current Instruction is:  " << *ins << "\n";
    //         if(instrsAreInSameLoop(LoopInfo,ins)){
    //           debug << "This instruction is in for loop: " << *ins << "\n";
    //           //Do different thing.



    //         }

    //         /********************* Handle Alloca Instruction ********************/
    //         if (isa<llvm::AllocaInst>(ins)) {
    //           debug << "This instruction is Allocation: " << *ins << "\n";


    //         }

    //         /********************* Handle Store Instruction *********************/
    //         else if (isa<llvm::StoreInst>(ins)) {
    //           debug << "This instruction is Store: " << *ins << "\n";

    //           StoreInst *SI = cast<StoreInst>(ins);
    //           // What are you storing?
    //           auto val1 = SI->getOperand(0);
    //           // Where are you storing?
    //           auto val2 = SI->getOperand(1);

              
    //           //Find val2 in patchValueMap. If you find it, you should replace it with val1.
    //           for (auto &entry : patchValueMap) {
    //             Instruction *inst = entry.first;
    //             debug << "**The Patch instruction is : " << *inst << "\n";
    //             const std::vector<Value *> &values = entry.second;
    //             for (Value *val : values) {
    //                 if(val2 == val){
    //                   debug << "** Replacing " << *val << " with " << *val1 << "\n";
    //                   Value *copy = val;
    //                   copy = val1;
    //               }
    //             }
    //           }
    




    //           // if(val2 == (*patchValueSet.begin())){
    //           //   patchValueSet.erase((*patchValueSet.begin()));
    //           //   insertInSet(val1);

    //           // }else if(val2 == (*patchValueSet.end())){
    //           //   patchValueSet.erase((*patchValueSet.end()));
    //           //   insertInSet(val1);
    //           // }else{
    //           //   debug << "Ignore" << "\n";
    //           // }
    //         }

    //         /********************** Handle Load Instruction *******************/
    //         else if (isa<llvm::LoadInst>(ins)) {
    //           debug << "This instruction is Load: " << *ins << "\n";

    //           LoadInst *LI = cast<LoadInst>(ins);

    //           // From where are you loading?
    //           auto val1 = LI->getOperand(0);



        
    //         }

    //         /********************* Handle Branch instruction ***************/
    //         else if (isa<llvm::BranchInst>(ins)) {
    //           debug << "This instruction is Branch: " << *ins << "\n";

    //           //Hard case. Think about that. You have to use weakest algorithm.//



    //         }

    //         /********************* Handle Binary instruction ***************/
    //         else if (isa<llvm::BinaryOperator>(ins)) {
    //           debug << "This instruction is Binary: " << *ins << "\n";

    //           BinaryOperator *BO = cast<BinaryOperator>(ins);
    //           auto val1 = BO->getOperand(0);
    //           auto val2 = BO->getOperand(1);


    //           for (auto &entry : patchValueMap) {
    //             Instruction *inst = entry.first;
    //             debug << "**The Patch instruction is : " << *inst << "\n";
    //             const std::vector<Value *> &values = entry.second;
    //             for (Value *val : values) {
    //                 if(val2 == val){
    //                   debug << "** Replacing " << *val << " with " << *val1 << "\n";
    //                   Value *copy = val;
    //                   copy = val1;
    //               }
    //             }
    //           }

    //         }

    //         /********************* Handle Compare instruction ***************/
    //         else if (isa<llvm::CmpInst>(ins)) {
    //           debug << "This instruction is Compare: " << *ins << "\n";

    //           CmpInst *cmpInst = dyn_cast<CmpInst>(ins);
    //           Value *secondOperand = cmpInst->getOperand(1);
    //           ConstantInt *CI = dyn_cast<ConstantInt>(secondOperand);
    //           debug << "This instruction is Compare: " << *CI << "\n";
              
    //         }
    //       }
    //     }
    //   }
    // }
  }

  void patchAnalyze(){
    std::vector<Value*> values;
    std::vector<string> variables;

    for (auto pis : patchInstSet)
    {
      // values.clear();
      // variables.clear();
      // debug << "Instruction name is: " << getShortValueName(pis)  << "\n";
      // for(User::op_iterator i = pis->op_begin(), j = pis->op_end(); i != j; ++i){
      //   Value* var = *i;
      //   if(isa<Instruction>(var) || isa<Argument>(var))
      //   {
      //     if(std::find(values.begin(),values.end(),var) != values.end()){
      //       continue;
      //     }
      //     else{
      //       values.push_back(var);
      //       variables.push_back((string)var->getName());
      //       debug << "See this value: " << getShortValueName(var)  << "\n";
      //     }
      //   }
      // }
      // patchValueMap[pis] = values;
      // debug << "Variables used by this instruction " << *pis  << "is: \n";

      // printStringSet(&variables);

      if(isa<llvm::LoadInst>(pis)){
        //debug << "This instruction is Load: " << *pis << "\n";
        LoadInst *LI = cast<LoadInst>(pis);
        // From where are you loading?
        auto val1 = LI->getOperand(0);

        patchValueMap[pis] = {val1};
        // debug << "The value name: " << *val1 << ", " << "\n";
        //insertInMapPVM(pis,val1);

        
      }else if (isa<llvm::CmpInst>(pis)){
        //debug << "This instruction is Compare: " << *pis << "\n";
        CmpInst *cmpInst = dyn_cast<CmpInst>(pis);

        auto *val1 = cmpInst->getOperand(0);
        auto *val2 = cmpInst->getOperand(1);

        patchValueMap[pis] = {val1};
        //debug << "The value name for Compare is: " << *val1 << ", " << cmpInst->getName() << "\n";
        //insertInMapPVM(pis,secondOperand);


      }else if(isa<llvm::StoreInst>(pis)){
        //debug << "This instruction is Store: " << *pis << "\n";
        StoreInst *SI = cast<StoreInst>(pis);
        // What are you storing?
        auto val1 = SI->getOperand(0);
        // Where are you storing?
        auto val2 = SI->getOperand(1);

        patchValueMap[pis] = {val1,val2};
        //debug << "The value name for Store is: " << val1->getName() << ", " << val2->getName() << "\n";

        //insertInMapPVM(pis,secondOperand);


      }else if (isa<llvm::BinaryOperator>(pis)) {
        //debug << "This instruction is Binary: " << *pis << "\n";
        BinaryOperator *BO = cast<BinaryOperator>(pis);

        auto val1 = BO->getOperand(0);
        auto val2 = BO->getOperand(1);

        patchValueMap[pis] = {val1,val2};
        //debug << "The value name: " << *val1 << ", " << *val2 << "\n";
      }
    }
  }

  bool runOnFunction(Function &F) override
  {
    // debug << "Enter to function"
    //       << "\n";

    std::string funcName = demangle(F.getName().str().c_str());
    //int lineNumPatch;
    //int lineNumPatch[3] = {25,26,27}; // The lines of the patch in the vulnerable function (get
                      // from programmer)

    // int lineNumPatch[3] = {38,39,40};
    //int lineNumPatch[3] = {82,86,87};
    std::vector<int> lineNumPatch = LineNumPatch;
    
    Module *M = F.getParent();

    int iteratorOnPatch = 0;
    std::string funcPatchName; // The name of the function that patch is added
                               // (get from programmer)
    BasicBlock *BB_End = &(F.back());    // The end basic block
    BasicBlock *BB_Entry = &(F.front()); // The entry basic block

    DominatorTree &DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
    PostDominatorTree &PDT =
        getAnalysis<PostDominatorTreeWrapperPass>().getPostDomTree();
    LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();

    bool done = false;
    bool seeFirst = false;
    bool isDynamicNested = false;
    BasicBlock *BB_firstLine;
    Instruction *firstPatchInstr;

    //debug << "Name of function: " << funcName << "\n";

    // funcPatchName = "packet_length_decode";
    // funcPatchName = "infoTransfer";
    funcPatchName = FuncPatchName;
    // Only process vulnerable function
    if (funcName != funcPatchName) {
      // debug << "The Function is incorrect" << "\n";
      return false;
    }

    //lineNumPatch = 15;


    //*******First Step: Next or Previous Instruction maybe is Tampoline and the process will be done.******//
    // if(pathc_type == "filter"){
      // Iterate through basic blocks of the function.
      
      for (auto b : topoSortBBs(F)) {
        // Iterate over all the instructions within a basic block.
        for (BasicBlock::const_iterator It = b->begin(); It != b->end(); ++It) {
          Instruction *ins = const_cast<llvm::Instruction *>(&*It);
          //debug << "Current Instruction is:  " << *ins << "\n";
          // debug << "Current Line of Instruction is:  " << *ins << " " << getSourceCodeLine(ins) << "\n";


          //Add allocation instructions in the alloc_vars_temp
          if(isa<llvm::AllocaInst>(ins)){ 
            // debug << "aLLOCA Instruction is:  " << *ins << "\n";
            insertInSet3(ins);
          }


          MDNode *md = ins->getMetadata("dbg");

          if(seeFirst){
            if(BB_firstLine == b){
              //This instruction is rest of patch instruction
              // debug << "Current Instruction is:  " << *ins << "\n";
              insertInMap(ins);

            }
          }



          if (auto CI = dyn_cast<CallInst>(&*ins)) {
            StringRef CIFuncName = CI->getCalledFunction()->getName();
            string DemangledFuncCallName = demangle(CIFuncName.str().c_str());

            if (DemangledFuncCallName.find("TRAMPOLINE_FUNCTION") != string::npos){  
              BasicBlock *BB_SI = CI->getParent();
              if(PDT.dominates(BB_SI,BB_Entry)){
                //if(!instrsAreInSameLoop(LI,CI)){
                  if(instrIsInLoop(LI,CI) == NULL){
                  //debug << "The call function post dominates Entry BB and this is not in the loop" <<"\n";
                  insertInMapPDT(getSourceCodeLine(ins),BB_SI);//So this is a good call patch function that we can use. This is not in the loop or if statements.
                } 
              }
            }
          }

          //Using metadata for finding the next instructions of a c++ instruction
          //if (getSourceCodeLine(ins) == lineNumPatch[iteratorOnPatch] || (metadatapatch.find(md) != metadatapatch.end() && !isa<CallInst>(&*ins))) {
            
          // if (getSourceCodeLine(ins) == lineNumPatch[iteratorOnPatch] || metadatapatch.find(md) != metadatapatch.end()) {
            if (std::find(lineNumPatch.begin(), lineNumPatch.end(), getSourceCodeLine(ins)) != lineNumPatch.end() 
            || metadatapatch.find(md) != metadatapatch.end()) {

            patchInst = ins;
            // debug << "Current Instruction for process:  " << *ins << "Line number:" << getSourceCodeLine(ins) << "\n";
            insertInMap(patchInst);
            metadatapatch.insert(md);

            if(iteratorOnPatch == 0){
              seeFirst = true;
              firstPatchInstr = ins;
              BB_firstLine = b;
            }


            if(iteratorOnPatch <= sizeof(lineNumPatch) / sizeof(int)){
              iteratorOnPatch = iteratorOnPatch + 1;
            }

            Instruction *ins2 = ins->getNextNonDebugInstruction();
            Instruction *ins3 = ins->getPrevNonDebugInstruction();

            //Analyzing Next Instructions
            if(ins2 != NULL && !done){
              //debug << "Next Instruction:  " << *ins2 << "\n";
              if (isa<CallInst>(ins2)) {
                StringRef name = cast<CallInst>(ins2)->getCalledFunction()->getName();
                //debug << "String:  " << name << "\n";
                if(name == "TRAMPOLINE_FUNCTION"){
                  //debug << "*********The Patching is Done********"<< "\n";
                  done = true;
                  //break;
                }
              }
            }else{
              //debug << "Next Instruction:  " << "Null" << "\n";
            }

            //Analyzing Previous Instructions
            if(ins3 != NULL && !done){
              //debug << "Previous Instruction:  " << *ins3 << "\n";
              if (isa<CallInst>(ins3)) {
                StringRef name = cast<CallInst>(ins3)->getCalledFunction()->getName();
                //debug << "String:  " << name << "\n";
                if(name == "TRAMPOLINE_FUNCTION"){
                  //debug << "*********The Patching is Done********"<< "\n";
                  done = true;
                  //break;
                }
              }
            }else{
              //debug << "Previous Instruction:  " << "Null" << "\n";
            }

            // I changed the place of "if(done)"
          }
        }
      }

      //UPDATE: NEW ADDED:
      if(Loop* loop = instrIsInLoop(LI,firstPatchInstr)){
        if(loop->getSubLoops().size() != 0){
          isDynamicNested = true;
          // debug << "The patch is in the complex loop so search for trampoline in a loop! \n";
          for (auto b : topoSortBBs(F)) {
            // Iterate over all the instructions within a basic block.
            for (BasicBlock::const_iterator It = b->begin(); It != b->end(); ++It) {
              Instruction *ins = const_cast<llvm::Instruction *>(&*It);
              if (auto CI = dyn_cast<CallInst>(&*ins)) {
                StringRef CIFuncName = CI->getCalledFunction()->getName();
                string DemangledFuncCallName = demangle(CIFuncName.str().c_str());

              if (DemangledFuncCallName.find("TRAMPOLINE_FUNCTION") != string::npos){  
                  BasicBlock *BB_SI = CI->getParent();
                  if(instrIsInLoopUtil(loop,CI) != NULL){
                    //It means: the patch is in the loop and also the trampoline is in that loop then it is a good trampoline for the patch
                    // insertInMapPDT(getSourceCodeLine(ins),BB_SI);
                    triggerLoopLine = getSourceCodeLine(ins);
                    triggerLoopBlock = BB_SI;
                  } 
                }
              }
            }
          }
        }
      }
      //End of Update
      
      //Here we added all global variables to the list regardless of they are in the patch or not!
      for (auto& GV : F.getParent()->getGlobalList()) {
      // Check if the global variable is defined in the module, not just declared
      if (!GV.isDeclaration()) {
        // debug << "*****************GLOBAL6" << GV <<"\n";
        hotPatchInstSet_globalVar.push_back(&GV);
       }
      }


      // Iterate over all the structures defined in the program
      for (auto& StructTy : F.getParent()->getIdentifiedStructTypes()) {
        // Iterate over all the global variables in the program
          for (auto& GV : F.getParent()->getGlobalList()) {
            // Check if the global variable has the same type as the structure
            if (GV.getType()->getPointerElementType() == StructTy) {
              // Add the global variable to your list
              // hotPatchInstSet_globalVar.push_back(&GV);
              hotPatchInstSet_structure.push_back(StructTy);
            }
          }
        }

    // }else if (pathc_type == "replace"){
    //     debug << "It is redirect patch \n";


    // }

    if(done){
      // debug << "Trampoline are near the patch, so you don't need change the place of the patch. :)"<< "\n";
      // debug << "\n \n*********************Congratulations :)***************************\n";
      // debug << "*********************The Patching is Done***************************"<< "\n";
      // debug << "********************************************************************"<< "\n";

      // for (auto inst : patchInstSet) {
      //   debug << *inst << "\n";
      // }

      // debug << "Size of Map: " << patchValueMap.size() << "\n";
      patchAnalyze();
      // debug << "Size of Map: " << patchValueMap.size() << "\n";

      // for (auto inst : alloc_vars_temp) {
      //   std::cout << "Instruction pointer: " << inst << "\n";
      // }
      for(auto const& element : patchValueMap) {
        Instruction* instr = element.first;
        std::vector<Value*> values = element.second;
        for(auto const& val : values) {
          Instruction *temp = dyn_cast<Instruction>(val);
          if(isInMap3(temp)){
            // debug << "true: " << *temp << "\n";
            insertInSet4(temp);
          }
        }
      }

    // for (auto *I : alloc_vars) {
    //   //debug << "Allocation Variables in the patch: " << *I << "\n";
    // }
    
      // This is new lines (24 Apr).
      for(auto Ins : patchInstSet){
        Instruction *ins = const_cast<llvm::Instruction *>(&*Ins);
        if(auto CI = dyn_cast<CallInst>(ins)){
          StringRef name = CI->getCalledFunction()->getName();
          if(name == "TRAMPOLINE_FUNCTION"){
              // debug << "This is TRAMPOLINE in the Patch, Remove it: " << *CI << "\n";
              deleteFromVector2(ins); //Remove instruction from the patch instructions.
          }
        }
      }
      writeVectorsToFile(patchInstSet , hotPatchInstSet_globalVar , hotPatchInstSet_structure, lineNumPatch);

      //debug << "*********The Patching is Done********"<< "\n";
      //debug << "*************************************"<< "\n";
      //debug << "Trampoline are near the patch, so you don't need change the place of the patch. :)"<< "\n";
    }
    //*** Sill we need to find the call patch. The call patch is not next or previous instruction.***///
    else if(!done){

      if(Loop* loop = instrIsInLoop(LI,firstPatchInstr)){
        // debug << "The Patch is in the for loop" << *firstPatchInstr << "\n";
         //The patch is in the loop and the call patch is not near that. So we have to find the nearest call patch and put all the loop there. 

         
        
        auto *BB_Header = loop->getHeader();
        Instruction* Instrmp =  BB_Header->getFirstNonPHI();
        if(auto CI = dyn_cast<CallInst>(Instrmp)){
          StringRef name = CI->getCalledFunction()->getName();
          if(name == "TRAMPOLINE_FUNCTION"){
            if(isDynamicNested){
              // debug << "This is TRAMPOLINE in the nested or dynamic loop. \n";
              // debug << "The nearest call patch to this patch is: " << triggerLoopLine << ", " << *(triggerLoopBlock->getFirstNonPHI())<< "\n";
              BasicBlock *BB_CP = triggerLoopBlock;//The basic block of the last call patch
              int linenum_CP = triggerLoopLine;
              BasicBlock *BB_P = BB_firstLine;//The basic block of the first line of the patch
              auto b = findBBs(BB_CP, BB_P, F, DT, PDT,true);//Find basic blocks between "call patch" and "patch"
              patchAnalyze();
              backwardAnalyze(b, lineNumPatch, linenum_CP, BB_CP, BB_P, F, DT, PDT, LI, BB_End);
            }else{
              // debug << "This is TRAMPOLINE in the loop including if. \n";
              triggerLoopLine = getSourceCodeLine(Instrmp);
              triggerLoopBlock = BB_Header;
              // debug << "The nearest call patch to this patch is: " << triggerLoopLine << ", " << *(triggerLoopBlock->getFirstNonPHI())<< "\n";
              BasicBlock *BB_CP = triggerLoopBlock;//The basic block of the last call patch
              int linenum_CP = triggerLoopLine;
              BasicBlock *BB_P = BB_firstLine;//The basic block of the first line of the patch
              auto b = findBBs(BB_CP, BB_P, F, DT, PDT,true);//Find basic blocks between "call patch" and "patch"
              patchAnalyze();
              backwardAnalyze(b, lineNumPatch, linenum_CP, BB_CP, BB_P, F, DT, PDT, LI, BB_End);
            }
          }
        }
      }

      // else if(!instrIsInIf(patchInst, BB_End, DT)){
      //      debug << "The Patch is in the if/else   " << *patchInst <<"\n";

      // }
      else{
        // debug << "The Patch is not in the for loop" << *firstPatchInstr << "\n"; 
        //The patch is not in the loop 
        //debug << "The nearest call patch to this patch is: " << triggerInfoPDT.rbegin()->first << ", " << triggerInfoPDT.rbegin()->second << "\n";

        //Now we have to use backward analysis from the patch to this call patch
        //We have BB of call patch and BB of patch.
        BasicBlock *BB_CP = triggerInfoPDT.rbegin()->second;//The basic block of the last call patch
        int linenum_CP = triggerInfoPDT.rbegin()->first;

        //BasicBlock *BB_P = patchInst->getParent();//The basic block of the patch
        BasicBlock *BB_P = BB_firstLine;//The basic block of the first line of the patch

        auto b = findBBs(BB_CP, BB_P, F, DT, PDT,false);//Find basic blocks between "call patch" and "patch"

        //Analyze the patch and store the information in a set
        patchAnalyze();

        //Start from the patch instruction and go backward and analyze all the instructions
        backwardAnalyze(b, lineNumPatch, linenum_CP, BB_CP, BB_P, F, DT, PDT, LI, BB_End);

        // for(const auto& elem : triggerInfoPDT)
        // {
        //   debug << "The map is: " << elem.first << " ," << elem.second << " ,"<< triggerInfoPDT.rbegin()->first << "\n";
        // }
      } 
    }

    // set<Instruction *>::reverse_iterator rit;
    // // Start analyzing the patch (saved in the patchInst)
    // for (rit = insSet.rbegin(); rit != insSet.rend(); rit++)
    // {
    //   //Instruction *ins = const_cast<llvm::Instruction *>(&*it);
    //   debug << "Current Instruction for process:  " << *rit << "\n";
    //   //processInstructions(ins);
    // }

  #ifdef __DEBUG__
      errs() << debug.str();
  #endif
      debug.flush();

      // Print output
      errs() << output.str();
      output.flush();

      //cleanGlobalVariables();
      return false;
    
  }
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.addRequired<DominatorTreeWrapperPass>();
      AU.addRequired<PostDominatorTreeWrapperPass>();
      AU.addRequired<LoopInfoWrapperPass>();
      AU.setPreservesAll();
  
  }
};
}
 // namespace

char AutoPatchSecondPass::ID = 0;
static RegisterPass<AutoPatchSecondPass> X("patching",
                                   "Pass to calculate hotpatch");
