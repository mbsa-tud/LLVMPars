; ModuleID = 'frequency-character.bc'
source_filename = "frequency-character.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"nqfwbfwiebfeuifbewuibfuwebwqqqqq\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca [1000 x i8], align 16
  %tmp2 = alloca i8, align 1
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %tmp4, align 4
  %tmp5 = getelementptr inbounds [1000 x i8], [1000 x i8]* %tmp1, i32 0, i32 0
  %tmp6 = call i8* @strcpy(i8* %tmp5, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i32 0, i32 0)) #2
  store i8 113, i8* %tmp2, align 1
  store i32 0, i32* %tmp3, align 4
  br label %bb7

bb7:                                              ; preds = %bb27, %bb
  %tmp8 = load i32, i32* %tmp3, align 4
  %tmp9 = sext i32 %tmp8 to i64
  %tmp10 = getelementptr inbounds [1000 x i8], [1000 x i8]* %tmp1, i64 0, i64 %tmp9
  %tmp11 = load i8, i8* %tmp10, align 1
  %tmp12 = sext i8 %tmp11 to i32
  %tmp13 = icmp ne i32 %tmp12, 0
  br i1 %tmp13, label %bb14, label %bb30

bb14:                                             ; preds = %bb7
  %tmp15 = load i8, i8* %tmp2, align 1
  %tmp16 = sext i8 %tmp15 to i32
  %tmp17 = load i32, i32* %tmp3, align 4
  %tmp18 = sext i32 %tmp17 to i64
  %tmp19 = getelementptr inbounds [1000 x i8], [1000 x i8]* %tmp1, i64 0, i64 %tmp18
  %tmp20 = load i8, i8* %tmp19, align 1
  %tmp21 = sext i8 %tmp20 to i32
  %tmp22 = icmp eq i32 %tmp16, %tmp21
  br i1 %tmp22, label %bb23, label %bb26

bb23:                                             ; preds = %bb14
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = add nsw i32 %tmp24, 1
  store i32 %tmp25, i32* %tmp4, align 4
  br label %bb26

bb26:                                             ; preds = %bb23, %bb14
  br label %bb27

bb27:                                             ; preds = %bb26
  %tmp28 = load i32, i32* %tmp3, align 4
  %tmp29 = add nsw i32 %tmp28, 1
  store i32 %tmp29, i32* %tmp3, align 4
  br label %bb7

bb30:                                             ; preds = %bb7
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
