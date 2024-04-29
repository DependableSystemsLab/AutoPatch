; ModuleID = 'my_module'
source_filename = "my_module"

%stack_frame = type { i32, i32, i32, i32, i32, i32, i32, i32 }

declare i32 @printf(i8*, ...)

define i64 @filter_2784(%stack_frame* %0) {
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
  %ret_addr = alloca i32, align 4
  store i32 %r0, i32* %ret_addr, align 4
  br label %entry1

entry1:                                           ; preds = %entry
  %7 = load i32, i32* %ret_addr, align 4, !dbg !0
  %8 = add nsw i32 %7, 2, !dbg !8
  store i32 %8, i32* %ret_addr, align 4, !dbg !9
  br label %return

return:                                           ; preds = %entry1
  store i32 2, i32* %op, align 4
  %9 = add i32 %r6, 4
  store i32 %9, i32* %ret_code, align 4
  %op_val = load i32, i32* %op, align 4
  %10 = zext i32 %op_val to i64
  %ret_code_val = load i32, i32* %ret_code, align 4
  %11 = zext i32 %ret_code_val to i64
  %shifted_op = shl i64 %10, 32
  %op_ret_sum = add i64 %shifted_op, %11
  ret i64 %op_ret_sum
}

!0 = !DILocation(line: 9, column: 13, scope: !1)
!1 = distinct !DISubprogram(name: "mbedTLS", scope: !2, file: !2, line: 6, type: !3, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!2 = !DIFile(filename: "Testcases/CVE-Lists/CVE-2017-2784(auto)/patchedFunc.c", directory: "~/AutoPatch")
!3 = !DISubroutineType(types: !4)
!4 = !{null}
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "~/AutoPatch/Testcases/CVE-Lists/CVE-2017-2784(auto)/patchedFunc.c", directory: "~/AutoPatch/Scripts")
!7 = !{}
!8 = !DILocation(line: 9, column: 22, scope: !1)
!9 = !DILocation(line: 9, column: 11, scope: !1)
