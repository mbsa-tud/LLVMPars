; ModuleID = 'leap-year.bc'
source_filename = "leap-year.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i8, align 1
  store i32 0, i32* %tmp, align 4
  store i32 2018, i32* %tmp1, align 4
  %tmp3 = load i32, i32* %tmp1, align 4
  %tmp4 = srem i32 %tmp3, 4
  %tmp5 = icmp eq i32 %tmp4, 0
  br i1 %tmp5, label %bb6, label %bb19

bb6:                                              ; preds = %bb
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = srem i32 %tmp7, 100
  %tmp9 = icmp eq i32 %tmp8, 0
  br i1 %tmp9, label %bb10, label %bb17

bb10:                                             ; preds = %bb6
  %tmp11 = load i32, i32* %tmp1, align 4
  %tmp12 = srem i32 %tmp11, 400
  %tmp13 = icmp eq i32 %tmp12, 0
  br i1 %tmp13, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  store i8 1, i8* %tmp2, align 1
  br label %bb16

bb15:                                             ; preds = %bb10
  store i8 0, i8* %tmp2, align 1
  br label %bb16

bb16:                                             ; preds = %bb15, %bb14
  br label %bb18

bb17:                                             ; preds = %bb6
  store i8 1, i8* %tmp2, align 1
  br label %bb18

bb18:                                             ; preds = %bb17, %bb16
  br label %bb20

bb19:                                             ; preds = %bb
  store i8 0, i8* %tmp2, align 1
  br label %bb20

bb20:                                             ; preds = %bb19, %bb18
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
