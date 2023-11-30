; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = constant [42 x i8] c"IPv6: home address option with length %u\0A\00"
@.str.1 = constant [41 x i8] c"IPv6: option with type %u and length %u\0A\00"

declare i32 @printf(i8*, ...)

define i64 @filter_17445(%stack_frame* %0) {
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
  %opt_ptr.addr = alloca i32, align 4
  store i32 %r0, i32* %opt_ptr.addr, align 4
  %option = alloca i8*, align 8
  %7 = inttoptr i32 %r1 to i8*
  store i8* %7, i8** %option, align 8
  %len = alloca i8, align 1
  %8 = trunc i32 %r2 to i8
  store i8 %8, i8* %len, align 1
  %optlen = alloca i8, align 1
  %9 = trunc i32 %r3 to i8
  store i8 %9, i8* %optlen, align 1
  br label %while.body

while.body:                                       ; preds = %entry
  %10 = load i8*, i8** %option, align 8, !dbg !0
  %11 = getelementptr inbounds i8, i8* %10, i64 1, !dbg !20
  %12 = load i8, i8* %11, align 1, !dbg !21
  %13 = zext i8 %12 to i32, !dbg !21
  %14 = add nsw i32 %13, 2, !dbg !22
  %15 = trunc i32 %14 to i8, !dbg !23
  store i8 %15, i8* %optlen, align 1, !dbg !24
  %16 = load i32, i32* %opt_ptr.addr, align 4, !dbg !25
  %17 = load i8, i8* %optlen, align 1, !dbg !27
  %18 = zext i8 %17 to i32, !dbg !27
  %19 = add i32 %16, %18, !dbg !28
  %20 = load i32, i32* %opt_ptr.addr, align 4, !dbg !29
  %21 = icmp ule i32 %19, %20, !dbg !30
  br i1 %21, label %if_then, label %lor.lhs.false

lor.lhs.false:                                    ; No predecessors!
  %22 = load i8*, i8** %option, align 8, !dbg !31
  %23 = load i8, i8* %optlen, align 1, !dbg !32
  %24 = zext i8 %23 to i32, !dbg !32
  %25 = sext i32 %24 to i64, !dbg !33
  %26 = getelementptr inbounds i8, i8* %22, i64 %25, !dbg !33
  %27 = load i8*, i8** %option, align 8, !dbg !34
  %28 = icmp ule i8* %26, %27, !dbg !35
  br i1 %28, label %if_then, label %lor.lhs.false15

lor.lhs.false15:                                  ; No predecessors!
  %29 = load i8, i8* %len, align 1, !dbg !36
  %30 = zext i8 %29 to i32, !dbg !36
  %31 = load i8, i8* %optlen, align 1, !dbg !37
  %32 = zext i8 %31 to i32, !dbg !37
  %33 = sub nsw i32 %30, %32, !dbg !38
  %34 = load i8, i8* %len, align 1, !dbg !39
  %35 = zext i8 %34 to i32, !dbg !39
  %36 = icmp sge i32 %33, %35, !dbg !40
  br i1 %36, label %if_then, label %return

if_then:                                          ; preds = %lor.lhs.false15, %lor.lhs.false, %while.body
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %lor.lhs.false15, %if_then
  %op_val = load i32, i32* %op, align 4
  %37 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %38 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %37, 32
  %op_ret_sum = add i64 %shifted_op, %38
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 21, column: 33, scope: !1)
!1 = distinct !DILexicalBlock(scope: !3, file: !2, line: 20, column: 14)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-17445(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch")
!3 = distinct !DISubprogram(name: "pico_ipv6_process_destopt", scope: !2, file: !2, line: 11, type: !4, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !13}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !9, line: 24, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !9, line: 26, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !15)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "/home/mohsen/AutoPatch/Testcases/CVE-Lists/CVE-2020-17445(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch/Scripts")
!18 = !{}
!19 = !{!13, !8}
!20 = !DILocation(line: 21, column: 40, scope: !1)
!21 = !DILocation(line: 21, column: 31, scope: !1)
!22 = !DILocation(line: 21, column: 45, scope: !1)
!23 = !DILocation(line: 21, column: 21, scope: !1)
!24 = !DILocation(line: 21, column: 19, scope: !1)
!25 = !DILocation(line: 24, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !1, file: !2, line: 24, column: 16)
!27 = !DILocation(line: 24, column: 26, scope: !26)
!28 = !DILocation(line: 24, column: 24, scope: !26)
!29 = !DILocation(line: 24, column: 36, scope: !26)
!30 = !DILocation(line: 24, column: 33, scope: !26)
!31 = !DILocation(line: 24, column: 47, scope: !26)
!32 = !DILocation(line: 24, column: 56, scope: !26)
!33 = !DILocation(line: 24, column: 54, scope: !26)
!34 = !DILocation(line: 24, column: 66, scope: !26)
!35 = !DILocation(line: 24, column: 63, scope: !26)
!36 = !DILocation(line: 24, column: 76, scope: !26)
!37 = !DILocation(line: 24, column: 82, scope: !26)
!38 = !DILocation(line: 24, column: 80, scope: !26)
!39 = !DILocation(line: 24, column: 92, scope: !26)
!40 = !DILocation(line: 24, column: 89, scope: !26)
