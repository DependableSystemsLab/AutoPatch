; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_10062_2(%stack_frame* %0) {
entry:
  %op = alloca i32, align 4
  %ret_code = alloca i32, align 4
  %1 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 0
  %r0 = load i32, i32* %1, align 4
  %2 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 1
  %r1 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds %stack_frame, %stack_frame* %0, i32 0, i32 2
  %r2 = load i32, i32* %3, align 4
  store i32 0, i32* %op, align 4
  store i32 0, i32* %ret_code, align 4
  %4 = alloca i32, align 4
  store i32 %r0, i32* %4, align 4
  br label %do.end

do.end:                                           ; preds = %entry
  %5 = load i32, i32* %4, align 4, !dbg !0
  %6 = icmp ugt i32 %5, 268435455, !dbg !23
  br i1 %6, label %if_then, label %return

if_then:                                          ; preds = %do.end
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %if_then, %do.end
  %op_val = load i32, i32* %op, align 4
  %7 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %8 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %7, 32
  %op_ret_sum = add i64 %shifted_op, %8
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 38, column: 6, scope: !1)
!1 = distinct !DILexicalBlock(scope: !3, file: !2, line: 38, column: 6)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10062(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = distinct !DISubprogram(name: "packet_length_decode", scope: !2, file: !2, line: 18, type: !4, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !14}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "buf_ctx", file: !2, line: 13, size: 128, elements: !9)
!9 = !{!10, !13}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "cur", scope: !8, file: !2, line: 14, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !8, file: !2, line: 15, baseType: !11, size: 64, offset: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !17, line: 42, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !22, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2020-10062(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!21 = !{}
!22 = !{!14}
!23 = !DILocation(line: 38, column: 13, scope: !1)
