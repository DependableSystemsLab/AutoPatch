; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_10023(%stack_frame* %0) {
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
  %str.addr = alloca i8*, align 8
  %7 = inttoptr i32 %r0 to i8*
  store i8* %7, i8** %str.addr, align 8
  %len = alloca i16, align 2
  %8 = trunc i32 %r1 to i16
  store i16 %8, i16* %len, align 2
  %shift = alloca i16, align 2
  %9 = trunc i32 %r2 to i16
  store i16 %9, i16* %shift, align 2
  %i = alloca i32, align 4
  store i32 %r3, i32* %i, align 4
  %j = alloca i32, align 4
  br label %for.body10

for.body10:                                       ; preds = %entry
  %10 = load i16, i16* %shift, align 2, !dbg !0
  %11 = zext i16 %10 to i32, !dbg !0
  %12 = icmp sgt i32 %11, 0, !dbg !21
  br i1 %12, label %if.then14, label %return

if.then14:                                        ; No predecessors!
  %13 = load i8*, i8** %str.addr, align 8, !dbg !22
  %14 = load i32, i32* %i, align 4, !dbg !24
  %15 = add nsw i32 %14, 1, !dbg !25
  %16 = sext i32 %15 to i64, !dbg !22
  %17 = getelementptr inbounds i8, i8* %13, i64 %16, !dbg !22
  %18 = load i8*, i8** %str.addr, align 8, !dbg !26
  %19 = load i32, i32* %j, align 4, !dbg !27
  %20 = sext i32 %19 to i64, !dbg !26
  %21 = getelementptr inbounds i8, i8* %18, i64 %20, !dbg !26
  %22 = load i16, i16* %len, align 2, !dbg !28
  %23 = zext i16 %22 to i32, !dbg !28
  %24 = load i32, i32* %j, align 4, !dbg !29
  %25 = sub nsw i32 %23, %24, !dbg !30
  %26 = add nsw i32 %25, 1, !dbg !31
  call void @memmove(i8* %17, i8* %21, i32 %26), !dbg !32
  %27 = load i16, i16* %len, align 2, !dbg !33
  %28 = zext i16 %27 to i32, !dbg !33
  %29 = load i16, i16* %shift, align 2, !dbg !34
  %30 = zext i16 %29 to i32, !dbg !34
  %31 = sub nsw i32 %28, %30, !dbg !35
  %32 = trunc i32 %31 to i16, !dbg !33
  store i16 %32, i16* %len, align 2, !dbg !36
  store i16 0, i16* %shift, align 2, !dbg !37
  br label %return

return:                                           ; preds = %if.then14, %for.body10
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  %op_val = load i32, i32* %op, align 4
  %33 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %34 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %33, 32
  %op_ret_sum = add i64 %shifted_op, %34
  ret i64 %op_ret_sum
}

define void @memmove(i8* %dst, i8* %src, i32 %len) {
entry:
  %0 = alloca i8*, align 8
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i8* %dst, i8** %0, align 8
  store i8* %src, i8** %1, align 8
  store i32 %len, i32* %2, align 4
  store i32 0, i32* %3, align 4, !dbg !38
  br label %for.cond, !dbg !43

for.cond:                                         ; No predecessors!
  %4 = load i32, i32* %3, align 4, !dbg !44
  %5 = load i32, i32* %2, align 4, !dbg !46
  %6 = icmp slt i32 %4, %5, !dbg !47
  br i1 %6, label %for.body, label %for.end, !dbg !48

for.body:                                         ; No predecessors!
  %7 = load i8*, i8** %1, align 8, !dbg !49
  %8 = load i32, i32* %3, align 4, !dbg !51
  %9 = sext i32 %8 to i64, !dbg !49
  %10 = getelementptr inbounds i8, i8* %7, i64 %9, !dbg !49
  %11 = load i8, i8* %10, align 1, !dbg !49
  %12 = load i8*, i8** %0, align 8, !dbg !52
  %13 = load i32, i32* %3, align 4, !dbg !53
  %14 = sext i32 %13 to i64, !dbg !52
  %15 = getelementptr inbounds i8, i8* %12, i64 %14, !dbg !52
  store i8 %11, i8* %15, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; No predecessors!
  %16 = load i32, i32* %3, align 4, !dbg !56
  %17 = add nsw i32 %16, 1, !dbg !56
  store i32 %17, i32* %3, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; No predecessors!
  ret void, !dbg !61
}

!0 = !DILocation(line: 44, column: 9, scope: !1)
!1 = distinct !DILexicalBlock(scope: !3, file: !2, line: 44, column: 9)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10023(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch")
!3 = distinct !DILexicalBlock(scope: !4, file: !2, line: 39, column: 38)
!4 = distinct !DILexicalBlock(scope: !5, file: !2, line: 39, column: 4)
!5 = distinct !DILexicalBlock(scope: !6, file: !2, line: 39, column: 4)
!6 = distinct !DILexicalBlock(scope: !7, file: !2, line: 38, column: 29)
!7 = distinct !DILexicalBlock(scope: !8, file: !2, line: 38, column: 7)
!8 = distinct !DILexicalBlock(scope: !9, file: !2, line: 37, column: 36)
!9 = distinct !DILexicalBlock(scope: !10, file: !2, line: 37, column: 2)
!10 = distinct !DILexicalBlock(scope: !11, file: !2, line: 37, column: 2)
!11 = distinct !DISubprogram(name: "shell_spaces_trim", scope: !2, file: !2, line: 26, type: !12, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!12 = !DISubroutineType(types: !13)
!13 = !{null, !14}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/home/mohsen/AutoPatch/Testcases/CVE-Lists/CVE-2020-10023(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch/Scripts")
!18 = !{}
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocation(line: 44, column: 15, scope: !1)
!22 = !DILocation(line: 45, column: 15, scope: !23)
!23 = distinct !DILexicalBlock(scope: !1, file: !2, line: 44, column: 20)
!24 = !DILocation(line: 45, column: 19, scope: !23)
!25 = !DILocation(line: 45, column: 21, scope: !23)
!26 = !DILocation(line: 45, column: 28, scope: !23)
!27 = !DILocation(line: 45, column: 32, scope: !23)
!28 = !DILocation(line: 45, column: 35, scope: !23)
!29 = !DILocation(line: 45, column: 41, scope: !23)
!30 = !DILocation(line: 45, column: 39, scope: !23)
!31 = !DILocation(line: 45, column: 43, scope: !23)
!32 = !DILocation(line: 45, column: 6, scope: !23)
!33 = !DILocation(line: 46, column: 12, scope: !23)
!34 = !DILocation(line: 46, column: 18, scope: !23)
!35 = !DILocation(line: 46, column: 16, scope: !23)
!36 = !DILocation(line: 46, column: 10, scope: !23)
!37 = !DILocation(line: 47, column: 12, scope: !23)
!38 = !DILocation(line: 21, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !2, line: 21, column: 2)
!40 = distinct !DISubprogram(name: "memmove", scope: !2, file: !2, line: 20, type: !41, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !14, !14, !20}
!43 = !DILocation(line: 21, column: 7, scope: !39)
!44 = !DILocation(line: 21, column: 18, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !2, line: 21, column: 2)
!46 = !DILocation(line: 21, column: 22, scope: !45)
!47 = !DILocation(line: 21, column: 20, scope: !45)
!48 = !DILocation(line: 21, column: 2, scope: !39)
!49 = !DILocation(line: 22, column: 12, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !2, line: 21, column: 32)
!51 = !DILocation(line: 22, column: 16, scope: !50)
!52 = !DILocation(line: 22, column: 3, scope: !50)
!53 = !DILocation(line: 22, column: 7, scope: !50)
!54 = !DILocation(line: 22, column: 10, scope: !50)
!55 = !DILocation(line: 23, column: 2, scope: !50)
!56 = !DILocation(line: 21, column: 28, scope: !45)
!57 = !DILocation(line: 21, column: 2, scope: !45)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 23, column: 2, scope: !39)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 24, column: 1, scope: !40)
