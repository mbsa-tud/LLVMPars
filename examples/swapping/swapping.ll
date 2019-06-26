; ModuleID = 'swapping.bc'
source_filename = "swapping.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca double, align 8
  %tmp2 = alloca double, align 8
  %tmp3 = alloca double, align 8
  store i32 0, i32* %tmp, align 4
  store double 1.000000e+00, double* %tmp1, align 8
  store double 2.000000e+00, double* %tmp2, align 8
  %tmp4 = load double, double* %tmp1, align 8
  store double %tmp4, double* %tmp3, align 8
  %tmp5 = load double, double* %tmp2, align 8
  store double %tmp5, double* %tmp1, align 8
  %tmp6 = load double, double* %tmp3, align 8
  store double %tmp6, double* %tmp2, align 8
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
