; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_10063(%stack_frame* %0) {
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
  %5 = alloca i32, align 4
  br label %if.end

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %4, align 4, !dbg !0
  %7 = add i32 %6, 4095, !dbg !18
  %8 = icmp uge i32 %7, 65535, !dbg !19
  br i1 %8, label %if_then, label %return

if_then:                                          ; preds = %if.end
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %if_then, %if.end
  %op_val = load i32, i32* %op, align 4
  %9 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %10 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %9, 32
  %op_ret_sum = add i64 %shifted_op, %10
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 48, column: 6, scope: !1)
!1 = distinct !DILexicalBlock(scope: !3, file: !2, line: 48, column: 6)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10063(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = distinct !DILexicalBlock(scope: !4, file: !2, line: 33, column: 35)
!4 = distinct !DILexicalBlock(scope: !5, file: !2, line: 33, column: 7)
!5 = distinct !DISubprogram(name: "parse_Option", scope: !2, file: !2, line: 23, type: !6, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !9}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !11, line: 25, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !13, line: 40, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!14 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !17, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2020-10063(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!17 = !{}
!18 = !DILocation(line: 48, column: 10, scope: !1)
!19 = !DILocation(line: 48, column: 18, scope: !1)
