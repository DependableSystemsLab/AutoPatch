; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = constant [47 x i8] c"xDataLength = %p and %lu and tcpLength = %lu \0A\00"

declare i32 @printf(i8*, ...)

define i64 @filter_16603(%stack_frame* %0) {
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
  %pxNetwork.addr = alloca i32*, align 8
  %7 = inttoptr i32 %r0 to i32*
  store i32* %7, i32** %pxNetwork.addr, align 8
  %xDataLength = alloca i64, align 8
  %8 = zext i32 %r1 to i64
  store i64 %8, i64* %xDataLength, align 4
  %tcpLength = alloca i64, align 8
  %9 = zext i32 %r2 to i64
  store i64 %9, i64* %tcpLength, align 4
  br label %entry1

entry1:                                           ; preds = %entry
  %10 = load i32*, i32** %pxNetwork.addr, align 8, !dbg !0
  %11 = bitcast i32* %10 to i8*, !dbg !23
  %12 = getelementptr inbounds i8, i8* %11, i64 32, !dbg !24
  %13 = bitcast i8* %12 to i64*, !dbg !25
  %14 = load i64, i64* %13, align 8, !dbg !25
  store i64 %14, i64* %xDataLength, align 8, !dbg !26
  %15 = load i64, i64* %xDataLength, align 8, !dbg !27
  %16 = sub i64 %15, 14, !dbg !28
  %17 = sub i64 %16, 20, !dbg !29
  store i64 %17, i64* %tcpLength, align 8, !dbg !30
  %18 = load i32*, i32** %pxNetwork.addr, align 8, !dbg !31
  %19 = bitcast i32* %18 to i8*, !dbg !32
  %20 = load i64, i64* %xDataLength, align 8, !dbg !33
  %21 = load i64, i64* %tcpLength, align 8, !dbg !34
  %22 = load i64, i64* %tcpLength, align 8, !dbg !35
  %23 = icmp ult i64 %22, 20, !dbg !37
  br i1 %23, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %if_then, %entry1
  %op_val = load i32, i32* %op, align 4
  %24 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %25 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %24, 32
  %op_ret_sum = add i64 %shifted_op, %25
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 17, column: 50, scope: !1)
!1 = distinct !DISubprogram(name: "prvCheckOptions", scope: !2, file: !2, line: 13, type: !3, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !14)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2018-16603(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 26, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 42, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !14, retainedTypes: !15, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2018-16603(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!14 = !{}
!15 = !{!16, !20, !22}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 27, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 45, baseType: !19)
!19 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!23 = !DILocation(line: 17, column: 41, scope: !1)
!24 = !DILocation(line: 17, column: 60, scope: !1)
!25 = !DILocation(line: 17, column: 28, scope: !1)
!26 = !DILocation(line: 17, column: 14, scope: !1)
!27 = !DILocation(line: 19, column: 26, scope: !1)
!28 = !DILocation(line: 19, column: 38, scope: !1)
!29 = !DILocation(line: 19, column: 61, scope: !1)
!30 = !DILocation(line: 19, column: 14, scope: !1)
!31 = !DILocation(line: 21, column: 70, scope: !1)
!32 = !DILocation(line: 21, column: 63, scope: !1)
!33 = !DILocation(line: 21, column: 81, scope: !1)
!34 = !DILocation(line: 21, column: 95, scope: !1)
!35 = !DILocation(line: 22, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !1, file: !2, line: 22, column: 9)
!37 = !DILocation(line: 22, column: 19, scope: !36)
