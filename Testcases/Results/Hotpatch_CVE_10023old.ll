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
  %10 = load i8*, i8** %str.addr, align 8, !dbg !0
  %11 = load i32, i32* %j, align 4, !dbg !21
  %12 = sext i32 %11 to i64, !dbg !0
  %13 = getelementptr inbounds i8, i8* %10, i64 %12, !dbg !0
  %14 = load i8, i8* %13, align 1, !dbg !0
  %15 = sext i8 %14 to i32, !dbg !22
  %16 = trunc i32 %15 to i8, !dbg !22
  %17 = call i32 @isspace(i8 signext %16), !dbg !23
  %18 = icmp ne i32 %17, 0, !dbg !23
  br i1 %18, label %if.then17, label %if.end21

if.then17:                                        ; No predecessors!
  %19 = load i16, i16* %shift, align 2, !dbg !24
  %20 = zext i16 %19 to i32, !dbg !24
  %21 = add nsw i32 %20, 1, !dbg !26
  %22 = trunc i32 %21 to i16, !dbg !24
  store i16 %22, i16* %shift, align 2, !dbg !27
  br label %if.end21, !dbg !28

if.end21:                                         ; No predecessors!
  %23 = load i16, i16* %shift, align 2, !dbg !29
  %24 = zext i16 %23 to i32, !dbg !29
  %25 = icmp sgt i32 %24, 0, !dbg !31
  br i1 %25, label %if.then25, label %return

if.then25:                                        ; No predecessors!
  %26 = load i8*, i8** %str.addr, align 8, !dbg !32
  %27 = load i32, i32* %i, align 4, !dbg !34
  %28 = add nsw i32 %27, 1, !dbg !35
  %29 = sext i32 %28 to i64, !dbg !32
  %30 = getelementptr inbounds i8, i8* %26, i64 %29, !dbg !32
  %31 = load i8*, i8** %str.addr, align 8, !dbg !36
  %32 = load i32, i32* %j, align 4, !dbg !37
  %33 = sext i32 %32 to i64, !dbg !36
  %34 = getelementptr inbounds i8, i8* %31, i64 %33, !dbg !36
  %35 = load i16, i16* %len, align 2, !dbg !38
  %36 = zext i16 %35 to i32, !dbg !38
  %37 = load i32, i32* %j, align 4, !dbg !39
  %38 = sub nsw i32 %36, %37, !dbg !40
  %39 = add nsw i32 %38, 1, !dbg !41
  call void @memmove(i8* %30, i8* %34, i32 %39), !dbg !42
  %40 = load i16, i16* %len, align 2, !dbg !43
  %41 = zext i16 %40 to i32, !dbg !43
  %42 = load i16, i16* %shift, align 2, !dbg !44
  %43 = zext i16 %42 to i32, !dbg !44
  %44 = sub nsw i32 %41, %43, !dbg !45
  %45 = trunc i32 %44 to i16, !dbg !43
  store i16 %45, i16* %len, align 2, !dbg !46
  store i16 0, i16* %shift, align 2, !dbg !47
  br label %return

return:                                           ; preds = %if.then25, %if.end21
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  %op_val = load i32, i32* %op, align 4
  %46 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %47 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %46, 32
  %op_ret_sum = add i64 %shifted_op, %47
  ret i64 %op_ret_sum
}

define i32 @isspace(i8 %v) {
entry:
  %0 = alloca i8, align 1
  store i8 %v, i8* %0, align 1
  %1 = load i8, i8* %0, align 1, !dbg !48
  %2 = sext i8 %1 to i32, !dbg !48
  %3 = icmp eq i32 %2, 32, !dbg !52
  %4 = zext i1 %3 to i32, !dbg !52
  ret i32 %4, !dbg !53
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
  store i32 0, i32* %3, align 4, !dbg !54
  br label %for.cond, !dbg !59

for.cond:                                         ; No predecessors!
  %4 = load i32, i32* %3, align 4, !dbg !60
  %5 = load i32, i32* %2, align 4, !dbg !62
  %6 = icmp slt i32 %4, %5, !dbg !63
  br i1 %6, label %for.body, label %for.end, !dbg !64

for.body:                                         ; No predecessors!
  %7 = load i8*, i8** %1, align 8, !dbg !65
  %8 = load i32, i32* %3, align 4, !dbg !67
  %9 = sext i32 %8 to i64, !dbg !65
  %10 = getelementptr inbounds i8, i8* %7, i64 %9, !dbg !65
  %11 = load i8, i8* %10, align 1, !dbg !65
  %12 = load i8*, i8** %0, align 8, !dbg !68
  %13 = load i32, i32* %3, align 4, !dbg !69
  %14 = sext i32 %13 to i64, !dbg !68
  %15 = getelementptr inbounds i8, i8* %12, i64 %14, !dbg !68
  store i8 %11, i8* %15, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; No predecessors!
  %16 = load i32, i32* %3, align 4, !dbg !72
  %17 = add nsw i32 %16, 1, !dbg !72
  store i32 %17, i32* %3, align 4, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; No predecessors!
  ret void, !dbg !77
}

!0 = !DILocation(line: 40, column: 22, scope: !1)
!1 = distinct !DILexicalBlock(scope: !3, file: !2, line: 40, column: 9)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10023(auto)/patchedFunc.c", directory: "~/AutoPatch")
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
!17 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2020-10023(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!18 = !{}
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocation(line: 40, column: 26, scope: !1)
!22 = !DILocation(line: 40, column: 17, scope: !1)
!23 = !DILocation(line: 40, column: 9, scope: !1)
!24 = !DILocation(line: 41, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !1, file: !2, line: 40, column: 31)
!26 = !DILocation(line: 41, column: 20, scope: !25)
!27 = !DILocation(line: 41, column: 12, scope: !25)
!28 = !DILocation(line: 43, column: 5, scope: !25)
!29 = !DILocation(line: 44, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !3, file: !2, line: 44, column: 9)
!31 = !DILocation(line: 44, column: 15, scope: !30)
!32 = !DILocation(line: 45, column: 15, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !2, line: 44, column: 20)
!34 = !DILocation(line: 45, column: 19, scope: !33)
!35 = !DILocation(line: 45, column: 21, scope: !33)
!36 = !DILocation(line: 45, column: 28, scope: !33)
!37 = !DILocation(line: 45, column: 32, scope: !33)
!38 = !DILocation(line: 45, column: 35, scope: !33)
!39 = !DILocation(line: 45, column: 41, scope: !33)
!40 = !DILocation(line: 45, column: 39, scope: !33)
!41 = !DILocation(line: 45, column: 43, scope: !33)
!42 = !DILocation(line: 45, column: 6, scope: !33)
!43 = !DILocation(line: 46, column: 12, scope: !33)
!44 = !DILocation(line: 46, column: 18, scope: !33)
!45 = !DILocation(line: 46, column: 16, scope: !33)
!46 = !DILocation(line: 46, column: 10, scope: !33)
!47 = !DILocation(line: 47, column: 12, scope: !33)
!48 = !DILocation(line: 17, column: 9, scope: !49)
!49 = distinct !DISubprogram(name: "isspace", scope: !2, file: !2, line: 16, type: !50, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!50 = !DISubroutineType(types: !51)
!51 = !{!20, !15}
!52 = !DILocation(line: 17, column: 11, scope: !49)
!53 = !DILocation(line: 17, column: 2, scope: !49)
!54 = !DILocation(line: 21, column: 11, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !2, line: 21, column: 2)
!56 = distinct !DISubprogram(name: "memmove", scope: !2, file: !2, line: 20, type: !57, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !14, !14, !20}
!59 = !DILocation(line: 21, column: 7, scope: !55)
!60 = !DILocation(line: 21, column: 18, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !2, line: 21, column: 2)
!62 = !DILocation(line: 21, column: 22, scope: !61)
!63 = !DILocation(line: 21, column: 20, scope: !61)
!64 = !DILocation(line: 21, column: 2, scope: !55)
!65 = !DILocation(line: 22, column: 12, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !2, line: 21, column: 32)
!67 = !DILocation(line: 22, column: 16, scope: !66)
!68 = !DILocation(line: 22, column: 3, scope: !66)
!69 = !DILocation(line: 22, column: 7, scope: !66)
!70 = !DILocation(line: 22, column: 10, scope: !66)
!71 = !DILocation(line: 23, column: 2, scope: !66)
!72 = !DILocation(line: 21, column: 28, scope: !61)
!73 = !DILocation(line: 21, column: 2, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 23, column: 2, scope: !55)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 24, column: 1, scope: !56)
