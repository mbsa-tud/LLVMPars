; ModuleID = 'gcd.bc'
source_filename = "gcd.c"
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
  store i32 15, i32* %tmp1, align 4
  store i32 25, i32* %tmp2, align 4
  %tmp6 = load i32, i32* %tmp2, align 4
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 1, i32* %tmp5, align 4
  br label %bb7

bb7:                                              ; preds = %bb24, %bb
  %tmp8 = load i32, i32* %tmp5, align 4
  %tmp9 = load i32, i32* %tmp1, align 4
  %tmp10 = icmp sle i32 %tmp8, %tmp9
  br i1 %tmp10, label %bb11, label %bb27

bb11:                                             ; preds = %bb7
  %tmp12 = load i32, i32* %tmp1, align 4
  %tmp13 = load i32, i32* %tmp5, align 4
  %tmp14 = srem i32 %tmp12, %tmp13
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %bb16, label %bb23

bb16:                                             ; preds = %bb11
  %tmp17 = load i32, i32* %tmp2, align 4
  %tmp18 = load i32, i32* %tmp5, align 4
  %tmp19 = srem i32 %tmp17, %tmp18
  %tmp20 = icmp eq i32 %tmp19, 0
  br i1 %tmp20, label %bb21, label %bb23

bb21:                                             ; preds = %bb16
  %tmp22 = load i32, i32* %tmp5, align 4
  store i32 %tmp22, i32* %tmp4, align 4
  br label %bb23

bb23:                                             ; preds = %bb21, %bb16, %bb11
  br label %bb24

bb24:                                             ; preds = %bb23
  %tmp25 = load i32, i32* %tmp5, align 4
  %tmp26 = add nsw i32 %tmp25, 1
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb7

bb27:                                             ; preds = %bb7
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
