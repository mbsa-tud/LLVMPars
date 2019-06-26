; ModuleID = 'standard-deviation.bc'
source_filename = "standard-deviation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.data = private unnamed_addr constant [10 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00, float 0.000000e+00], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca [10 x float], align 16
  store i32 0, i32* %tmp, align 4
  %tmp3 = bitcast [10 x float]* %tmp2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp3, i8* align 16 bitcast ([10 x float]* @main.data to i8*), i64 40, i1 false)
  %tmp4 = getelementptr inbounds [10 x float], [10 x float]* %tmp2, i32 0, i32 0
  %tmp5 = call float @calculateSD(float* %tmp4)
  %tmp6 = fptosi float %tmp5 to i32
  store i32 %tmp6, i32* %tmp1, align 4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @calculateSD(float* %arg) #0 {
bb:
  %tmp = alloca float*, align 8
  %tmp1 = alloca float, align 4
  %tmp2 = alloca float, align 4
  %tmp3 = alloca float, align 4
  %tmp4 = alloca i32, align 4
  store float* %arg, float** %tmp, align 8
  store float 0.000000e+00, float* %tmp1, align 4
  store float 0.000000e+00, float* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb5

bb5:                                              ; preds = %bb16, %bb
  %tmp6 = load i32, i32* %tmp4, align 4
  %tmp7 = icmp slt i32 %tmp6, 10
  br i1 %tmp7, label %bb8, label %bb19

bb8:                                              ; preds = %bb5
  %tmp9 = load float*, float** %tmp, align 8
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = sext i32 %tmp10 to i64
  %tmp12 = getelementptr inbounds float, float* %tmp9, i64 %tmp11
  %tmp13 = load float, float* %tmp12, align 4
  %tmp14 = load float, float* %tmp1, align 4
  %tmp15 = fadd float %tmp14, %tmp13
  store float %tmp15, float* %tmp1, align 4
  br label %bb16

bb16:                                             ; preds = %bb8
  %tmp17 = load i32, i32* %tmp4, align 4
  %tmp18 = add nsw i32 %tmp17, 1
  store i32 %tmp18, i32* %tmp4, align 4
  br label %bb5

bb19:                                             ; preds = %bb5
  %tmp20 = load float, float* %tmp1, align 4
  %tmp21 = fdiv float %tmp20, 1.000000e+01
  store float %tmp21, float* %tmp2, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb22

bb22:                                             ; preds = %bb39, %bb19
  %tmp23 = load i32, i32* %tmp4, align 4
  %tmp24 = icmp slt i32 %tmp23, 10
  br i1 %tmp24, label %bb25, label %bb42

bb25:                                             ; preds = %bb22
  %tmp26 = load float*, float** %tmp, align 8
  %tmp27 = load i32, i32* %tmp4, align 4
  %tmp28 = sext i32 %tmp27 to i64
  %tmp29 = getelementptr inbounds float, float* %tmp26, i64 %tmp28
  %tmp30 = load float, float* %tmp29, align 4
  %tmp31 = load float, float* %tmp2, align 4
  %tmp32 = fsub float %tmp30, %tmp31
  %tmp33 = fpext float %tmp32 to double
  %tmp34 = call double @pow(double %tmp33, double 2.000000e+00) #3
  %tmp35 = load float, float* %tmp3, align 4
  %tmp36 = fpext float %tmp35 to double
  %tmp37 = fadd double %tmp36, %tmp34
  %tmp38 = fptrunc double %tmp37 to float
  store float %tmp38, float* %tmp3, align 4
  br label %bb39

bb39:                                             ; preds = %bb25
  %tmp40 = load i32, i32* %tmp4, align 4
  %tmp41 = add nsw i32 %tmp40, 1
  store i32 %tmp41, i32* %tmp4, align 4
  br label %bb22

bb42:                                             ; preds = %bb22
  %tmp43 = load float, float* %tmp3, align 4
  %tmp44 = fdiv float %tmp43, 1.000000e+01
  %tmp45 = fpext float %tmp44 to double
  %tmp46 = call double @sqrt(double %tmp45) #3
  %tmp47 = fptrunc double %tmp46 to float
  ret float %tmp47
}

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
