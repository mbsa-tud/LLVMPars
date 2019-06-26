; ModuleID = 'access-array-pointer.bc'
source_filename = "access-array-pointer.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.data = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca [5 x i32], align 16
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  store i32 0, i32* %tmp, align 4
  %tmp4 = bitcast [5 x i32]* %tmp1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp4, i8* align 16 bitcast ([5 x i32]* @main.data to i8*), i64 20, i1 false)
  store i32 0, i32* %tmp2, align 4
  br label %bb5

bb5:                                              ; preds = %bb14, %bb
  %tmp6 = load i32, i32* %tmp2, align 4
  %tmp7 = icmp slt i32 %tmp6, 5
  br i1 %tmp7, label %bb8, label %bb17

bb8:                                              ; preds = %bb5
  %tmp9 = getelementptr inbounds [5 x i32], [5 x i32]* %tmp1, i32 0, i32 0
  %tmp10 = load i32, i32* %tmp2, align 4
  %tmp11 = sext i32 %tmp10 to i64
  %tmp12 = getelementptr inbounds i32, i32* %tmp9, i64 %tmp11
  %tmp13 = load i32, i32* %tmp12, align 4
  store i32 %tmp13, i32* %tmp3, align 4
  br label %bb14

bb14:                                             ; preds = %bb8
  %tmp15 = load i32, i32* %tmp2, align 4
  %tmp16 = add nsw i32 %tmp15, 1
  store i32 %tmp16, i32* %tmp2, align 4
  br label %bb5

bb17:                                             ; preds = %bb5
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
