; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_10062_1(%stack_frame* %0) {
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
  %bytes = alloca i8, align 1
  %7 = trunc i32 %r0 to i8
  store i8 %7, i8* %bytes, align 1
  br label %do.body

do.body:                                          ; preds = %entry
  %8 = load i8, i8* %bytes, align 1, !dbg !0
  %9 = zext i8 %8 to i32, !dbg !0
  %10 = icmp sge i32 %9, 4, !dbg !24
  br i1 %10, label %if_then, label %return

if_then:                                          ; preds = %do.body
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %do.body, %if_then
  %op_val = load i32, i32* %op, align 4
  %11 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %12 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %11, 32
  %op_ret_sum = add i64 %shifted_op, %12
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 25, column: 7, scope: !1)
!1 = distinct !DILexicalBlock(scope: !3, file: !2, line: 25, column: 7)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10062(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch")
!3 = distinct !DILexicalBlock(scope: !4, file: !2, line: 24, column: 5)
!4 = distinct !DISubprogram(name: "packet_length_decode", scope: !2, file: !2, line: 18, type: !5, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !20, retainedNodes: !22)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !15}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "buf_ctx", file: !2, line: 13, size: 128, elements: !10)
!10 = !{!11, !14}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "cur", scope: !9, file: !2, line: 14, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !9, file: !2, line: 15, baseType: !12, size: 64, offset: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !16, line: 26, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !18, line: 42, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !21, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !22, retainedTypes: !23, splitDebugInlining: false, nameTableKind: None)
!21 = !DIFile(filename: "/home/mohsen/AutoPatch/Testcases/CVE-Lists/CVE-2020-10062(auto)/patchedFunc.c", directory: "/home/mohsen/AutoPatch/Scripts")
!22 = !{}
!23 = !{!15}
!24 = !DILocation(line: 25, column: 13, scope: !1)
