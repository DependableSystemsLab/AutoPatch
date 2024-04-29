; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = constant [20 x i8] c"LBA (block) ; 0x%x \00"
@length = global i32 0
@.str.1 = constant [2 x i8] c"1\00"
@.str.2 = constant [2 x i8] c"2\00"
@.str.3 = constant [2 x i8] c"3\00"

declare i32 @printf(i8*, ...)

define i64 @filter_10021(%stack_frame* %0) {
entry:
  %op = alloca i32, align 4
  %ret_code = alloca i32, align 4
  %1 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 0
  %r0 = load i32, i32* %1, align 4
  %2 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 1
  %r1 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 2
  %r2 = load i32, i32* %3, align 4
  %4 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 2
  %r3 = load i32, i32* %4, align 4
  %5 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 6
  %r6 = load i32, i32* %5, align 4
  %6 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 7
  %r7 = load i32, i32* %6, align 4
  store i32 0, i32* %op, align 4
  store i32 0, i32* %ret_code, align 4
  %n = alloca i32, align 4
  store i32 %r0, i32* %n, align 4
  %memory_size = alloca i32, align 4
  store i32 %r1, i32* %memory_size, align 4
  br label %entry1

entry1:                                           ; preds = %entry
  %8 = load i32, i32* %n, align 4, !dbg !50
  %9 = mul i32 %8, 512, !dbg !52
  %10 = load i32, i32* %memory_size, align 4, !dbg !53
  %11 = icmp uge i32 %9, %10, !dbg !54
  br i1 %11, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %entry1, %if_then
  %op_val = load i32, i32* %op, align 4
  %12 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %13 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %12, 32
  %op_ret_sum = add i64 %shifted_op, %13
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 83, column: 32, scope: !1)
!1 = distinct !DISubprogram(name: "infoTransfer", scope: !2, file: !2, line: 73, type: !3, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !49)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10021(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, globals: !15, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2020-10021(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!8 = !{!9}
!9 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Status", file: !2, line: 53, baseType: !10, size: 32, elements: !11)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!12, !13, !14}
!12 = !DIEnumerator(name: "CSW_PASSED", value: 0)
!13 = !DIEnumerator(name: "CSW_FAILED", value: 1)
!14 = !DIEnumerator(name: "CSW_ERROR", value: 2)
!15 = !{!16, !37, !45, !47}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "cbw", scope: !6, file: !2, line: 27, type: !18, isLocal: true, isDefinition: true)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CBW", file: !2, line: 42, size: 256, elements: !19)
!19 = !{!20, !25, !26, !27, !31, !32, !33}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !18, file: !2, line: 43, baseType: !21, size: 32)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !22, line: 26, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !24, line: 42, baseType: !10)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIDerivedType(tag: DW_TAG_member, name: "Tag", scope: !18, file: !2, line: 44, baseType: !21, size: 32, offset: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "DataLength", scope: !18, file: !2, line: 45, baseType: !21, size: 32, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !18, file: !2, line: 46, baseType: !28, size: 8, offset: 96)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !22, line: 24, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !24, line: 38, baseType: !30)
!30 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "LUN", scope: !18, file: !2, line: 47, baseType: !28, size: 8, offset: 104)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "CBLength", scope: !18, file: !2, line: 48, baseType: !28, size: 8, offset: 112)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "CB", scope: !18, file: !2, line: 49, baseType: !34, size: 128, offset: 120)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 128, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 16)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "csw", scope: !6, file: !2, line: 29, type: !39, isLocal: true, isDefinition: true)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CSW", file: !2, line: 35, size: 128, elements: !40)
!40 = !{!41, !42, !43, !44}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !39, file: !2, line: 36, baseType: !21, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "Tag", scope: !39, file: !2, line: 37, baseType: !21, size: 32, offset: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "DataResidue", scope: !39, file: !2, line: 38, baseType: !21, size: 32, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "Status", scope: !39, file: !2, line: 39, baseType: !28, size: 8, offset: 96)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "addr", scope: !6, file: !2, line: 31, type: !21, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "length", scope: !6, file: !2, line: 33, type: !21, isLocal: true, isDefinition: true)
!49 = !{}
!50 = !DILocation(line: 86, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !1, file: !2, line: 86, column: 6)
!52 = !DILocation(line: 86, column: 9, scope: !51)
!53 = !DILocation(line: 86, column: 26, scope: !51)
!54 = !DILocation(line: 86, column: 23, scope: !51)
