; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_10024(%stack_frame* %0) {
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
  %C_flag = alloca i32, align 4
  store i32 %r0, i32* %C_flag, align 4
  br label %entry1

entry1:                                           ; preds = %entry
  %7 = load i32, i32* %C_flag, align 4, !dbg !0
  %8 = and i32 %7, 536870912, !dbg !9
  store i32 %8, i32* %C_flag, align 4, !dbg !10
  %9 = load i32, i32* %C_flag, align 4, !dbg !11
  %10 = icmp ne i32 %9, 0, !dbg !13
  br i1 %10, label %if_then, label %return

if_then:                                          ; preds = %entry1
  store i32 1, i32* %op, align 4
  store i32 -22, i32* %ret_code, align 4
  br label %return

return:                                           ; preds = %entry1, %if_then
  %op_val = load i32, i32* %op, align 4
  %11 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %12 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %11, 32
  %op_ret_sum = add i64 %shifted_op, %12
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 12, column: 11, scope: !1)
!1 = distinct !DISubprogram(name: "do_syscall", scope: !2, file: !2, line: 8, type: !3, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !8)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2020-10024(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2020-10024(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!8 = !{}
!9 = !DILocation(line: 12, column: 18, scope: !1)
!10 = !DILocation(line: 12, column: 9, scope: !1)
!11 = !DILocation(line: 13, column: 6, scope: !12)
!12 = distinct !DILexicalBlock(scope: !1, file: !2, line: 13, column: 6)
!13 = !DILocation(line: 13, column: 13, scope: !12)
