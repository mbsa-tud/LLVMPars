; ModuleID = 'string-length.bc'
source_filename = "string-length.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"nqfwbfwiebfeuifbewuibfuwebwqqqqq\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca [1000 x i8], align 16
  %tmp2 = alloca i8, align 1
  store i32 0, i32* %tmp, align 4
  %tmp3 = getelementptr inbounds [1000 x i8], [1000 x i8]* %tmp1, i32 0, i32 0
  %tmp4 = call i8* @strcpy(i8* %tmp3, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i32 0, i32 0)) #2
  store i8 0, i8* %tmp2, align 1
  br label %bb5

bb5:                                              ; preds = %bb13, %bb
  %tmp6 = load i8, i8* %tmp2, align 1
  %tmp7 = sext i8 %tmp6 to i64
  %tmp8 = getelementptr inbounds [1000 x i8], [1000 x i8]* %tmp1, i64 0, i64 %tmp7
  %tmp9 = load i8, i8* %tmp8, align 1
  %tmp10 = sext i8 %tmp9 to i32
  %tmp11 = icmp ne i32 %tmp10, 0
  br i1 %tmp11, label %bb12, label %bb16

bb12:                                             ; preds = %bb5
  br label %bb13

bb13:                                             ; preds = %bb12
  %tmp14 = load i8, i8* %tmp2, align 1
  %tmp15 = add i8 %tmp14, 1
  store i8 %tmp15, i8* %tmp2, align 1
  br label %bb5

bb16:                                             ; preds = %bb5
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
