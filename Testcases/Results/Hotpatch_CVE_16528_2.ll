; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@dval = global i64 0

declare i32 @printf(i8*, ...)

define i64 @filter_16528_2(%stack_frame* %0) {
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
  %val = alloca i32, align 4
  store i32 %r1, i32* %val, align 4
  br label %entry1

entry1:                                           ; preds = %entry
  %7 = load i32, i32* %key, align 4, !dbg !0
  %8 = sext i32 %7 to i64, !dbg !0
  %9 = call i64 @map_get_val(i8* null, i64 %8), !dbg !17
  %10 = trunc i64 %9 to i32, !dbg !17
  store i32 %10, i32* %val, align 4, !dbg !18
  %11 = load i32, i32* %val, align 4, !dbg !19
  %12 = icmp eq i32 %11, 0, !dbg !21
  br i1 %12, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 2, i32* %op, align 4
  %13 = add i32 %r6, 4
  store i32 %13, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %entry1, %if_then
  %op_val = load i32, i32* %op, align 4
  %14 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %15 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %14, 32
  %op_ret_sum = add i64 %shifted_op, %15
  ret i64 %op_ret_sum
}

define i64 @map_get_val(i8* %mp, i64 %key) {
entry:
  %0 = alloca i8*, align 8
  %1 = alloca i64, align 8
  store i8* %mp, i8** %0, align 8
  store i64 %key, i64* %1, align 8
  %2 = load i64, i64* @dval, align 8, !dbg !22
  ret i64 %2, !dbg !27
}

!0 = !DILocation(line: 18, column: 37, scope: !1)
!1 = distinct !DISubprogram(name: "prvSetupConnection", scope: !2, file: !2, line: 14, type: !3, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !8)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2018-16528_2(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, globals: !9, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "/home/mohsen/AutoPatch/Testcases/CVE-Lists/CVE-2018-16528_2(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch/Scripts")
!8 = !{}
!9 = !{!10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "dval", scope: !6, file: !2, line: 8, type: !12, isLocal: false, isDefinition: true)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !15, line: 45, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!16 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!17 = !DILocation(line: 18, column: 12, scope: !1)
!18 = !DILocation(line: 18, column: 6, scope: !1)
!19 = !DILocation(line: 20, column: 6, scope: !20)
!20 = distinct !DILexicalBlock(scope: !1, file: !2, line: 20, column: 6)
!21 = !DILocation(line: 20, column: 10, scope: !20)
!22 = !DILocation(line: 11, column: 9, scope: !23)
!23 = distinct !DISubprogram(name: "map_get_val", scope: !2, file: !2, line: 10, type: !24, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !8)
!24 = !DISubroutineType(types: !25)
!25 = !{!12, !26, !12}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !DILocation(line: 11, column: 2, scope: !23)
