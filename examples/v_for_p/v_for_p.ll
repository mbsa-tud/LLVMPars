; ModuleID = 'v_for_p.bc'
source_filename = "v_for_p.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@e = dso_local global double 1.000000e-01, align 8
@P_1_Gain = dso_local global double 4.963000e+01, align 8
@I_gainval = dso_local global double 5.945000e+00, align 8
@TSamp_WtEt = dso_local global double 1.035600e+02, align 8
@I_DSTATE = dso_local global double 0.000000e+00, align 8
@UD_DSTATE = dso_local global double 0.000000e+00, align 8
@u = dso_local global double 0.000000e+00, align 8
@P_2_Gain = dso_local global double 4.963000e+01, align 8
@P_3_Gain = dso_local global double 4.965000e+01, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  store i32 0, i32* %tmp, align 4
  store i32 1, i32* %tmp1, align 4
  br label %bb2

bb2:                                              ; preds = %bb6, %bb
  %tmp3 = load i32, i32* %tmp1, align 4
  %tmp4 = icmp sle i32 %tmp3, 100
  br i1 %tmp4, label %bb5, label %bb9

bb5:                                              ; preds = %bb2
  call void @step(i32 10)
  br label %bb6

bb6:                                              ; preds = %bb5
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = add nsw i32 %tmp7, 1
  store i32 %tmp8, i32* %tmp1, align 4
  br label %bb2

bb9:                                              ; preds = %bb2
  %tmp10 = load i32, i32* %tmp, align 4
  ret i32 %tmp10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @step(i32 %arg) #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca double, align 8
  %tmp3 = alloca double, align 8
  %tmp4 = alloca double, align 8
  store i32 %arg, i32* %tmp, align 4
  %tmp5 = load i32, i32* %tmp, align 4
  %tmp6 = mul nsw i32 %tmp5, 2
  store i32 %tmp6, i32* %tmp1, align 4
  %tmp7 = load double, double* @P_1_Gain, align 8
  %tmp8 = load double, double* @e, align 8
  %tmp9 = fmul double %tmp7, %tmp8
  store double %tmp9, double* %tmp2, align 8
  %tmp10 = load double, double* @P_2_Gain, align 8
  %tmp11 = load double, double* @e, align 8
  %tmp12 = fmul double %tmp10, %tmp11
  %tmp13 = load double, double* %tmp2, align 8
  %tmp14 = fcmp oeq double %tmp12, %tmp13
  br i1 %tmp14, label %bb19, label %bb15

bb15:                                             ; preds = %bb
  %tmp16 = load double, double* @P_3_Gain, align 8
  %tmp17 = load double, double* @e, align 8
  %tmp18 = fmul double %tmp16, %tmp17
  store double %tmp18, double* %tmp2, align 8
  br label %bb19

bb19:                                             ; preds = %bb15, %bb
  %tmp20 = load double, double* @I_gainval, align 8
  %tmp21 = load double, double* @e, align 8
  %tmp22 = fmul double %tmp20, %tmp21
  %tmp23 = load double, double* @I_DSTATE, align 8
  %tmp24 = fadd double %tmp22, %tmp23
  store double %tmp24, double* %tmp4, align 8
  %tmp25 = load double, double* @e, align 8
  %tmp26 = load double, double* @TSamp_WtEt, align 8
  %tmp27 = fmul double %tmp25, %tmp26
  store double %tmp27, double* %tmp3, align 8
  %tmp28 = load double, double* %tmp2, align 8
  %tmp29 = load double, double* %tmp4, align 8
  %tmp30 = fadd double %tmp28, %tmp29
  %tmp31 = load double, double* %tmp3, align 8
  %tmp32 = load double, double* @UD_DSTATE, align 8
  %tmp33 = fsub double %tmp31, %tmp32
  %tmp34 = fadd double %tmp30, %tmp33
  store double %tmp34, double* @u, align 8
  %tmp35 = load double, double* %tmp4, align 8
  store double %tmp35, double* @I_DSTATE, align 8
  %tmp36 = load double, double* %tmp3, align 8
  store double %tmp36, double* @UD_DSTATE, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
