; ModuleID = 'fibonacci.bc'
source_filename = "fibonacci.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %tmp3, align 4
  store i32 1, i32* %tmp4, align 4
  store i32 10, i32* %tmp2, align 4
  store i32 0, i32* %tmp1, align 4
  br label %bb6

bb6:                                              ; preds = %bb16, %bb
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = load i32, i32* %tmp2, align 4
  %tmp9 = icmp sle i32 %tmp7, %tmp8
  br i1 %tmp9, label %bb10, label %bb19

bb10:                                             ; preds = %bb6
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = load i32, i32* %tmp4, align 4
  %tmp13 = add nsw i32 %tmp11, %tmp12
  store i32 %tmp13, i32* %tmp5, align 4
  %tmp14 = load i32, i32* %tmp4, align 4
  store i32 %tmp14, i32* %tmp3, align 4
  %tmp15 = load i32, i32* %tmp5, align 4
  store i32 %tmp15, i32* %tmp4, align 4
  br label %bb16

bb16:                                             ; preds = %bb10
  %tmp17 = load i32, i32* %tmp1, align 4
  %tmp18 = add nsw i32 %tmp17, 1
  store i32 %tmp18, i32* %tmp1, align 4
  br label %bb6

bb19:                                             ; preds = %bb6
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
