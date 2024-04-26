; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_10028(%stack_frame* %0) {
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
  %gpio_driver_api_ptr_addr = alloca i32*, align 8
  %7 = inttoptr i32 %r0 to i32*
  store i32* %7, i32** %gpio_driver_api_ptr_addr, align 8
  %gpio_driver_api_ptr = alloca i32*, align 8
  %8 = inttoptr i32 %r1 to i32*
  store i32* %8, i32** %gpio_driver_api_ptr, align 8
  %gpio_enable_callback_ptr_addr = alloca i32*, align 8
  %9 = inttoptr i32 %r2 to i32*
  store i32* %9, i32** %gpio_enable_callback_ptr_addr, align 8
  %gpio_enable_callback_ptr = alloca i32*, align 8
  %10 = inttoptr i32 %r3 to i32*
  store i32* %10, i32** %gpio_enable_callback_ptr, align 8
  br label %entry1

entry1:                                           ; preds = %entry
  %11 = load i32*, i32** %gpio_driver_api_ptr_addr, align 8, !dbg !0
  %12 = load i32, i32* %11, align 4, !dbg !16
  %13 = zext i32 %12 to i64, !dbg !17
  %14 = inttoptr i64 %13 to i32*, !dbg !17
  store i32* %14, i32** %gpio_driver_api_ptr, align 8, !dbg !18
  %15 = load i32*, i32** %gpio_driver_api_ptr, align 8, !dbg !19
  %16 = getelementptr inbounds i32, i32* %15, i64 4, !dbg !20
  store i32* %16, i32** %gpio_enable_callback_ptr_addr, align 8, !dbg !21
  %17 = load i32*, i32** %gpio_driver_api_ptr, align 8, !dbg !22
  %18 = load i32, i32* %17, align 4, !dbg !23
  %19 = zext i32 %18 to i64, !dbg !24
  %20 = inttoptr i64 %19 to i32*, !dbg !24
  store i32* %20, i32** %gpio_enable_callback_ptr, align 8, !dbg !25
  %21 = load i32*, i32** %gpio_driver_api_ptr, align 8, !dbg !26
  %22 = load i32, i32* %21, align 4, !dbg !28
  %23 = icmp eq i32 %22, 0, !dbg !29
  br i1 %23, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %entry1, %if_then
  %op_val = load i32, i32* %op, align 4
  %24 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %25 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %24, 32
  %op_ret_sum = add i64 %shifted_op, %25
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 12, column: 52, scope: !1)
!1 = distinct !DISubprogram(name: "z_vrfy_kscan_enable_callback", scope: !2, file: !2, line: 8, type: !3, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !8)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10028(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "/home/mohsen/AutoPatch/Testcases/CVE-Lists/CVE-2020-10028(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch/Scripts")
!8 = !{}
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !12, line: 26, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !14, line: 42, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DILocation(line: 12, column: 51, scope: !1)
!17 = !DILocation(line: 12, column: 38, scope: !1)
!18 = !DILocation(line: 12, column: 16, scope: !1)
!19 = !DILocation(line: 13, column: 48, scope: !1)
!20 = !DILocation(line: 13, column: 68, scope: !1)
!21 = !DILocation(line: 13, column: 16, scope: !1)
!22 = !DILocation(line: 14, column: 57, scope: !1)
!23 = !DILocation(line: 14, column: 56, scope: !1)
!24 = !DILocation(line: 14, column: 43, scope: !1)
!25 = !DILocation(line: 14, column: 16, scope: !1)
!26 = !DILocation(line: 17, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !1, file: !2, line: 17, column: 6)
!28 = !DILocation(line: 17, column: 6, scope: !27)
!29 = !DILocation(line: 17, column: 27, scope: !27)
