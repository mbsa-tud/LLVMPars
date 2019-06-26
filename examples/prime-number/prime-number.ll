; ModuleID = 'prime-number.bc'
source_filename = "prime-number.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i8, align 1
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %tmp3, align 4
  store i32 17, i32* %tmp1, align 4
  store i32 2, i32* %tmp2, align 4
  br label %bb5

bb5:                                              ; preds = %bb17, %bb
  %tmp6 = load i32, i32* %tmp2, align 4
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = sdiv i32 %tmp7, 2
  %tmp9 = icmp sle i32 %tmp6, %tmp8
  br i1 %tmp9, label %bb10, label %bb20

bb10:                                             ; preds = %bb5
  %tmp11 = load i32, i32* %tmp1, align 4
  %tmp12 = load i32, i32* %tmp2, align 4
  %tmp13 = srem i32 %tmp11, %tmp12
  %tmp14 = icmp eq i32 %tmp13, 0
  br i1 %tmp14, label %bb15, label %bb16

bb15:                                             ; preds = %bb10
  store i32 1, i32* %tmp3, align 4
  br label %bb20

bb16:                                             ; preds = %bb10
  br label %bb17

bb17:                                             ; preds = %bb16
  %tmp18 = load i32, i32* %tmp2, align 4
  %tmp19 = add nsw i32 %tmp18, 1
  store i32 %tmp19, i32* %tmp2, align 4
  br label %bb5

bb20:                                             ; preds = %bb15, %bb5
  %tmp21 = load i32, i32* %tmp3, align 4
  %tmp22 = icmp eq i32 %tmp21, 0
  br i1 %tmp22, label %bb23, label %bb24

bb23:                                             ; preds = %bb20
  store i8 1, i8* %tmp4, align 1
  br label %bb25

bb24:                                             ; preds = %bb20
  store i8 0, i8* %tmp4, align 1
  br label %bb25

bb25:                                             ; preds = %bb24, %bb23
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
