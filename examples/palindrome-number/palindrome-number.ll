; ModuleID = 'palindrome-number.bc'
source_filename = "palindrome-number.c"
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
  %tmp5 = alloca i8, align 1
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %tmp2, align 4
  store i32 525, i32* %tmp1, align 4
  store i32 525, i32* %tmp4, align 4
  br label %bb6

bb6:                                              ; preds = %bb9, %bb
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = icmp ne i32 %tmp7, 0
  br i1 %tmp8, label %bb9, label %bb18

bb9:                                              ; preds = %bb6
  %tmp10 = load i32, i32* %tmp1, align 4
  %tmp11 = srem i32 %tmp10, 10
  store i32 %tmp11, i32* %tmp3, align 4
  %tmp12 = load i32, i32* %tmp2, align 4
  %tmp13 = mul nsw i32 %tmp12, 10
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = add nsw i32 %tmp13, %tmp14
  store i32 %tmp15, i32* %tmp2, align 4
  %tmp16 = load i32, i32* %tmp1, align 4
  %tmp17 = sdiv i32 %tmp16, 10
  store i32 %tmp17, i32* %tmp1, align 4
  br label %bb6

bb18:                                             ; preds = %bb6
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp2, align 4
  %tmp21 = icmp eq i32 %tmp19, %tmp20
  br i1 %tmp21, label %bb22, label %bb23

bb22:                                             ; preds = %bb18
  store i8 1, i8* %tmp5, align 1
  br label %bb24

bb23:                                             ; preds = %bb18
  store i8 0, i8* %tmp5, align 1
  br label %bb24

bb24:                                             ; preds = %bb23, %bb22
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
