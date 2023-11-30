; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = constant [76 x i8] c"pxNetwork = %p and pxTCPPacket = %p and pucLast = %p and xdatalength = %u \0A\00"

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
  %pxNetwork = alloca i32*, align 8
  %7 = inttoptr i32 %r0 to i32*
  store i32* %7, i32** %pxNetwork, align 8
  %pxTCPPacket = alloca i8*, align 8
  %8 = inttoptr i32 %r1 to i8*
  store i8* %8, i8** %pxTCPPacket, align 8
  %pxTCPHeader = alloca i8*, align 8
  %9 = inttoptr i32 %r2 to i8*
  store i8* %9, i8** %pxTCPHeader, align 8
  %pucLast = alloca i8*, align 8
  %10 = inttoptr i32 %r3 to i8*
  store i8* %10, i8** %pucLast, align 8
  %xdatalength = alloca i8, align 1
  br label %entry1

entry1:                                           ; preds = %entry
  %11 = load i32*, i32** %pxNetwork, align 8, !dbg !0
  %12 = bitcast i32* %11 to i8*, !dbg !19
  %13 = getelementptr inbounds i8, i8* %12, i64 24, !dbg !20
  store i8* %13, i8** %pxTCPPacket, align 8, !dbg !21
  %14 = load i8*, i8** %pxTCPPacket, align 8, !dbg !22
  %15 = getelementptr inbounds i8, i8* %14, i64 34, !dbg !23
  store i8* %15, i8** %pxTCPHeader, align 8, !dbg !24
  %16 = load i8*, i8** %pxTCPHeader, align 8, !dbg !25
  %17 = getelementptr inbounds i8, i8* %16, i64 20, !dbg !26
  %18 = load i8*, i8** %pxTCPHeader, align 8, !dbg !27
  %19 = getelementptr inbounds i8, i8* %18, i64 12, !dbg !28
  %20 = load i8, i8* %19, align 1, !dbg !29
  %21 = zext i8 %20 to i32, !dbg !30
  %22 = ashr i32 %21, 4, !dbg !31
  %23 = sub nsw i32 %22, 5, !dbg !32
  %24 = shl i32 %23, 2, !dbg !33
  %25 = sext i32 %24 to i64, !dbg !34
  %26 = getelementptr inbounds i8, i8* %17, i64 %25, !dbg !34
  store i8* %26, i8** %pucLast, align 8, !dbg !35
  %27 = load i32*, i32** %pxNetwork, align 8, !dbg !36
  %28 = bitcast i32* %27 to i8*, !dbg !37
  %29 = getelementptr inbounds i8, i8* %28, i64 28, !dbg !38
  %30 = load i8, i8* %29, align 1, !dbg !39
  store i8 %30, i8* %xdatalength, align 1, !dbg !40
  %31 = load i32*, i32** %pxNetwork, align 8, !dbg !41
  %32 = bitcast i32* %31 to i8*, !dbg !42
  %33 = load i8*, i8** %pxTCPPacket, align 8, !dbg !43
  %34 = load i8*, i8** %pucLast, align 8, !dbg !44
  %35 = load i8, i8* %xdatalength, align 1, !dbg !45
  %36 = zext i8 %35 to i32, !dbg !45
  %37 = load i8*, i8** %pucLast, align 8, !dbg !46
  %38 = load i8*, i8** %pxTCPPacket, align 8, !dbg !48
  %39 = load i8, i8* %xdatalength, align 1, !dbg !49
  %40 = zext i8 %39 to i32, !dbg !49
  %41 = sext i32 %40 to i64, !dbg !50
  %42 = getelementptr inbounds i8, i8* %38, i64 %41, !dbg !50
  %43 = icmp ugt i8* %37, %42, !dbg !51
  br i1 %43, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %entry1, %if_then
  %op_val = load i32, i32* %op, align 4
  %44 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %45 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %44, 32
  %op_ret_sum = add i64 %shifted_op, %45
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 11, column: 49, scope: !1)
!1 = distinct !DISubprogram(name: "prvCheckOptions", scope: !2, file: !2, line: 8, type: !3, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !8)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2018-16524(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "/home/mohsen/AutoPatch/Testcases/CVE-Lists/CVE-2018-16524(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch/Scripts")
!8 = !{}
!9 = !{!10, !16, !18}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !12, line: 24, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !14, line: 38, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!19 = !DILocation(line: 11, column: 37, scope: !1)
!20 = !DILocation(line: 11, column: 59, scope: !1)
!21 = !DILocation(line: 11, column: 11, scope: !1)
!22 = !DILocation(line: 12, column: 53, scope: !1)
!23 = !DILocation(line: 12, column: 65, scope: !1)
!24 = !DILocation(line: 12, column: 15, scope: !1)
!25 = !DILocation(line: 14, column: 51, scope: !1)
!26 = !DILocation(line: 14, column: 63, scope: !1)
!27 = !DILocation(line: 14, column: 78, scope: !1)
!28 = !DILocation(line: 14, column: 90, scope: !1)
!29 = !DILocation(line: 14, column: 76, scope: !1)
!30 = !DILocation(line: 14, column: 75, scope: !1)
!31 = !DILocation(line: 14, column: 97, scope: !1)
!32 = !DILocation(line: 14, column: 103, scope: !1)
!33 = !DILocation(line: 14, column: 108, scope: !1)
!34 = !DILocation(line: 14, column: 70, scope: !1)
!35 = !DILocation(line: 14, column: 15, scope: !1)
!36 = !DILocation(line: 15, column: 49, scope: !1)
!37 = !DILocation(line: 15, column: 40, scope: !1)
!38 = !DILocation(line: 15, column: 59, scope: !1)
!39 = !DILocation(line: 15, column: 28, scope: !1)
!40 = !DILocation(line: 15, column: 14, scope: !1)
!41 = !DILocation(line: 17, column: 100, scope: !1)
!42 = !DILocation(line: 17, column: 93, scope: !1)
!43 = !DILocation(line: 17, column: 118, scope: !1)
!44 = !DILocation(line: 17, column: 139, scope: !1)
!45 = !DILocation(line: 17, column: 149, scope: !1)
!46 = !DILocation(line: 18, column: 10, scope: !47)
!47 = distinct !DILexicalBlock(scope: !1, file: !2, line: 18, column: 10)
!48 = !DILocation(line: 18, column: 20, scope: !47)
!49 = !DILocation(line: 18, column: 34, scope: !47)
!50 = !DILocation(line: 18, column: 32, scope: !47)
!51 = !DILocation(line: 18, column: 18, scope: !47)
