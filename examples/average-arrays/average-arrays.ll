; ModuleID = 'average-arrays.bc'
source_filename = "average-arrays.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.num = private unnamed_addr constant <{ [9 x float], [91 x float] }> <{ [9 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00], [91 x float] zeroinitializer }>, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca [100 x float], align 16
  %tmp4 = alloca float, align 4
  %tmp5 = alloca float, align 4
  store i32 0, i32* %tmp, align 4
  %tmp6 = bitcast [100 x float]* %tmp3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp6, i8* align 16 bitcast (<{ [9 x float], [91 x float] }>* @main.num to i8*), i64 400, i1 false)
  store float 0.000000e+00, float* %tmp4, align 4
  store i32 10, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %tmp8 = load i32, i32* %tmp2, align 4
  %tmp9 = load i32, i32* %tmp1, align 4
  %tmp10 = icmp slt i32 %tmp8, %tmp9
  br i1 %tmp10, label %bb11, label %bb21

bb11:                                             ; preds = %bb7
  %tmp12 = load i32, i32* %tmp2, align 4
  %tmp13 = sext i32 %tmp12 to i64
  %tmp14 = getelementptr inbounds [100 x float], [100 x float]* %tmp3, i64 0, i64 %tmp13
  %tmp15 = load float, float* %tmp14, align 4
  %tmp16 = load float, float* %tmp4, align 4
  %tmp17 = fadd float %tmp16, %tmp15
  store float %tmp17, float* %tmp4, align 4
  br label %bb18

bb18:                                             ; preds = %bb11
  %tmp19 = load i32, i32* %tmp2, align 4
  %tmp20 = add nsw i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp2, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %tmp22 = load float, float* %tmp4, align 4
  %tmp23 = load i32, i32* %tmp1, align 4
  %tmp24 = sitofp i32 %tmp23 to float
  %tmp25 = fdiv float %tmp22, %tmp24
  store float %tmp25, float* %tmp5, align 4
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
