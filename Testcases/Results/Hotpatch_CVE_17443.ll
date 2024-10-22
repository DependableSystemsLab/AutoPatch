; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = constant [21 x i8] c"transport_len = %u \0A\00"

declare i32 @printf(i8*, ...)

define i64 @filter_17443(%stack_frame* %0) {
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
  %echo.addr = alloca i8*, align 8
  %7 = inttoptr i32 %r0 to i8*
  store i8* %7, i8** %echo.addr, align 8
  %transport_len_ptr = alloca i16*, align 8
  %8 = inttoptr i32 %r1 to i16*
  store i16* %8, i16** %transport_len_ptr, align 8
  %transport_len = alloca i16, align 2
  %9 = trunc i32 %r2 to i16
  store i16 %9, i16* %transport_len, align 2
  br label %entry1

entry1:                                           ; preds = %entry
  %10 = load i8*, i8** %echo.addr, align 8, !dbg !0
  %11 = getelementptr inbounds i8, i8* %10, i64 38, !dbg !20
  %12 = bitcast i8* %11 to i16*, !dbg !21
  store i16* %12, i16** %transport_len_ptr, align 8, !dbg !22
  %13 = load i16*, i16** %transport_len_ptr, align 8, !dbg !23
  %14 = load i16, i16* %13, align 2, !dbg !24
  store i16 %14, i16* %transport_len, align 2, !dbg !25
  %15 = load i16, i16* %transport_len, align 2, !dbg !26
  %16 = zext i16 %15 to i32, !dbg !26
  %17 = load i16, i16* %transport_len, align 2, !dbg !27
  %18 = zext i16 %17 to i32, !dbg !27
  %19 = icmp slt i32 %18, 8, !dbg !29
  br i1 %19, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %if_then, %entry1
  %op_val = load i32, i32* %op, align 4
  %20 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %21 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %20, 32
  %op_ret_sum = add i64 %shifted_op, %21
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 11, column: 49, scope: !1)
!1 = distinct !DISubprogram(name: "pico_icmp6_send_echoreply", scope: !2, file: !2, line: 8, type: !3, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !14)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-17443(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 24, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 38, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !14, retainedTypes: !15, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2020-17443(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!14 = !{}
!15 = !{!16, !17}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 25, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 40, baseType: !19)
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !DILocation(line: 11, column: 54, scope: !1)
!21 = !DILocation(line: 11, column: 36, scope: !1)
!22 = !DILocation(line: 11, column: 16, scope: !1)
!23 = !DILocation(line: 12, column: 43, scope: !1)
!24 = !DILocation(line: 12, column: 42, scope: !1)
!25 = !DILocation(line: 12, column: 15, scope: !1)
!26 = !DILocation(line: 14, column: 39, scope: !1)
!27 = !DILocation(line: 15, column: 10, scope: !28)
!28 = distinct !DILexicalBlock(scope: !1, file: !2, line: 15, column: 10)
!29 = !DILocation(line: 15, column: 24, scope: !28)
