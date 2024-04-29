; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = constant [59 x i8] c"pxNBDL: %u, pxTCPPacket: %u, pxTCPHeader: %u, pucLast: %u\0A\00"
@.str1 = private constant [26 x i8] c"Malicious Input, Fixed!  \00"
@0 = private unnamed_addr constant [27 x i8] c"Malicious Input, Fixed!   \00", align 1
@.str.1 = private constant [7 x i8] c"Done2\0A\00"
@1 = private unnamed_addr constant [8 x i8] c"Done2\\n\00", align 1

declare i32 @printf(i8*, ...)

define i64 @filter_16524(%stack_frame* %0) {
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
  %pxNBDL = alloca i8*, align 8
  %7 = inttoptr i32 %r0 to i8*
  store i8* %7, i8** %pxNBDL, align 8
  %pxTCPPacket = alloca i8*, align 8
  %8 = inttoptr i32 %r1 to i8*
  store i8* %8, i8** %pxTCPPacket, align 8
  %pxTCPHeader = alloca i8*, align 8
  %9 = inttoptr i32 %r2 to i8*
  store i8* %9, i8** %pxTCPHeader, align 8
  %pucLast = alloca i8*, align 8
  %10 = inttoptr i32 %r3 to i8*
  store i8* %10, i8** %pucLast, align 8
  br label %entry1

entry1:                                           ; preds = %entry
  %11 = load i8*, i8** %pxTCPPacket, align 8, !dbg !0
  %12 = getelementptr inbounds i8, i8* %11, i64 24, !dbg !16
  %13 = load i8, i8* %12, align 1, !dbg !17
  %14 = zext i8 %13 to i64, !dbg !18
  %15 = inttoptr i64 %14 to i8*, !dbg !18
  %16 = ptrtoint i8* %15 to i8, !dbg !18
  %17 = load i8*, i8** %pxTCPPacket, align 8, !dbg !19
  store i8 %16, i8* %17, align 1, !dbg !20
  %18 = load i8*, i8** %pxTCPPacket, align 8, !dbg !21
  %19 = getelementptr inbounds i8, i8* %18, i64 34, !dbg !22
  store i8* %19, i8** %pxTCPHeader, align 8, !dbg !23
  %20 = load i8*, i8** %pxTCPHeader, align 8, !dbg !24
  %21 = getelementptr inbounds i8, i8* %20, i64 20, !dbg !25
  %22 = load i8*, i8** %pxTCPHeader, align 8, !dbg !26
  %23 = getelementptr inbounds i8, i8* %22, i64 12, !dbg !27
  %24 = load i8, i8* %23, align 1, !dbg !28
  %25 = zext i8 %24 to i32, !dbg !29
  %26 = ashr i32 %25, 4, !dbg !30
  %27 = sub nsw i32 %26, 5, !dbg !31
  %28 = shl i32 %27, 2, !dbg !32
  %29 = sext i32 %28 to i64, !dbg !33
  %30 = getelementptr inbounds i8, i8* %21, i64 %29, !dbg !33
  store i8* %30, i8** %pucLast, align 8, !dbg !34
  %31 = load i8*, i8** %pxNBDL, align 8, !dbg !35
  %32 = load i8, i8* %31, align 1, !dbg !36
  %33 = zext i8 %32 to i32, !dbg !36
  %34 = load i8*, i8** %pxTCPPacket, align 8, !dbg !37
  %35 = load i8, i8* %34, align 1, !dbg !38
  %36 = zext i8 %35 to i32, !dbg !38
  %37 = load i8*, i8** %pxTCPHeader, align 8, !dbg !39
  %38 = load i8, i8* %37, align 1, !dbg !40
  %39 = zext i8 %38 to i32, !dbg !40
  %40 = load i8*, i8** %pucLast, align 8, !dbg !41
  %41 = load i8, i8* %40, align 1, !dbg !42
  %42 = zext i8 %41 to i32, !dbg !42
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i64 0, i64 0), i32 %33, i32 %36, i32 %39, i32 %42), !dbg !43
  %44 = load i8*, i8** %pucLast, align 8, !dbg !44
  %45 = load i8*, i8** %pxTCPPacket, align 8, !dbg !46
  %46 = getelementptr inbounds i8, i8* %45, i64 24, !dbg !47
  %47 = load i8, i8* %46, align 1, !dbg !48
  %48 = zext i8 %47 to i32, !dbg !49
  %49 = load i8*, i8** %pxNBDL, align 8, !dbg !50
  %50 = sext i32 %48 to i64, !dbg !51
  %51 = getelementptr inbounds i8, i8* %49, i64 %50, !dbg !51
  %52 = icmp ugt i8* %44, %51, !dbg !52
  br i1 %52, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if_then, %entry1
  %op_val = load i32, i32* %op, align 4
  %54 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %55 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %54, 32
  %op_ret_sum = add i64 %shifted_op, %55
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0))
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 15, column: 31, scope: !1)
!1 = distinct !DISubprogram(name: "prvCheckOptions", scope: !2, file: !2, line: 8, type: !3, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !8)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2018-16524(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2018-16524(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!8 = !{}
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !12, line: 24, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !14, line: 38, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DILocation(line: 15, column: 43, scope: !1)
!17 = !DILocation(line: 15, column: 29, scope: !1)
!18 = !DILocation(line: 15, column: 17, scope: !1)
!19 = !DILocation(line: 15, column: 3, scope: !1)
!20 = !DILocation(line: 15, column: 15, scope: !1)
!21 = !DILocation(line: 16, column: 41, scope: !1)
!22 = !DILocation(line: 16, column: 53, scope: !1)
!23 = !DILocation(line: 16, column: 15, scope: !1)
!24 = !DILocation(line: 18, column: 49, scope: !1)
!25 = !DILocation(line: 18, column: 61, scope: !1)
!26 = !DILocation(line: 18, column: 75, scope: !1)
!27 = !DILocation(line: 18, column: 87, scope: !1)
!28 = !DILocation(line: 18, column: 73, scope: !1)
!29 = !DILocation(line: 18, column: 72, scope: !1)
!30 = !DILocation(line: 18, column: 94, scope: !1)
!31 = !DILocation(line: 18, column: 100, scope: !1)
!32 = !DILocation(line: 18, column: 105, scope: !1)
!33 = !DILocation(line: 18, column: 67, scope: !1)
!34 = !DILocation(line: 18, column: 15, scope: !1)
!35 = !DILocation(line: 33, column: 77, scope: !1)
!36 = !DILocation(line: 33, column: 76, scope: !1)
!37 = !DILocation(line: 33, column: 86, scope: !1)
!38 = !DILocation(line: 33, column: 85, scope: !1)
!39 = !DILocation(line: 33, column: 100, scope: !1)
!40 = !DILocation(line: 33, column: 99, scope: !1)
!41 = !DILocation(line: 33, column: 114, scope: !1)
!42 = !DILocation(line: 33, column: 113, scope: !1)
!43 = !DILocation(line: 33, column: 6, scope: !1)
!44 = !DILocation(line: 34, column: 10, scope: !45)
!45 = distinct !DILexicalBlock(scope: !1, file: !2, line: 34, column: 10)
!46 = !DILocation(line: 34, column: 25, scope: !45)
!47 = !DILocation(line: 34, column: 37, scope: !45)
!48 = !DILocation(line: 34, column: 23, scope: !45)
!49 = !DILocation(line: 34, column: 22, scope: !45)
!50 = !DILocation(line: 34, column: 46, scope: !45)
!51 = !DILocation(line: 34, column: 44, scope: !45)
!52 = !DILocation(line: 34, column: 18, scope: !45)
