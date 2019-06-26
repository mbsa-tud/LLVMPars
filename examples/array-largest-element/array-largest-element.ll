; ModuleID = 'array-largest-element.bc'
source_filename = "array-largest-element.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = private unnamed_addr constant <{ [9 x float], [91 x float] }> <{ [9 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00], [91 x float] zeroinitializer }>, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca [100 x float], align 16
  %tmp4 = alloca float, align 4
  store i32 0, i32* %tmp, align 4
  store i32 10, i32* %tmp2, align 4
  %tmp5 = bitcast [100 x float]* %tmp3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp5, i8* align 16 bitcast (<{ [9 x float], [91 x float] }>* @main.arr to i8*), i64 400, i1 false)
  store i32 1, i32* %tmp1, align 4
  br label %bb6

bb6:                                              ; preds = %bb25, %bb
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = load i32, i32* %tmp2, align 4
  %tmp9 = icmp slt i32 %tmp7, %tmp8
  br i1 %tmp9, label %bb10, label %bb28

bb10:                                             ; preds = %bb6
  %tmp11 = getelementptr inbounds [100 x float], [100 x float]* %tmp3, i64 0, i64 0
  %tmp12 = load float, float* %tmp11, align 16
  %tmp13 = load i32, i32* %tmp1, align 4
  %tmp14 = sext i32 %tmp13 to i64
  %tmp15 = getelementptr inbounds [100 x float], [100 x float]* %tmp3, i64 0, i64 %tmp14
  %tmp16 = load float, float* %tmp15, align 4
  %tmp17 = fcmp olt float %tmp12, %tmp16
  br i1 %tmp17, label %bb18, label %bb24

bb18:                                             ; preds = %bb10
  %tmp19 = load i32, i32* %tmp1, align 4
  %tmp20 = sext i32 %tmp19 to i64
  %tmp21 = getelementptr inbounds [100 x float], [100 x float]* %tmp3, i64 0, i64 %tmp20
  %tmp22 = load float, float* %tmp21, align 4
  %tmp23 = getelementptr inbounds [100 x float], [100 x float]* %tmp3, i64 0, i64 0
  store float %tmp22, float* %tmp23, align 16
  br label %bb24

bb24:                                             ; preds = %bb18, %bb10
  br label %bb25

bb25:                                             ; preds = %bb24
  %tmp26 = load i32, i32* %tmp1, align 4
  %tmp27 = add nsw i32 %tmp26, 1
  store i32 %tmp27, i32* %tmp1, align 4
  br label %bb6

bb28:                                             ; preds = %bb6
  %tmp29 = getelementptr inbounds [100 x float], [100 x float]* %tmp3, i64 0, i64 0
  %tmp30 = load float, float* %tmp29, align 16
  store float %tmp30, float* %tmp4, align 4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
