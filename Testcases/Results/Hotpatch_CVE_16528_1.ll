; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@dval = global i64 0

declare i32 @printf(i8*, ...)

define i64 @filter_16528_1(%stack_frame* %0) {
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
  %key = alloca i32, align 4
  store i32 %r0, i32* %key, align 4
  %xStatus = alloca i32, align 4
  store i32 %r1, i32* %xStatus, align 4
  br label %entry1

entry1:                                           ; preds = %entry
  %7 = load i32, i32* %key, align 4, !dbg !0
  %8 = sext i32 %7 to i64, !dbg !0
  %9 = load i32, i32* %xStatus, align 4, !dbg !18
  %10 = sext i32 %9 to i64, !dbg !18
  call void @map_save_val(i8* null, i64 %8, i64 %10), !dbg !19
  br label %return

return:                                           ; preds = %entry1
  %op_val = load i32, i32* %op, align 4
  %11 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %12 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %11, 32
  %op_ret_sum = add i64 %shifted_op, %12
  ret i64 %op_ret_sum
}

define void @map_save_val(i8* %mp, i64 %key, i64 %val) {
entry:
  %0 = alloca i8*, align 8
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i8* %mp, i8** %0, align 8
  store i64 %key, i64* %1, align 8
  store i64 %val, i64* %2, align 8
  %3 = load i8*, i8** %0, align 8, !dbg !20
  %4 = icmp eq i8* %3, null, !dbg !25
  br i1 %4, label %if.then, label %if.end, !dbg !26

if.then:                                          ; No predecessors!
  br label %if.end, !dbg !27

if.end:                                           ; No predecessors!
  %5 = load i64, i64* %2, align 8, !dbg !29
  store i64 %5, i64* @dval, align 8, !dbg !30
  ret void, !dbg !31
}

!0 = !DILocation(line: 21, column: 27, scope: !1)
!1 = distinct !DISubprogram(name: "prvSetupConnection", scope: !2, file: !2, line: 16, type: !3, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2018-16528_1(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{null}
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, retainedTypes: !8, globals: !10, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2018-16528_1(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!7 = !{}
!8 = !{!9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "dval", scope: !5, file: !2, line: 8, type: !13, isLocal: false, isDefinition: true)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !14, line: 27, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !16, line: 45, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DILocation(line: 21, column: 31, scope: !1)
!19 = !DILocation(line: 21, column: 2, scope: !1)
!20 = !DILocation(line: 11, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !2, line: 11, column: 6)
!22 = distinct !DISubprogram(name: "map_save_val", scope: !2, file: !2, line: 10, type: !23, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !9, !13, !13}
!25 = !DILocation(line: 11, column: 9, scope: !21)
!26 = !DILocation(line: 11, column: 6, scope: !22)
!27 = !DILocation(line: 12, column: 2, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !2, line: 11, column: 18)
!29 = !DILocation(line: 13, column: 9, scope: !22)
!30 = !DILocation(line: 13, column: 7, scope: !22)
!31 = !DILocation(line: 14, column: 1, scope: !22)
