// AutoPatch Instrument tool

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


using namespace llvm;
using namespace std;

#define __DEBUG__

// Output strings for debugging
std::string debug_str;
raw_string_ostream debug(debug_str);

// Strings for output
std::string output_str;
raw_string_ostream output(output_str);




// Define command line options
cl::opt<bool> IsPatched("is-patched",
  cl::desc("Specify if the code is patched"),
  cl::init(true)); // Set default value to true

cl::list<int> LineNumPatch("line-num-patch",
  cl::CommaSeparated,
  cl::desc("Specify the line numbers of patch"),
  cl::value_desc("line numbers"));

cl::opt<std::string> FuncPatchName("func-patch-name",
  cl::desc("Specify the name of the function to patch"),
  cl::value_desc("function name"),
  cl::init(""));



// Demangles the function name.
std::string demangle(const char *name) {
  int status = -1;

  std::unique_ptr<char, void (*)(void *)> res{
      abi::__cxa_demangle(name, NULL, NULL, &status), std::free};
  return (status == 0) ? res.get() : std::string(name);
}

void topoSortBBs(Function *F) {
  vector<BasicBlock *> tempBB;
  //debug<<"PrintFunction:" << F->print() << "\n";

  for (scc_iterator<Function *> I = scc_begin(F), IE = scc_end(F); I != IE;
       ++I) {
        // debug << "New SSC " <<"\n";

    // Obtain the vector of BBs in this SCC and print it out.
    const std::vector<BasicBlock *> &SCCBBs = *I;

    for (std::vector<BasicBlock *>::const_iterator BBI = SCCBBs.begin(),
                                                   BBIE = SCCBBs.end();
         BBI != BBIE; ++BBI) {

      BasicBlock *b = const_cast<llvm::BasicBlock *>(*BBI);
      tempBB.push_back(b);
       for (BasicBlock::const_iterator It = b->begin(); It != b->end(); ++It) {

        Instruction *ins = const_cast<llvm::Instruction *>(&*It);
        // debug << "Instr: " << *ins <<"\n";

      }

      // debug<<"----------------BB endd--------------\n";
      
    }
  }

  reverse(tempBB.begin(), tempBB.end());
  //return tempBB;
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


namespace {
struct AutoPatchFirstPass : public ModulePass{
  
  int trampolineNum = 0;
  //FunctionCallee hookFunc;
  //Function *hook;
  static char ID;
  AutoPatchFirstPass() : ModulePass(ID) {}
  bool oneTimeAnalyzeLoop = true;
  //std::string funcPatchName = "dummy_buggy_MQTT_packet_length_decode";
  //std::string funcPatchName = "infoTransfer";
  //std::string funcPatchName = "shell_spaces_trim";


  //**** We should take these from USERS like PASS 2!
  // bool isPatched = true; //If we want to instrument the function that has the patch, Set this TRUE.
  // int lineNumPatch[3] = {27,28,29}; //If we want to instrument the function that has the patch, Set the pathc line numbers
  // std::string funcPatchName = "u16_add_overflow";

  // Get from USERS:
  bool isPatched = IsPatched;
  std::vector<int> lineNumPatch; 
  std::string funcPatchName = FuncPatchName;


  virtual bool runOnModule(Module &M) override
    {
      
      //debug << "Start Instrumenting ...." << "\n";
      if(isPatched){
        lineNumPatch = LineNumPatch;
      }

      //iterate over the module (means iterate over functions)
      for(Module::iterator F = M.begin(), E = M.end(); F!= E; ++F)
        {
          oneTimeAnalyzeLoop = true;

          // iterate over the basicblocks whithin the function
          for(Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB)
            {
              Function *func = const_cast<llvm::Function *>(&*F);
              BasicBlock *BB_tempif = const_cast<llvm::BasicBlock *>(&*BB);
              //topoSortBBs(func);
              //****************NEW***************//
              std::string funcName = demangle(func->getName().str().c_str());
              // debug << "The function is " << funcName << "\n";
              if (funcName == funcPatchName) { // If you insert a new function as a patch, we should not insert trampoline to it.

                    debug << "The Function belongs to the patch!" << "\n";
                    break;
              }

              //******At the beggining of the function****//
              if (BB == F->begin()){
                BasicBlock *BB_Entry = &(func->getEntryBlock());
                AutoPatchFirstPass::runOnFunction(BB_Entry,M,func);//Done (I think)
              }
              
              //******After Function Calls****//
              AutoPatchFirstPass::runOnBasicBlock(BB, M, func);//Done (I think) 
              //(We have to work on detail of that -> some function we don't need to add call patch)

              

              //******After Dynamic Loops****//       //******After Complex Loops (Nested Loops)****//
               if(oneTimeAnalyzeLoop){
                oneTimeAnalyzeLoop = false;
                //LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>(*func).getLoopInfo();
                identifyNestedloops(func, M);//Done (I think)
                //instrumentDynamicLoops(LI, M, func); //Working on that



                //***********After Nested If*********//
                ////////////////////////////////Work on That !!!!!!!!!!!!!!!!!!1//////////////////
                identifyNestedif(func,M);
                //identifyNestedif2(func, M);
               }

              //******After Dynamic Variables and Assignments****//
              //*** IMPORTANT: I think this is not exist in CVEs, so let's DO NOT CONSIDER THIS. ****//

            }//End of iterate on basic blocks
        }//End of iterate on functions
      

      string Result = "Number of inserted Trampolines: " + to_string(trampolineNum) + "\n";
      debug << Result;

      #ifdef __DEBUG__
        errs() << debug.str();
      #endif
        debug.flush();
        errs() << output.str();
        output.flush();
        return false;
    }


  // void identifyNestedif2(Function *func, Module &M){
  //   for(Function::iterator BB = func->begin(), E = func->end(); BB != E; ++BB){
  //     for(BasicBlock::iterator I = BB->begin(), BE = BB->end(); I != BE; ++I){
  //       Instruction *ins = const_cast<llvm::Instruction *>(&*I);

  //       if(auto *br=dyn_cast<BranchInst>(ins)){
  //         if(!br->isConditional()){
  //           continue;
  //         }
  //         BasicBlock *ifTrue = br->getSuccessor(0);
  //         BasicBlock *ifFalse = br->getSuccessor(1);
  //         for (auto &II : *ifTrue) {
  //           if (auto *brInner = dyn_cast<BranchInst>(&II)) {
  //             if (!brInner->isConditional()) {
  //               continue;
  //             }
  //             errs() << "Found nested if statement in function "
  //                      << func->getName() << "\n";
  //             IRBuilder<> IRB(ifTrue->getFirstNonPHI());
  //             auto Fn = func->getParent()->getOrInsertFunction(
  //                     "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
  //             IRB.CreateCall(Fn);
  //             trampolineNum++;

  //             //return false;
  //             }
  //         }
  //         for (auto &II : *ifFalse) {
  //           if (auto *brInner = dyn_cast<BranchInst>(&II)) {
  //             if (!brInner->isConditional()) {
  //               continue;
  //             }
  //             errs() << "Found nested if statement in function "
  //                      << func->getName() << "\n";
  //             IRBuilder<> IRB(ifFalse->getFirstNonPHI());
  //             auto Fn = func->getParent()->getOrInsertFunction(
  //                     "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
  //             IRB.CreateCall(Fn);
  //             trampolineNum++;
  //             //return false;
  //           }
  //         }
  //       }
  //     }
  //   }
  // }




  //******************** Think about it!. Is it correct method and work for all scenarios?!************///
  bool seeNested = false;
  void identifyNestedif(Function *func, Module &M){
    for(Function::iterator BB = func->begin(), E = func->end(); BB != E; ++BB){
      //for(BasicBlock::iterator BlI = BB->begin(), BE = BB->end(); BlI != BE; ++BlI)          
      //{        
        //debug <<"The block name is " << BB->getName() <<"\n";
        StringRef BBName = BB->getName();
        string BBName_temp = demangle(BBName.str().c_str());
          
        if (BBName_temp.find("if.then") != std::string::npos){
          if(seeNested){

            // For cheking: if this instruction belongs to a patch, Do not insert trampoline to that part!
            Instruction *instemp = BB->getFirstNonPHI();
            // debug << "1 " << *instemp << "\n";

            if(isPatched){
              int CIlineNum = getSourceCodeLine(instemp);
              bool isLineNumInPatch = std::find(std::begin(lineNumPatch), std::end(lineNumPatch), CIlineNum) != std::end(lineNumPatch);

              if(isLineNumInPatch){
                debug << "This instruction " << *instemp << "belongs to a patch! \n";
                continue;
              }
            }
            //**//

            IRBuilder<> IRB(BB->getFirstNonPHI());
            auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
            IRB.CreateCall(Fn);
            trampolineNum++;
          }else{
            for(BasicBlock::iterator BlI = BB->begin(), BE = BB->end(); BlI != BE; ++BlI)          
            {  
              Instruction *ins = const_cast<llvm::Instruction *>(&*BlI);
              //debug <<"Instruction is " << *ins <<"\n";
              std::string str;
              llvm::raw_string_ostream rso(str);
              ins->print(rso);
              std::size_t found = str.find("then");
              if (found != std::string::npos) {
                // debug << "2 \n";
                //debug <<"Instruction is " << *ins <<"\n";
                //This is a nested if statement
                // debug<<"This is a nested if statement\n";

                // For cheking: if this instruction belongs to a patch, Do not insert trampoline to that part!
                Instruction *instemp = BB->getFirstNonPHI();
                // debug << "1 " << *instemp << "\n";
                if(isPatched){
                  int CIlineNum = getSourceCodeLine(instemp);
                  bool isLineNumInPatch = std::find(std::begin(lineNumPatch), std::end(lineNumPatch), CIlineNum) != std::end(lineNumPatch);

                  if(isLineNumInPatch){
                    debug << "This instruction " << *instemp << "belongs to a patch! \n";
                    continue;
                  }
                }
                //**//

                IRBuilder<> IRB(BB->getFirstNonPHI());
                auto Fn = func->getParent()->getOrInsertFunction(
                      "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
                IRB.CreateCall(Fn);
                seeNested = true;
                trampolineNum++;
              }
            }
          }
        }else if(seeNested){
          if(BBName_temp.find("if") != std::string::npos){
            // debug << "3 \n";
            // For cheking: if this instruction belongs to a patch, Do not insert trampoline to that part!
            Instruction *instemp = BB->getFirstNonPHI();
            // debug << "1 " << *instemp << "\n";
            if(isPatched){
              int CIlineNum = getSourceCodeLine(instemp);
              bool isLineNumInPatch = std::find(std::begin(lineNumPatch), std::end(lineNumPatch), CIlineNum) != std::end(lineNumPatch);

              if(isLineNumInPatch){
                debug << "This instruction " << *instemp << "belongs to a patch! \n";
                continue;
              }
            }
            //**//
            
            IRBuilder<> IRB(BB->getFirstNonPHI());
            auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
            IRB.CreateCall(Fn);
            trampolineNum++;

          }
        }




        // Instruction *ins = const_cast<llvm::Instruction *>(&*BlI);
        //   //For function calls
        // if (BranchInst *BI = dyn_cast<BranchInst>(&*ins)) {
        //   //debug <<"The if: "<<*BI<<"\n";
        //   if (BI->isConditional()) {
        //     BasicBlock *Successor = BI->getSuccessor(0);
        //     //if(Successor->getTerminator()->getOpcode() == Instruction::Br){
        //     //  debug <<"This is Exit Block. Do No thing.\n";
        //     //}else{
        //       for (Instruction &InnerI : *Successor) {
        //         debug <<"Instruction is " << InnerI <<"\n";
        //         if (BranchInst *InnerBI = dyn_cast<BranchInst>(&InnerI)) {
        //           if (InnerBI->isConditional()) {
        //             // This is a nested if statement
        //             //debug<<"This is " << *InnerBI << " a nested if statement\n";
        //             IRBuilder<> IRB(InnerBI->getParent()->getFirstNonPHI());
        //             auto Fn = func->getParent()->getOrInsertFunction(
        //             "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
        //             IRB.CreateCall(Fn);

        //             }
        //           }
        //         }
        //       //}
        //     }
        //   }
        }
      }
  //}


  void identifyNestedloops(Function *func, Module &M){ //****add dynamic loops here not seperate
    llvm::DominatorTree DT = llvm::DominatorTree(*func);
    bool isDynamic = false;
    bool hasBranch = false;
    //DT.recalculate(func);
    auto loopinfo = new llvm::LoopInfoBase<llvm::BasicBlock, llvm::Loop>();
    unordered_set<BasicBlock *> checkedSingleSuccessorSet;
    loopinfo->releaseMemory();
    loopinfo->analyze(DT);
    // debug << "Finding Nested Loops \n";
    for(auto li = loopinfo->begin(), le = loopinfo->end(); li != le; ++li){
      // debug<<"Size of the loop " <<(*li)->getSubLoops().size() << " and " << (*li)->getLoopDepth() << "\n";
      if((*li)->getSubLoops().size() != 0){ //This approach doesnot work if the loop has "break" (e.g., CVE 10023)
        // debug<<"Nested Loop is here " <<(*li)->getSubLoops().size() << "\n"; 


        //*********** I think we also have to add trampoline at the beggining of this type of loops ****//
        //*************NEW PART*************//
        if((*li)->getHeader() != NULL){
          // debug<<"Inserted inside the nested loop.\n";
          auto *BB_Header = (*li)->getHeader();
          IRBuilder<> IRB(BB_Header->getFirstNonPHI());
          auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
          IRB.CreateCall(Fn);
          trampolineNum++;

        }

        //*********** We also have to add trampoline at the beggining of the loops that are inside this loops ****//
        ////*********** Attention: We don't add trampoline at the end of these loops ****//
        for (auto *Loop : (*li)->getSubLoops()) {
          debug<<" Going forward and inserted inside the nested loops.\n";
          auto *BB_Header = Loop->getHeader();
          IRBuilder<> IRB(BB_Header->getFirstNonPHI());
          auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
          IRB.CreateCall(Fn);
          trampolineNum++;
        }
        //***********//

        //debug << "ExitBlock for nested loop: " << *(*li)->getUniqueExitBlock() << "," << *(*li)->getExitBlock() <<"\n";
        if((*li)->getUniqueExitBlock() != NULL){//One Exit Basic Block
          IRBuilder<> IRB((*li)->getUniqueExitBlock());
          IRB.SetInsertPoint(((*li)->getUniqueExitBlock())->getFirstNonPHI());
          auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
          IRB.CreateCall(Fn);
          trampolineNum++;

        }

        else if((*li)->hasNoExitBlocks()){ //Let's consider Infinite loops also. (We don't have Exit Block)
        //if we added call function after that, what does that mean? it does not reachable!!!
        //I think we have to add trampoline at the beggining of this type of loops
          // debug<<"It is infinite nested loop, " << "No BasicBlock" << "\n" ;
        }

        else{//(Multiple Basic Blocks) ********Is this correct and works?!!********
          // debug<<"It is NULL, " << "Multiple BasicBlocks"<< "\n" ;
          SmallVector<BasicBlock *> ExitBlocks;
          (*li)->getExitBlocks(ExitBlocks);
          for (auto *Block : ExitBlocks){
            // debug<<"The basicblock: " << Block->front() << "\n" ;
            //debug<<"Successor of " << Block << ": " << Block->getSingleSuccessor() << "\n" ;

            if(Block->getSingleSuccessor() != NULL){
              if(checkedSingleSuccessorSet.find(Block->getSingleSuccessor()) == checkedSingleSuccessorSet.end()){//
                // debug<<"This is the new Successor" << "\n" ;
                BasicBlock *tempBB = Block->getSingleSuccessor();

                checkedSingleSuccessorSet.insert(tempBB);
                IRBuilder<> IRB(tempBB);
                //debug<<"The Instruction point: " << tempBB->getFirstNonPHI() << "\n" ;
                IRB.SetInsertPoint(tempBB->getFirstNonPHI());
                auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
                IRB.CreateCall(Fn);
                trampolineNum++;

              }else{
                // debug<<"This is not the new Successor" << "\n" ;
                continue;
              }              
            }
            else{//else? Is it possible we have multiple successors? if yes, what should we do?! 
              //For now, I put call function for every exit block in this situation 
              //(But it is not correct! These instructions put call function in the wrong place).
              //Is there any better solution?
              IRBuilder<> IRB(Block);
              // debug<<"The Instruction point: " << Block->getFirstNonPHI() << "\n" ;
              IRB.SetInsertPoint(Block->getFirstNonPHI());
              auto Fn = func->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
              IRB.CreateCall(Fn);
              trampolineNum++;

            }
          }
        }
      }//End "if" for nested loops

      else{//Why this comes first while third loop is not nested! Is it important for us?! No I don't think so. because of SSC bottom to top
      //***********here but we have to consider infinte loops//
      //*********** I think we also have to add trampoline at the beggining of this type of loops (not just after them) ****//

        // debug<<"It is not Nested Loop\n";

        if((*li)->hasNoExitBlocks()){ //Infinite loops. (We don't have Exit Block)
        //if we added call function after that, what does that mean? it does not reachable!!!
          // debug<<"It is infinite unnested loop, " << "No BasicBlock" << "\n" ;
        }
        else{
          //********Here we have to analyze the loop for "is it dynamic loop or static?"****//
          // debug << "I am HERE! " <<  (*li)->getLoopDepth() << "\n";

          BasicBlock *BB_temp1 = (*li)->getHeader();
          BasicBlock *BB_temp2 = (*li)->getLoopLatch();

          Instruction* I = BB_temp1->getFirstNonPHI();
          Instruction* I_do = BB_temp2->getFirstNonPHI();//For "do" loop. It is reverse compare to "while" and "for" loop.

          if (isa<llvm::LoadInst>(I)) {

            LoadInst *LI_temp = cast<LoadInst>(I);
            LoadInst *LI_temp_do = cast<LoadInst>(I_do);

            //debug<<"Dynamic loop: "<< LI_temp->getType()->isPointerTy() << "Instruction is: " << *LI_temp << "\n";
            //debug<<"Dynamic do loop: "<< LI_temp_do->getType()->isPointerTy() << "Instruction is: " << *LI_temp_do << "\n";

            if(LI_temp->getType()->isPointerTy()){
              //This is dynamic loop

              isDynamic = true;
              IRBuilder<> IRB(BB_temp2);
              //debug<<"The Instruction point: " << *(BB_temp2->getFirstNonPHI()) << "\n" ;
              IRB.SetInsertPoint(BB_temp2->getFirstNonPHI());
              auto Fn = func->getParent()->getOrInsertFunction(
                        "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
              IRB.CreateCall(Fn);
              trampolineNum++;



              //***********************************///
              ///Repeat from Nested Loop (for exit block)  ***** I think it is the same *****//




              if((*li)->getUniqueExitBlock() != NULL){//One Exit Basic Block
              IRBuilder<> IRB((*li)->getUniqueExitBlock());
              IRB.SetInsertPoint(((*li)->getUniqueExitBlock())->getFirstNonPHI());
              auto Fn = func->getParent()->getOrInsertFunction(
                        "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
              IRB.CreateCall(Fn);
              trampolineNum++;
            }

              else if((*li)->hasNoExitBlocks()){ //Let's consider Infinite loops also. (We don't have Exit Block)
              //if we added call function after that, what does that mean? it does not reachable!!!
              //I think we have to add trampoline at the beggining of this type of loops
                // debug<<"It is infinite nested loop, " << "No BasicBlock" << "\n" ;
              }

              else{//(Multiple Basic Blocks) ********Is this correct and works?!!********
                // debug<<"It is NULL, " << "Multiple BasicBlocks"<< "\n" ;
                SmallVector<BasicBlock *> ExitBlocks;
                (*li)->getExitBlocks(ExitBlocks);
                for (auto *Block : ExitBlocks){
                  // debug<<"The basicblock: " << Block->front() << "\n" ;
                  //debug<<"Successor of " << Block << ": " << Block->getSingleSuccessor() << "\n" ;

                  if(Block->getSingleSuccessor() != NULL){
                    if(checkedSingleSuccessorSet.find(Block->getSingleSuccessor()) == checkedSingleSuccessorSet.end()){//
                      // debug<<"This is the new Successor" << "\n" ;
                      BasicBlock *tempBB = Block->getSingleSuccessor();

                      checkedSingleSuccessorSet.insert(tempBB);
                      IRBuilder<> IRB(tempBB);
                      //debug<<"The Instruction point: " << tempBB->getFirstNonPHI() << "\n" ;
                      IRB.SetInsertPoint(tempBB->getFirstNonPHI());
                      auto Fn = func->getParent()->getOrInsertFunction(
                          "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
                      IRB.CreateCall(Fn);
                      trampolineNum++;
                    }else{
                      // debug<<"This is not the new Successor" << "\n" ;
                      continue;
                    }              
                  }
                  else{//else? Is it possible we have multiple successors? if yes, what should we do?! 
                    //For now, I put call function for every exit block in this situation 
                    //(But it is not correct! These instructions put call function in the wrong place).
                    //Is there any better solution?
                    IRBuilder<> IRB(Block);
                    // debug<<"The Instruction point: " << Block->getFirstNonPHI() << "\n" ;
                    IRB.SetInsertPoint(Block->getFirstNonPHI());
                    auto Fn = func->getParent()->getOrInsertFunction(
                          "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
                    IRB.CreateCall(Fn);
                    trampolineNum++;

                  }
                }//End iterating on exit basic blocks
              }//End multiple exit basic blocks
            
            //***********************************///

            }//End check this is dynamic loop or not for "for and while" loop
          else if(LI_temp_do->getType()->isPointerTy()){

              isDynamic = true;

              IRBuilder<> IRB(BB_temp1);
              // debug<<"The Instruction point: " << *(BB_temp1->getFirstNonPHI()) << "\n" ;
              IRB.SetInsertPoint(BB_temp1->getFirstNonPHI());
              auto Fn = func->getParent()->getOrInsertFunction(
                        "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
              IRB.CreateCall(Fn);
              trampolineNum++;



              //***********************************///
              ///Repeat from Nested Loop (for exit block)  ***** I think it is the same *****//




              if((*li)->getUniqueExitBlock() != NULL){//One Exit Basic Block
              IRBuilder<> IRB((*li)->getUniqueExitBlock());
              IRB.SetInsertPoint(((*li)->getUniqueExitBlock())->getFirstNonPHI());
              auto Fn = func->getParent()->getOrInsertFunction(
                        "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
              IRB.CreateCall(Fn);
              trampolineNum++;

            }

              else if((*li)->hasNoExitBlocks()){ //Let's consider Infinite loops also. (We don't have Exit Block)
              //if we added call function after that, what does that mean? it does not reachable!!!
              //I think we have to add trampoline at the beggining of this type of loops
                // debug<<"It is infinite nested loop, " << "No BasicBlock" << "\n" ;
              }

              else{//(Multiple Basic Blocks) ********Is this correct and works?!!********
                // debug<<"It is NULL, " << "Multiple BasicBlocks"<< "\n" ;
                SmallVector<BasicBlock *> ExitBlocks;
                (*li)->getExitBlocks(ExitBlocks);
                for (auto *Block : ExitBlocks){
                  // debug<<"The basicblock: " << Block->front() << "\n" ;
                  //debug<<"Successor of " << Block << ": " << Block->getSingleSuccessor() << "\n" ;

                  if(Block->getSingleSuccessor() != NULL){
                    if(checkedSingleSuccessorSet.find(Block->getSingleSuccessor()) == checkedSingleSuccessorSet.end()){//
                      // debug<<"This is the new Successor" << "\n" ;
                      BasicBlock *tempBB = Block->getSingleSuccessor();

                      checkedSingleSuccessorSet.insert(tempBB);
                      IRBuilder<> IRB(tempBB);
                      //debug<<"The Instruction point: " << tempBB->getFirstNonPHI() << "\n" ;
                      IRB.SetInsertPoint(tempBB->getFirstNonPHI());
                      auto Fn = func->getParent()->getOrInsertFunction(
                          "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
                      IRB.CreateCall(Fn);
                      trampolineNum++;

                    }else{
                      // debug<<"This is not the new Successor" << "\n" ;
                      continue;
                    }              
                  }
                  else{//else? Is it possible we have multiple successors? if yes, what should we do?! 
                    //For now, I put call function for every exit block in this situation 
                    //(But it is not correct! These instructions put call function in the wrong place).
                    //Is there any better solution?
                    IRBuilder<> IRB(Block);
                    // debug<<"The Instruction point: " << Block->getFirstNonPHI() << "\n" ;
                    IRB.SetInsertPoint(Block->getFirstNonPHI());
                    auto Fn = func->getParent()->getOrInsertFunction(
                          "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
                    IRB.CreateCall(Fn);
                    trampolineNum++;

                  }
                }//End iterating on exit basic blocks
              }//End multiple exit basic blocks
              //***********************************///
            }//End check this is dynamic loop or not for "do" loop
          }//End check if load instruction
          

 


          //debug<<"The first instruction: "<< *(BB_temp1->getFirstNonPHI()) << ", " << *(BB_temp2->getFirstNonPHI()) << "," << *(BB_temp2->getFirstNonPHIOrDbgOrAlloca()) <<"\n";

          //********* Questions: *******//
          //1) getLoopLatch? Is this correct?
          //2) Where we have to put the trampoline? (e.g., after load instructions?)
          //3) When we have to put trampoline? (Which type of loop should be instrumented?)

          //*** This is Sample and Temporary. Working on that! **//

          //IRBuilder<> IRB(BB_temp2);
          //debug<<"The Instruction point: " << BB_temp2->getFirstNonPHI() << "\n" ;
          //IRB.SetInsertPoint(BB_temp2->getFirstNonPHI());
          //auto Fn = func->getParent()->getOrInsertFunction(
           //         "print", Type::getVoidTy(M.getContext()));
          //IRB.CreateCall(Fn);


          // ** I think we should think about it more! It can be more complex! //
          //*** Attention: What about those "if" has "for" or "while" loops?! **
          if(!isDynamic){
            // debug << "The loop is not dynamic and nested, Check it has branch or not! \n";
            Loop* loop = *li;
            for (auto bb = loop->block_begin(), be = loop->block_end(); bb != be; ++bb) {
              BasicBlock* block = *bb;
              for (auto ii = block->begin(), ie = block->end(); ii != ie; ++ii) {
                Instruction* inst = &*ii;
                if (auto* branchInst = dyn_cast<BranchInst>(inst)) {
                  if (branchInst->isConditional()) {
                    // Found a conditional branch, which means the loop contains if branches or switch cases
                    hasBranch = true;
                  }
                }
              }
            }
            if(hasBranch){
              auto *BB_Header = (*li)->getHeader();
              IRBuilder<> IRB(BB_Header->getFirstNonPHI());
              auto Fn = func->getParent()->getOrInsertFunction(
                        "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext())); 
              IRB.CreateCall(Fn);
              trampolineNum++;
            }
          }
        }





      }//End "else" for unnested loops
    }//End iterating on the loops
  }


  void instrumentDynamicLoops(LoopInfo &LoopInfo, Module &M, Function *F){
      // debug << "Enter to instrumentDynamicLoop Function" << "\n";
      for (auto Loop : LoopInfo){
        // debug << " hasNoExitBlocks and isLoopSimplifyForm: " << Loop->hasNoExitBlocks() << Loop->isLoopSimplifyForm() <<"\n";
        if (!Loop->hasNoExitBlocks()){
          // debug << "This is finite loop " << "\n";
          //BasicBlock* BB_temp = Loop->getExitBlock();
          // debug << "ExitBlock: " << Loop->getExitBlock() <<"\n";
          // IRBuilder<> IRB(BB_temp);
          // IRB.SetInsertPoint(BB_temp);//Add after dynamic loop
          // auto Fn = F->getParent()->getOrInsertFunction(
          //           "print", Type::getVoidTy(M.getContext()));
          // IRB.CreateCall(Fn);
        }
      }
  }


  virtual bool runOnFunction(BasicBlock* BB_Entry, Module &M, Function *F){
    IRBuilder<> IRB(BB_Entry);
    IRB.SetInsertPointPastAllocas(F);
    auto Fn = F->getParent()->getOrInsertFunction(
                    "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
    IRB.CreateCall(Fn);
    trampolineNum++;

    return true;
  }



  virtual bool runOnBasicBlock(Function::iterator &BB, Module &M, Function *F)
    {
      //iterate over the instructions within the basicblock
      for(BasicBlock::iterator BI = BB->begin(), BE = BB->end(); BI != BE; ++BI)          
        {
          Instruction *ins = const_cast<llvm::Instruction *>(&*BI);

          //For function calls
          if (auto CI = dyn_cast<CallInst>(&*ins)) {
          StringRef CIFuncName = CI->getCalledFunction()->getName();
          string DemangledFuncCallName = demangle(CIFuncName.str().c_str());

          int CIlineNum = getSourceCodeLine(CI);
          bool isLineNumInPatch = false;

          if(isPatched){
            isLineNumInPatch = std::find(std::begin(lineNumPatch), std::end(lineNumPatch), CIlineNum) != std::end(lineNumPatch);
          }
          

          //string DemangledFuncName = demangle(CI->getArgOperand(0)->getName().str().c_str()); //It gets error! (I don't know why!)
          
          //*****We have to work on this
          //Now, I just identify "print" call function and I don't insert code after that. But We have to consider other function calls that
          //We don't need to insert trampoline after them
          //Also we do not isnert trampoline after function calls that we added as a patch (e.g., CVE 10063) since we run this on the patched function.
          if (DemangledFuncCallName.find("TRAMPOLINE_FUNCTION") == std::string::npos && DemangledFuncCallName.find("dbg")== std::string::npos){  //It means that if the call function is not "print" go to the if
            if(DemangledFuncCallName == "printf"){
              
            }else if (isPatched && isLineNumInPatch){ //Checking do not insert trampoline if this function call is added as a patch.

              debug << "This call function belongs to the patch! \n";

            }else{
              // debug << "Add call after function call " << DemangledFuncCallName <<"\n";

              IRBuilder<> IRB(ins->getParent());
              IRB.SetInsertPoint(ins->getNextNode());//Add trampoline after function call
              auto Fn = ins->getFunction()->getParent()->getOrInsertFunction(
                      "TRAMPOLINE_FUNCTION", Type::getVoidTy(M.getContext()));
              IRB.CreateCall(Fn);
              trampolineNum++;

            }
          }
        }
      }
      return true;
    }

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<DominatorTreeWrapperPass>();
    AU.addRequired<PostDominatorTreeWrapperPass>();
    AU.addRequired<LoopInfoWrapperPass>();
    AU.setPreservesAll();
  }
};
} // namespace

char AutoPatchFirstPass::ID = 0;
static RegisterPass<AutoPatchFirstPass> X("instrumentcode",
                                   "Pass to instrument function call");
