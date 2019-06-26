; ModuleID = 'check-armstrong-number.bc'
source_filename = "check-armstrong-number.c"
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
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %tmp4, align 4
  store i32 1634, i32* %tmp1, align 4
  %tmp5 = load i32, i32* %tmp1, align 4
  store i32 %tmp5, i32* %tmp2, align 4
  br label %bb6

bb6:                                              ; preds = %bb9, %bb
  %tmp7 = load i32, i32* %tmp2, align 4
  %tmp8 = icmp ne i32 %tmp7, 0
  br i1 %tmp8, label %bb9, label %bb21

bb9:                                              ; preds = %bb6
  %tmp10 = load i32, i32* %tmp2, align 4
  %tmp11 = srem i32 %tmp10, 10
  store i32 %tmp11, i32* %tmp3, align 4
  %tmp12 = load i32, i32* %tmp3, align 4
  %tmp13 = load i32, i32* %tmp3, align 4
  %tmp14 = mul nsw i32 %tmp12, %tmp13
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = mul nsw i32 %tmp14, %tmp15
  %tmp17 = load i32, i32* %tmp4, align 4
  %tmp18 = add nsw i32 %tmp17, %tmp16
  store i32 %tmp18, i32* %tmp4, align 4
  %tmp19 = load i32, i32* %tmp2, align 4
  %tmp20 = sdiv i32 %tmp19, 10
  store i32 %tmp20, i32* %tmp2, align 4
  br label %bb6

bb21:                                             ; preds = %bb6
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
