; ModuleID = 'factorial.bc'
source_filename = "factorial.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i64, align 8
  store i32 0, i32* %tmp, align 4
  store i64 1, i64* %tmp3, align 8
  store i32 5, i32* %tmp1, align 4
  store i32 1, i32* %tmp2, align 4
  br label %bb4

bb4:                                              ; preds = %bb13, %bb
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = load i32, i32* %tmp1, align 4
  %tmp7 = icmp sle i32 %tmp5, %tmp6
  br i1 %tmp7, label %bb8, label %bb16

bb8:                                              ; preds = %bb4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sext i32 %tmp9 to i64
  %tmp11 = load i64, i64* %tmp3, align 8
  %tmp12 = mul i64 %tmp11, %tmp10
  store i64 %tmp12, i64* %tmp3, align 8
  br label %bb13

bb13:                                             ; preds = %bb8
  %tmp14 = load i32, i32* %tmp2, align 4
  %tmp15 = add nsw i32 %tmp14, 1
  store i32 %tmp15, i32* %tmp2, align 4
  br label %bb4

bb16:                                             ; preds = %bb4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
