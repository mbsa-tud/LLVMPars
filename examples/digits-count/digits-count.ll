; ModuleID = 'digits-count.bc'
source_filename = "digits-count.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i64, align 8
  %tmp2 = alloca i32, align 4
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %tmp2, align 4
  store i64 132131, i64* %tmp1, align 8
  br label %bb3

bb3:                                              ; preds = %bb6, %bb
  %tmp4 = load i64, i64* %tmp1, align 8
  %tmp5 = icmp ne i64 %tmp4, 0
  br i1 %tmp5, label %bb6, label %bb11

bb6:                                              ; preds = %bb3
  %tmp7 = load i64, i64* %tmp1, align 8
  %tmp8 = sdiv i64 %tmp7, 10
  store i64 %tmp8, i64* %tmp1, align 8
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = add nsw i32 %tmp9, 1
  store i32 %tmp10, i32* %tmp2, align 4
  br label %bb3

bb11:                                             ; preds = %bb3
  %tmp12 = load i32, i32* %tmp, align 4
  ret i32 %tmp12
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
