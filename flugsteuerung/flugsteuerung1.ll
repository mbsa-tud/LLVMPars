; ModuleID = '<stdin>'
source_filename = "flugsteuerung.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@atant_cos = dso_local global [16 x i16] [i16 25736, i16 15193, i16 8027, i16 4075, i16 2045, i16 1024, i16 512, i16 256, i16 128, i16 64, i16 32, i16 16, i16 8, i16 4, i16 2, i16 1], align 16
@input_file = common dso_local global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [43 x i8] c"%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;\00", align 1
@imu_data = common dso_local global [6 x i32] zeroinitializer, align 16
@euler_ref = common dso_local global [3 x i32] zeroinitializer, align 4
@az = common dso_local global i32 0, align 4
@quat_navsol = common dso_local global [4 x i32] zeroinitializer, align 16
@quat_ref = common dso_local global [4 x i32] zeroinitializer, align 16
@err_quat.Qsign = private unnamed_addr constant [4 x [4 x i8]] [[4 x i8] zeroinitializer, [4 x i8] c"\00\01\01\00", [4 x i8] c"\00\00\01\01", [4 x i8] c"\00\01\00\01"], align 16
@err_quat.Qindex = private unnamed_addr constant [4 x [4 x i8]] [[4 x i8] c"\00\01\02\03", [4 x i8] c"\01\00\03\02", [4 x i8] c"\02\03\00\01", [4 x i8] c"\03\02\01\00"], align 16
@error_quat = common dso_local global [4 x i32] zeroinitializer, align 16
@s_omegaref = common dso_local global [3 x i32] zeroinitializer, align 4
@s_qref = common dso_local global [3 x i32] zeroinitializer, align 4
@s_zref = common dso_local global i32 0, align 4
@ecg.ctrl_mtrx_L_ = private unnamed_addr constant [8 x i32] [i32 10884, i32 10884, i32 10884, i32 10884, i32 -10884, i32 -10884, i32 -10884, i32 -10884], align 16
@ecg.ctrl_mtrx_M_ = private unnamed_addr constant [8 x i32] [i32 11853, i32 11853, i32 -11853, i32 -11853, i32 -11853, i32 -11853, i32 11853, i32 11853], align 16
@ecg.ctrl_mtrx_N_ = private unnamed_addr constant [8 x i32] [i32 9218, i32 9218, i32 -9218, i32 -9218, i32 9218, i32 9218, i32 -9218, i32 -9218], align 16
@ecg.ctrl_mtrx_Z_ = private unnamed_addr constant [8 x i32] [i32 -8192, i32 -8192, i32 -8192, i32 -8192, i32 -8192, i32 -8192, i32 -8192, i32 -8192], align 16
@mtr_cmd = common dso_local global [8 x i16] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [15 x i8] c"data/input.txt\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"data/output.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@output_file = common dso_local global %struct._IO_FILE* null, align 8
@main.step = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [4 x i8] c"%i;\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sign_1(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 0)
  %tmp = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  %tmp1 = load i32, i32* %tmp, align 4
  %tmp2 = icmp sge i32 %tmp1, 0
  %tmp3 = zext i1 %tmp2 to i64
  %tmp4 = select i1 %tmp2, i32 0, i32 1
  ret i32 %tmp4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sign_2(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 1)
  %tmp = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  %tmp1 = load i32, i32* %tmp, align 4
  %tmp2 = icmp sge i32 %tmp1, 0
  %tmp3 = zext i1 %tmp2 to i64
  %tmp4 = select i1 %tmp2, i32 0, i32 1
  ret i32 %tmp4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sign_3(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 2)
  %tmp = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  %tmp1 = load i32, i32* %tmp, align 4
  %tmp2 = icmp sge i32 %tmp1, 0
  %tmp3 = zext i1 %tmp2 to i64
  %tmp4 = select i1 %tmp2, i32 0, i32 1
  ret i32 %tmp4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sign_4(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 3)
  %tmp = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  %tmp1 = load i32, i32* %tmp, align 4
  %tmp2 = icmp sge i32 %tmp1, 0
  %tmp3 = zext i1 %tmp2 to i64
  %tmp4 = select i1 %tmp2, i32 0, i32 1
  ret i32 %tmp4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sign_5(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 4)
  %tmp = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  %tmp1 = load i32, i32* %tmp, align 4
  %tmp2 = icmp sge i32 %tmp1, 0
  %tmp3 = zext i1 %tmp2 to i64
  %tmp4 = select i1 %tmp2, i32 0, i32 1
  ret i32 %tmp4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sign_6(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 5)
  %tmp = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  %tmp1 = load i32, i32* %tmp, align 4
  %tmp2 = icmp sge i32 %tmp1, 0
  %tmp3 = zext i1 %tmp2 to i64
  %tmp4 = select i1 %tmp2, i32 0, i32 1
  ret i32 %tmp4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power_1(double %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 6)
  %tmp = alloca double, align 8
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store double %arg, double* %tmp, align 8
  store i32 %arg1, i32* %tmp2, align 4
  %tmp5 = load double, double* %tmp, align 8
  %tmp6 = fptosi double %tmp5 to i32
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %1 = call i32 @print(i32 7)
  %tmp8 = load i32, i32* %tmp4, align 4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sub i32 %tmp9, 1
  %tmp11 = icmp ult i32 %tmp8, %tmp10
  br i1 %tmp11, label %bb12, label %bb21

bb12:                                             ; preds = %bb7
  %2 = call i32 @print(i32 8)
  %tmp13 = load double, double* %tmp, align 8
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = sitofp i32 %tmp14 to double
  %tmp16 = fmul double %tmp15, %tmp13
  %tmp17 = fptosi double %tmp16 to i32
  store i32 %tmp17, i32* %tmp3, align 4
  br label %bb18

bb18:                                             ; preds = %bb12
  %3 = call i32 @print(i32 9)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = add i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp4, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %4 = call i32 @print(i32 10)
  %tmp22 = load i32, i32* %tmp3, align 4
  ret i32 %tmp22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power_2(double %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 11)
  %tmp = alloca double, align 8
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store double %arg, double* %tmp, align 8
  store i32 %arg1, i32* %tmp2, align 4
  %tmp5 = load double, double* %tmp, align 8
  %tmp6 = fptosi double %tmp5 to i32
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %1 = call i32 @print(i32 12)
  %tmp8 = load i32, i32* %tmp4, align 4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sub i32 %tmp9, 1
  %tmp11 = icmp ult i32 %tmp8, %tmp10
  br i1 %tmp11, label %bb12, label %bb21

bb12:                                             ; preds = %bb7
  %2 = call i32 @print(i32 13)
  %tmp13 = load double, double* %tmp, align 8
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = sitofp i32 %tmp14 to double
  %tmp16 = fmul double %tmp15, %tmp13
  %tmp17 = fptosi double %tmp16 to i32
  store i32 %tmp17, i32* %tmp3, align 4
  br label %bb18

bb18:                                             ; preds = %bb12
  %3 = call i32 @print(i32 14)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = add i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp4, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %4 = call i32 @print(i32 15)
  %tmp22 = load i32, i32* %tmp3, align 4
  ret i32 %tmp22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power_3(double %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 16)
  %tmp = alloca double, align 8
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store double %arg, double* %tmp, align 8
  store i32 %arg1, i32* %tmp2, align 4
  %tmp5 = load double, double* %tmp, align 8
  %tmp6 = fptosi double %tmp5 to i32
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %1 = call i32 @print(i32 17)
  %tmp8 = load i32, i32* %tmp4, align 4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sub i32 %tmp9, 1
  %tmp11 = icmp ult i32 %tmp8, %tmp10
  br i1 %tmp11, label %bb12, label %bb21

bb12:                                             ; preds = %bb7
  %2 = call i32 @print(i32 18)
  %tmp13 = load double, double* %tmp, align 8
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = sitofp i32 %tmp14 to double
  %tmp16 = fmul double %tmp15, %tmp13
  %tmp17 = fptosi double %tmp16 to i32
  store i32 %tmp17, i32* %tmp3, align 4
  br label %bb18

bb18:                                             ; preds = %bb12
  %3 = call i32 @print(i32 19)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = add i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp4, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %4 = call i32 @print(i32 20)
  %tmp22 = load i32, i32* %tmp3, align 4
  ret i32 %tmp22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power_4(double %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 21)
  %tmp = alloca double, align 8
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store double %arg, double* %tmp, align 8
  store i32 %arg1, i32* %tmp2, align 4
  %tmp5 = load double, double* %tmp, align 8
  %tmp6 = fptosi double %tmp5 to i32
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %1 = call i32 @print(i32 22)
  %tmp8 = load i32, i32* %tmp4, align 4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sub i32 %tmp9, 1
  %tmp11 = icmp ult i32 %tmp8, %tmp10
  br i1 %tmp11, label %bb12, label %bb21

bb12:                                             ; preds = %bb7
  %2 = call i32 @print(i32 23)
  %tmp13 = load double, double* %tmp, align 8
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = sitofp i32 %tmp14 to double
  %tmp16 = fmul double %tmp15, %tmp13
  %tmp17 = fptosi double %tmp16 to i32
  store i32 %tmp17, i32* %tmp3, align 4
  br label %bb18

bb18:                                             ; preds = %bb12
  %3 = call i32 @print(i32 24)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = add i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp4, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %4 = call i32 @print(i32 25)
  %tmp22 = load i32, i32* %tmp3, align 4
  ret i32 %tmp22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power_5(double %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 26)
  %tmp = alloca double, align 8
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store double %arg, double* %tmp, align 8
  store i32 %arg1, i32* %tmp2, align 4
  %tmp5 = load double, double* %tmp, align 8
  %tmp6 = fptosi double %tmp5 to i32
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %1 = call i32 @print(i32 27)
  %tmp8 = load i32, i32* %tmp4, align 4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sub i32 %tmp9, 1
  %tmp11 = icmp ult i32 %tmp8, %tmp10
  br i1 %tmp11, label %bb12, label %bb21

bb12:                                             ; preds = %bb7
  %2 = call i32 @print(i32 28)
  %tmp13 = load double, double* %tmp, align 8
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = sitofp i32 %tmp14 to double
  %tmp16 = fmul double %tmp15, %tmp13
  %tmp17 = fptosi double %tmp16 to i32
  store i32 %tmp17, i32* %tmp3, align 4
  br label %bb18

bb18:                                             ; preds = %bb12
  %3 = call i32 @print(i32 29)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = add i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp4, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %4 = call i32 @print(i32 30)
  %tmp22 = load i32, i32* %tmp3, align 4
  ret i32 %tmp22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @power_6(double %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 31)
  %tmp = alloca double, align 8
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store double %arg, double* %tmp, align 8
  store i32 %arg1, i32* %tmp2, align 4
  %tmp5 = load double, double* %tmp, align 8
  %tmp6 = fptosi double %tmp5 to i32
  store i32 %tmp6, i32* %tmp3, align 4
  store i32 0, i32* %tmp4, align 4
  br label %bb7

bb7:                                              ; preds = %bb18, %bb
  %1 = call i32 @print(i32 32)
  %tmp8 = load i32, i32* %tmp4, align 4
  %tmp9 = load i32, i32* %tmp2, align 4
  %tmp10 = sub i32 %tmp9, 1
  %tmp11 = icmp ult i32 %tmp8, %tmp10
  br i1 %tmp11, label %bb12, label %bb21

bb12:                                             ; preds = %bb7
  %2 = call i32 @print(i32 33)
  %tmp13 = load double, double* %tmp, align 8
  %tmp14 = load i32, i32* %tmp3, align 4
  %tmp15 = sitofp i32 %tmp14 to double
  %tmp16 = fmul double %tmp15, %tmp13
  %tmp17 = fptosi double %tmp16 to i32
  store i32 %tmp17, i32* %tmp3, align 4
  br label %bb18

bb18:                                             ; preds = %bb12
  %3 = call i32 @print(i32 34)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = add i32 %tmp19, 1
  store i32 %tmp20, i32* %tmp4, align 4
  br label %bb7

bb21:                                             ; preds = %bb7
  %4 = call i32 @print(i32 35)
  %tmp22 = load i32, i32* %tmp3, align 4
  ret i32 %tmp22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mulSE315216_1_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 36)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 16
  %tmp9 = trunc i64 %tmp8 to i32
  ret i32 %tmp9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mulSE315216_1_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 37)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 16
  %tmp9 = trunc i64 %tmp8 to i32
  ret i32 %tmp9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mulSE315216_2_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 38)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 16
  %tmp9 = trunc i64 %tmp8 to i32
  ret i32 %tmp9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mulSE315216_2_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 39)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 16
  %tmp9 = trunc i64 %tmp8 to i32
  ret i32 %tmp9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mulSE315216_3_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 40)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 16
  %tmp9 = trunc i64 %tmp8 to i32
  ret i32 %tmp9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mulSE315216_3_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 41)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 16
  %tmp9 = trunc i64 %tmp8 to i32
  ret i32 %tmp9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fixed_cordCS_cos_1(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 42)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i8, align 1
  %tmp7 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i8 0, i8* %tmp6, align 1
  %tmp8 = load i32, i32* %tmp, align 4
  %tmp9 = icmp sgt i32 %tmp8, 51471
  br i1 %tmp9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %1 = call i32 @print(i32 43)
  store i32 0, i32* %tmp1, align 4
  store i32 65536, i32* %tmp2, align 4
  %tmp11 = load i32, i32* %tmp, align 4
  %tmp12 = sub nsw i32 %tmp11, 51471
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb22

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 44)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = icmp slt i32 %tmp14, -51471
  br i1 %tmp15, label %bb16, label %bb19

bb16:                                             ; preds = %bb13
  %3 = call i32 @print(i32 45)
  store i32 0, i32* %tmp1, align 4
  store i32 -65536, i32* %tmp2, align 4
  %tmp17 = load i32, i32* %tmp, align 4
  %tmp18 = add nsw i32 %tmp17, 51471
  store i32 %tmp18, i32* %tmp5, align 4
  br label %bb21

bb19:                                             ; preds = %bb13
  %4 = call i32 @print(i32 46)
  store i32 65536, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  %tmp20 = load i32, i32* %tmp, align 4
  store i32 %tmp20, i32* %tmp5, align 4
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %5 = call i32 @print(i32 47)
  br label %bb22

bb22:                                             ; preds = %bb21, %bb10
  %6 = call i32 @print(i32 48)
  br label %bb23

bb23:                                             ; preds = %bb71, %bb22
  %7 = call i32 @print(i32 49)
  %tmp24 = load i8, i8* %tmp6, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp ne i32 %tmp25, 16
  br i1 %tmp26, label %bb27, label %bb76

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 50)
  %tmp28 = load i32, i32* %tmp5, align 4
  %tmp29 = call i32 @sign_1(i32 %tmp28)
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb51

bb31:                                             ; preds = %bb27
  %9 = call i32 @print(i32 51)
  %tmp32 = load i32, i32* %tmp1, align 4
  %tmp33 = load i32, i32* %tmp2, align 4
  %tmp34 = load i8, i8* %tmp6, align 1
  %tmp35 = zext i8 %tmp34 to i32
  %tmp36 = ashr i32 %tmp33, %tmp35
  %tmp37 = sub nsw i32 %tmp32, %tmp36
  store i32 %tmp37, i32* %tmp3, align 4
  %tmp38 = load i32, i32* %tmp2, align 4
  %tmp39 = load i32, i32* %tmp1, align 4
  %tmp40 = load i8, i8* %tmp6, align 1
  %tmp41 = zext i8 %tmp40 to i32
  %tmp42 = ashr i32 %tmp39, %tmp41
  %tmp43 = add nsw i32 %tmp38, %tmp42
  store i32 %tmp43, i32* %tmp4, align 4
  %tmp44 = load i8, i8* %tmp6, align 1
  %tmp45 = zext i8 %tmp44 to i64
  %tmp46 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp45
  %tmp47 = load i16, i16* %tmp46, align 2
  %tmp48 = zext i16 %tmp47 to i32
  %tmp49 = load i32, i32* %tmp5, align 4
  %tmp50 = sub nsw i32 %tmp49, %tmp48
  store i32 %tmp50, i32* %tmp5, align 4
  br label %bb71

bb51:                                             ; preds = %bb27
  %10 = call i32 @print(i32 52)
  %tmp52 = load i32, i32* %tmp1, align 4
  %tmp53 = load i32, i32* %tmp2, align 4
  %tmp54 = load i8, i8* %tmp6, align 1
  %tmp55 = zext i8 %tmp54 to i32
  %tmp56 = ashr i32 %tmp53, %tmp55
  %tmp57 = add nsw i32 %tmp52, %tmp56
  store i32 %tmp57, i32* %tmp3, align 4
  %tmp58 = load i32, i32* %tmp2, align 4
  %tmp59 = load i32, i32* %tmp1, align 4
  %tmp60 = load i8, i8* %tmp6, align 1
  %tmp61 = zext i8 %tmp60 to i32
  %tmp62 = ashr i32 %tmp59, %tmp61
  %tmp63 = sub nsw i32 %tmp58, %tmp62
  store i32 %tmp63, i32* %tmp4, align 4
  %tmp64 = load i8, i8* %tmp6, align 1
  %tmp65 = zext i8 %tmp64 to i64
  %tmp66 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp65
  %tmp67 = load i16, i16* %tmp66, align 2
  %tmp68 = zext i16 %tmp67 to i32
  %tmp69 = load i32, i32* %tmp5, align 4
  %tmp70 = add nsw i32 %tmp69, %tmp68
  store i32 %tmp70, i32* %tmp5, align 4
  br label %bb71

bb71:                                             ; preds = %bb51, %bb31
  %11 = call i32 @print(i32 53)
  %tmp72 = load i32, i32* %tmp3, align 4
  store i32 %tmp72, i32* %tmp1, align 4
  %tmp73 = load i32, i32* %tmp4, align 4
  store i32 %tmp73, i32* %tmp2, align 4
  %tmp74 = load i8, i8* %tmp6, align 1
  %tmp75 = add i8 %tmp74, 1
  store i8 %tmp75, i8* %tmp6, align 1
  br label %bb23

bb76:                                             ; preds = %bb23
  %12 = call i32 @print(i32 54)
  %tmp77 = load i32, i32* %tmp3, align 4
  %tmp78 = call i32 @mulSE315216_1_1(i32 %tmp77, i32 19898)
  store i32 %tmp78, i32* %tmp7, align 4
  %tmp79 = load i32, i32* %tmp7, align 4
  ret i32 %tmp79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fixed_cordCS_sin_1(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 55)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i8, align 1
  %tmp7 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i8 0, i8* %tmp6, align 1
  %tmp8 = load i32, i32* %tmp, align 4
  %tmp9 = icmp sgt i32 %tmp8, 51471
  br i1 %tmp9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %1 = call i32 @print(i32 56)
  store i32 0, i32* %tmp1, align 4
  store i32 65536, i32* %tmp2, align 4
  %tmp11 = load i32, i32* %tmp, align 4
  %tmp12 = sub nsw i32 %tmp11, 51471
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb22

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 57)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = icmp slt i32 %tmp14, -51471
  br i1 %tmp15, label %bb16, label %bb19

bb16:                                             ; preds = %bb13
  %3 = call i32 @print(i32 58)
  store i32 0, i32* %tmp1, align 4
  store i32 -65536, i32* %tmp2, align 4
  %tmp17 = load i32, i32* %tmp, align 4
  %tmp18 = add nsw i32 %tmp17, 51471
  store i32 %tmp18, i32* %tmp5, align 4
  br label %bb21

bb19:                                             ; preds = %bb13
  %4 = call i32 @print(i32 59)
  store i32 65536, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  %tmp20 = load i32, i32* %tmp, align 4
  store i32 %tmp20, i32* %tmp5, align 4
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %5 = call i32 @print(i32 60)
  br label %bb22

bb22:                                             ; preds = %bb21, %bb10
  %6 = call i32 @print(i32 61)
  br label %bb23

bb23:                                             ; preds = %bb71, %bb22
  %7 = call i32 @print(i32 62)
  %tmp24 = load i8, i8* %tmp6, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp ne i32 %tmp25, 16
  br i1 %tmp26, label %bb27, label %bb76

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 63)
  %tmp28 = load i32, i32* %tmp5, align 4
  %tmp29 = call i32 @sign_2(i32 %tmp28)
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb51

bb31:                                             ; preds = %bb27
  %9 = call i32 @print(i32 64)
  %tmp32 = load i32, i32* %tmp1, align 4
  %tmp33 = load i32, i32* %tmp2, align 4
  %tmp34 = load i8, i8* %tmp6, align 1
  %tmp35 = zext i8 %tmp34 to i32
  %tmp36 = ashr i32 %tmp33, %tmp35
  %tmp37 = sub nsw i32 %tmp32, %tmp36
  store i32 %tmp37, i32* %tmp3, align 4
  %tmp38 = load i32, i32* %tmp2, align 4
  %tmp39 = load i32, i32* %tmp1, align 4
  %tmp40 = load i8, i8* %tmp6, align 1
  %tmp41 = zext i8 %tmp40 to i32
  %tmp42 = ashr i32 %tmp39, %tmp41
  %tmp43 = add nsw i32 %tmp38, %tmp42
  store i32 %tmp43, i32* %tmp4, align 4
  %tmp44 = load i8, i8* %tmp6, align 1
  %tmp45 = zext i8 %tmp44 to i64
  %tmp46 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp45
  %tmp47 = load i16, i16* %tmp46, align 2
  %tmp48 = zext i16 %tmp47 to i32
  %tmp49 = load i32, i32* %tmp5, align 4
  %tmp50 = sub nsw i32 %tmp49, %tmp48
  store i32 %tmp50, i32* %tmp5, align 4
  br label %bb71

bb51:                                             ; preds = %bb27
  %10 = call i32 @print(i32 65)
  %tmp52 = load i32, i32* %tmp1, align 4
  %tmp53 = load i32, i32* %tmp2, align 4
  %tmp54 = load i8, i8* %tmp6, align 1
  %tmp55 = zext i8 %tmp54 to i32
  %tmp56 = ashr i32 %tmp53, %tmp55
  %tmp57 = add nsw i32 %tmp52, %tmp56
  store i32 %tmp57, i32* %tmp3, align 4
  %tmp58 = load i32, i32* %tmp2, align 4
  %tmp59 = load i32, i32* %tmp1, align 4
  %tmp60 = load i8, i8* %tmp6, align 1
  %tmp61 = zext i8 %tmp60 to i32
  %tmp62 = ashr i32 %tmp59, %tmp61
  %tmp63 = sub nsw i32 %tmp58, %tmp62
  store i32 %tmp63, i32* %tmp4, align 4
  %tmp64 = load i8, i8* %tmp6, align 1
  %tmp65 = zext i8 %tmp64 to i64
  %tmp66 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp65
  %tmp67 = load i16, i16* %tmp66, align 2
  %tmp68 = zext i16 %tmp67 to i32
  %tmp69 = load i32, i32* %tmp5, align 4
  %tmp70 = add nsw i32 %tmp69, %tmp68
  store i32 %tmp70, i32* %tmp5, align 4
  br label %bb71

bb71:                                             ; preds = %bb51, %bb31
  %11 = call i32 @print(i32 66)
  %tmp72 = load i32, i32* %tmp3, align 4
  store i32 %tmp72, i32* %tmp1, align 4
  %tmp73 = load i32, i32* %tmp4, align 4
  store i32 %tmp73, i32* %tmp2, align 4
  %tmp74 = load i8, i8* %tmp6, align 1
  %tmp75 = add i8 %tmp74, 1
  store i8 %tmp75, i8* %tmp6, align 1
  br label %bb23

bb76:                                             ; preds = %bb23
  %12 = call i32 @print(i32 67)
  %tmp77 = load i32, i32* %tmp4, align 4
  %tmp78 = call i32 @mulSE315216_1_2(i32 %tmp77, i32 19898)
  store i32 %tmp78, i32* %tmp7, align 4
  %tmp79 = load i32, i32* %tmp7, align 4
  ret i32 %tmp79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fixed_cordCS_cos_2(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 68)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i8, align 1
  %tmp7 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i8 0, i8* %tmp6, align 1
  %tmp8 = load i32, i32* %tmp, align 4
  %tmp9 = icmp sgt i32 %tmp8, 51471
  br i1 %tmp9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %1 = call i32 @print(i32 69)
  store i32 0, i32* %tmp1, align 4
  store i32 65536, i32* %tmp2, align 4
  %tmp11 = load i32, i32* %tmp, align 4
  %tmp12 = sub nsw i32 %tmp11, 51471
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb22

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 70)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = icmp slt i32 %tmp14, -51471
  br i1 %tmp15, label %bb16, label %bb19

bb16:                                             ; preds = %bb13
  %3 = call i32 @print(i32 71)
  store i32 0, i32* %tmp1, align 4
  store i32 -65536, i32* %tmp2, align 4
  %tmp17 = load i32, i32* %tmp, align 4
  %tmp18 = add nsw i32 %tmp17, 51471
  store i32 %tmp18, i32* %tmp5, align 4
  br label %bb21

bb19:                                             ; preds = %bb13
  %4 = call i32 @print(i32 72)
  store i32 65536, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  %tmp20 = load i32, i32* %tmp, align 4
  store i32 %tmp20, i32* %tmp5, align 4
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %5 = call i32 @print(i32 73)
  br label %bb22

bb22:                                             ; preds = %bb21, %bb10
  %6 = call i32 @print(i32 74)
  br label %bb23

bb23:                                             ; preds = %bb71, %bb22
  %7 = call i32 @print(i32 75)
  %tmp24 = load i8, i8* %tmp6, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp ne i32 %tmp25, 16
  br i1 %tmp26, label %bb27, label %bb76

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 76)
  %tmp28 = load i32, i32* %tmp5, align 4
  %tmp29 = call i32 @sign_3(i32 %tmp28)
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb51

bb31:                                             ; preds = %bb27
  %9 = call i32 @print(i32 77)
  %tmp32 = load i32, i32* %tmp1, align 4
  %tmp33 = load i32, i32* %tmp2, align 4
  %tmp34 = load i8, i8* %tmp6, align 1
  %tmp35 = zext i8 %tmp34 to i32
  %tmp36 = ashr i32 %tmp33, %tmp35
  %tmp37 = sub nsw i32 %tmp32, %tmp36
  store i32 %tmp37, i32* %tmp3, align 4
  %tmp38 = load i32, i32* %tmp2, align 4
  %tmp39 = load i32, i32* %tmp1, align 4
  %tmp40 = load i8, i8* %tmp6, align 1
  %tmp41 = zext i8 %tmp40 to i32
  %tmp42 = ashr i32 %tmp39, %tmp41
  %tmp43 = add nsw i32 %tmp38, %tmp42
  store i32 %tmp43, i32* %tmp4, align 4
  %tmp44 = load i8, i8* %tmp6, align 1
  %tmp45 = zext i8 %tmp44 to i64
  %tmp46 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp45
  %tmp47 = load i16, i16* %tmp46, align 2
  %tmp48 = zext i16 %tmp47 to i32
  %tmp49 = load i32, i32* %tmp5, align 4
  %tmp50 = sub nsw i32 %tmp49, %tmp48
  store i32 %tmp50, i32* %tmp5, align 4
  br label %bb71

bb51:                                             ; preds = %bb27
  %10 = call i32 @print(i32 78)
  %tmp52 = load i32, i32* %tmp1, align 4
  %tmp53 = load i32, i32* %tmp2, align 4
  %tmp54 = load i8, i8* %tmp6, align 1
  %tmp55 = zext i8 %tmp54 to i32
  %tmp56 = ashr i32 %tmp53, %tmp55
  %tmp57 = add nsw i32 %tmp52, %tmp56
  store i32 %tmp57, i32* %tmp3, align 4
  %tmp58 = load i32, i32* %tmp2, align 4
  %tmp59 = load i32, i32* %tmp1, align 4
  %tmp60 = load i8, i8* %tmp6, align 1
  %tmp61 = zext i8 %tmp60 to i32
  %tmp62 = ashr i32 %tmp59, %tmp61
  %tmp63 = sub nsw i32 %tmp58, %tmp62
  store i32 %tmp63, i32* %tmp4, align 4
  %tmp64 = load i8, i8* %tmp6, align 1
  %tmp65 = zext i8 %tmp64 to i64
  %tmp66 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp65
  %tmp67 = load i16, i16* %tmp66, align 2
  %tmp68 = zext i16 %tmp67 to i32
  %tmp69 = load i32, i32* %tmp5, align 4
  %tmp70 = add nsw i32 %tmp69, %tmp68
  store i32 %tmp70, i32* %tmp5, align 4
  br label %bb71

bb71:                                             ; preds = %bb51, %bb31
  %11 = call i32 @print(i32 79)
  %tmp72 = load i32, i32* %tmp3, align 4
  store i32 %tmp72, i32* %tmp1, align 4
  %tmp73 = load i32, i32* %tmp4, align 4
  store i32 %tmp73, i32* %tmp2, align 4
  %tmp74 = load i8, i8* %tmp6, align 1
  %tmp75 = add i8 %tmp74, 1
  store i8 %tmp75, i8* %tmp6, align 1
  br label %bb23

bb76:                                             ; preds = %bb23
  %12 = call i32 @print(i32 80)
  %tmp77 = load i32, i32* %tmp3, align 4
  %tmp78 = call i32 @mulSE315216_2_1(i32 %tmp77, i32 19898)
  store i32 %tmp78, i32* %tmp7, align 4
  %tmp79 = load i32, i32* %tmp7, align 4
  ret i32 %tmp79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fixed_cordCS_sin_2(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 81)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i8, align 1
  %tmp7 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i8 0, i8* %tmp6, align 1
  %tmp8 = load i32, i32* %tmp, align 4
  %tmp9 = icmp sgt i32 %tmp8, 51471
  br i1 %tmp9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %1 = call i32 @print(i32 82)
  store i32 0, i32* %tmp1, align 4
  store i32 65536, i32* %tmp2, align 4
  %tmp11 = load i32, i32* %tmp, align 4
  %tmp12 = sub nsw i32 %tmp11, 51471
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb22

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 83)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = icmp slt i32 %tmp14, -51471
  br i1 %tmp15, label %bb16, label %bb19

bb16:                                             ; preds = %bb13
  %3 = call i32 @print(i32 84)
  store i32 0, i32* %tmp1, align 4
  store i32 -65536, i32* %tmp2, align 4
  %tmp17 = load i32, i32* %tmp, align 4
  %tmp18 = add nsw i32 %tmp17, 51471
  store i32 %tmp18, i32* %tmp5, align 4
  br label %bb21

bb19:                                             ; preds = %bb13
  %4 = call i32 @print(i32 85)
  store i32 65536, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  %tmp20 = load i32, i32* %tmp, align 4
  store i32 %tmp20, i32* %tmp5, align 4
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %5 = call i32 @print(i32 86)
  br label %bb22

bb22:                                             ; preds = %bb21, %bb10
  %6 = call i32 @print(i32 87)
  br label %bb23

bb23:                                             ; preds = %bb71, %bb22
  %7 = call i32 @print(i32 88)
  %tmp24 = load i8, i8* %tmp6, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp ne i32 %tmp25, 16
  br i1 %tmp26, label %bb27, label %bb76

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 89)
  %tmp28 = load i32, i32* %tmp5, align 4
  %tmp29 = call i32 @sign_4(i32 %tmp28)
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb51

bb31:                                             ; preds = %bb27
  %9 = call i32 @print(i32 90)
  %tmp32 = load i32, i32* %tmp1, align 4
  %tmp33 = load i32, i32* %tmp2, align 4
  %tmp34 = load i8, i8* %tmp6, align 1
  %tmp35 = zext i8 %tmp34 to i32
  %tmp36 = ashr i32 %tmp33, %tmp35
  %tmp37 = sub nsw i32 %tmp32, %tmp36
  store i32 %tmp37, i32* %tmp3, align 4
  %tmp38 = load i32, i32* %tmp2, align 4
  %tmp39 = load i32, i32* %tmp1, align 4
  %tmp40 = load i8, i8* %tmp6, align 1
  %tmp41 = zext i8 %tmp40 to i32
  %tmp42 = ashr i32 %tmp39, %tmp41
  %tmp43 = add nsw i32 %tmp38, %tmp42
  store i32 %tmp43, i32* %tmp4, align 4
  %tmp44 = load i8, i8* %tmp6, align 1
  %tmp45 = zext i8 %tmp44 to i64
  %tmp46 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp45
  %tmp47 = load i16, i16* %tmp46, align 2
  %tmp48 = zext i16 %tmp47 to i32
  %tmp49 = load i32, i32* %tmp5, align 4
  %tmp50 = sub nsw i32 %tmp49, %tmp48
  store i32 %tmp50, i32* %tmp5, align 4
  br label %bb71

bb51:                                             ; preds = %bb27
  %10 = call i32 @print(i32 91)
  %tmp52 = load i32, i32* %tmp1, align 4
  %tmp53 = load i32, i32* %tmp2, align 4
  %tmp54 = load i8, i8* %tmp6, align 1
  %tmp55 = zext i8 %tmp54 to i32
  %tmp56 = ashr i32 %tmp53, %tmp55
  %tmp57 = add nsw i32 %tmp52, %tmp56
  store i32 %tmp57, i32* %tmp3, align 4
  %tmp58 = load i32, i32* %tmp2, align 4
  %tmp59 = load i32, i32* %tmp1, align 4
  %tmp60 = load i8, i8* %tmp6, align 1
  %tmp61 = zext i8 %tmp60 to i32
  %tmp62 = ashr i32 %tmp59, %tmp61
  %tmp63 = sub nsw i32 %tmp58, %tmp62
  store i32 %tmp63, i32* %tmp4, align 4
  %tmp64 = load i8, i8* %tmp6, align 1
  %tmp65 = zext i8 %tmp64 to i64
  %tmp66 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp65
  %tmp67 = load i16, i16* %tmp66, align 2
  %tmp68 = zext i16 %tmp67 to i32
  %tmp69 = load i32, i32* %tmp5, align 4
  %tmp70 = add nsw i32 %tmp69, %tmp68
  store i32 %tmp70, i32* %tmp5, align 4
  br label %bb71

bb71:                                             ; preds = %bb51, %bb31
  %11 = call i32 @print(i32 92)
  %tmp72 = load i32, i32* %tmp3, align 4
  store i32 %tmp72, i32* %tmp1, align 4
  %tmp73 = load i32, i32* %tmp4, align 4
  store i32 %tmp73, i32* %tmp2, align 4
  %tmp74 = load i8, i8* %tmp6, align 1
  %tmp75 = add i8 %tmp74, 1
  store i8 %tmp75, i8* %tmp6, align 1
  br label %bb23

bb76:                                             ; preds = %bb23
  %12 = call i32 @print(i32 93)
  %tmp77 = load i32, i32* %tmp4, align 4
  %tmp78 = call i32 @mulSE315216_2_2(i32 %tmp77, i32 19898)
  store i32 %tmp78, i32* %tmp7, align 4
  %tmp79 = load i32, i32* %tmp7, align 4
  ret i32 %tmp79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fixed_cordCS_cos_3(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 94)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i8, align 1
  %tmp7 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i8 0, i8* %tmp6, align 1
  %tmp8 = load i32, i32* %tmp, align 4
  %tmp9 = icmp sgt i32 %tmp8, 51471
  br i1 %tmp9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %1 = call i32 @print(i32 95)
  store i32 0, i32* %tmp1, align 4
  store i32 65536, i32* %tmp2, align 4
  %tmp11 = load i32, i32* %tmp, align 4
  %tmp12 = sub nsw i32 %tmp11, 51471
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb22

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 96)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = icmp slt i32 %tmp14, -51471
  br i1 %tmp15, label %bb16, label %bb19

bb16:                                             ; preds = %bb13
  %3 = call i32 @print(i32 97)
  store i32 0, i32* %tmp1, align 4
  store i32 -65536, i32* %tmp2, align 4
  %tmp17 = load i32, i32* %tmp, align 4
  %tmp18 = add nsw i32 %tmp17, 51471
  store i32 %tmp18, i32* %tmp5, align 4
  br label %bb21

bb19:                                             ; preds = %bb13
  %4 = call i32 @print(i32 98)
  store i32 65536, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  %tmp20 = load i32, i32* %tmp, align 4
  store i32 %tmp20, i32* %tmp5, align 4
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %5 = call i32 @print(i32 99)
  br label %bb22

bb22:                                             ; preds = %bb21, %bb10
  %6 = call i32 @print(i32 100)
  br label %bb23

bb23:                                             ; preds = %bb71, %bb22
  %7 = call i32 @print(i32 101)
  %tmp24 = load i8, i8* %tmp6, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp ne i32 %tmp25, 16
  br i1 %tmp26, label %bb27, label %bb76

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 102)
  %tmp28 = load i32, i32* %tmp5, align 4
  %tmp29 = call i32 @sign_5(i32 %tmp28)
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb51

bb31:                                             ; preds = %bb27
  %9 = call i32 @print(i32 103)
  %tmp32 = load i32, i32* %tmp1, align 4
  %tmp33 = load i32, i32* %tmp2, align 4
  %tmp34 = load i8, i8* %tmp6, align 1
  %tmp35 = zext i8 %tmp34 to i32
  %tmp36 = ashr i32 %tmp33, %tmp35
  %tmp37 = sub nsw i32 %tmp32, %tmp36
  store i32 %tmp37, i32* %tmp3, align 4
  %tmp38 = load i32, i32* %tmp2, align 4
  %tmp39 = load i32, i32* %tmp1, align 4
  %tmp40 = load i8, i8* %tmp6, align 1
  %tmp41 = zext i8 %tmp40 to i32
  %tmp42 = ashr i32 %tmp39, %tmp41
  %tmp43 = add nsw i32 %tmp38, %tmp42
  store i32 %tmp43, i32* %tmp4, align 4
  %tmp44 = load i8, i8* %tmp6, align 1
  %tmp45 = zext i8 %tmp44 to i64
  %tmp46 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp45
  %tmp47 = load i16, i16* %tmp46, align 2
  %tmp48 = zext i16 %tmp47 to i32
  %tmp49 = load i32, i32* %tmp5, align 4
  %tmp50 = sub nsw i32 %tmp49, %tmp48
  store i32 %tmp50, i32* %tmp5, align 4
  br label %bb71

bb51:                                             ; preds = %bb27
  %10 = call i32 @print(i32 104)
  %tmp52 = load i32, i32* %tmp1, align 4
  %tmp53 = load i32, i32* %tmp2, align 4
  %tmp54 = load i8, i8* %tmp6, align 1
  %tmp55 = zext i8 %tmp54 to i32
  %tmp56 = ashr i32 %tmp53, %tmp55
  %tmp57 = add nsw i32 %tmp52, %tmp56
  store i32 %tmp57, i32* %tmp3, align 4
  %tmp58 = load i32, i32* %tmp2, align 4
  %tmp59 = load i32, i32* %tmp1, align 4
  %tmp60 = load i8, i8* %tmp6, align 1
  %tmp61 = zext i8 %tmp60 to i32
  %tmp62 = ashr i32 %tmp59, %tmp61
  %tmp63 = sub nsw i32 %tmp58, %tmp62
  store i32 %tmp63, i32* %tmp4, align 4
  %tmp64 = load i8, i8* %tmp6, align 1
  %tmp65 = zext i8 %tmp64 to i64
  %tmp66 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp65
  %tmp67 = load i16, i16* %tmp66, align 2
  %tmp68 = zext i16 %tmp67 to i32
  %tmp69 = load i32, i32* %tmp5, align 4
  %tmp70 = add nsw i32 %tmp69, %tmp68
  store i32 %tmp70, i32* %tmp5, align 4
  br label %bb71

bb71:                                             ; preds = %bb51, %bb31
  %11 = call i32 @print(i32 105)
  %tmp72 = load i32, i32* %tmp3, align 4
  store i32 %tmp72, i32* %tmp1, align 4
  %tmp73 = load i32, i32* %tmp4, align 4
  store i32 %tmp73, i32* %tmp2, align 4
  %tmp74 = load i8, i8* %tmp6, align 1
  %tmp75 = add i8 %tmp74, 1
  store i8 %tmp75, i8* %tmp6, align 1
  br label %bb23

bb76:                                             ; preds = %bb23
  %12 = call i32 @print(i32 106)
  %tmp77 = load i32, i32* %tmp3, align 4
  %tmp78 = call i32 @mulSE315216_3_1(i32 %tmp77, i32 19898)
  store i32 %tmp78, i32* %tmp7, align 4
  %tmp79 = load i32, i32* %tmp7, align 4
  ret i32 %tmp79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fixed_cordCS_sin_3(i32 %arg) #0 {
bb:
  %0 = call i32 @print(i32 107)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i8, align 1
  %tmp7 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i8 0, i8* %tmp6, align 1
  %tmp8 = load i32, i32* %tmp, align 4
  %tmp9 = icmp sgt i32 %tmp8, 51471
  br i1 %tmp9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %1 = call i32 @print(i32 108)
  store i32 0, i32* %tmp1, align 4
  store i32 65536, i32* %tmp2, align 4
  %tmp11 = load i32, i32* %tmp, align 4
  %tmp12 = sub nsw i32 %tmp11, 51471
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb22

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 109)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = icmp slt i32 %tmp14, -51471
  br i1 %tmp15, label %bb16, label %bb19

bb16:                                             ; preds = %bb13
  %3 = call i32 @print(i32 110)
  store i32 0, i32* %tmp1, align 4
  store i32 -65536, i32* %tmp2, align 4
  %tmp17 = load i32, i32* %tmp, align 4
  %tmp18 = add nsw i32 %tmp17, 51471
  store i32 %tmp18, i32* %tmp5, align 4
  br label %bb21

bb19:                                             ; preds = %bb13
  %4 = call i32 @print(i32 111)
  store i32 65536, i32* %tmp1, align 4
  store i32 0, i32* %tmp2, align 4
  %tmp20 = load i32, i32* %tmp, align 4
  store i32 %tmp20, i32* %tmp5, align 4
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %5 = call i32 @print(i32 112)
  br label %bb22

bb22:                                             ; preds = %bb21, %bb10
  %6 = call i32 @print(i32 113)
  br label %bb23

bb23:                                             ; preds = %bb71, %bb22
  %7 = call i32 @print(i32 114)
  %tmp24 = load i8, i8* %tmp6, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp ne i32 %tmp25, 16
  br i1 %tmp26, label %bb27, label %bb76

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 115)
  %tmp28 = load i32, i32* %tmp5, align 4
  %tmp29 = call i32 @sign_6(i32 %tmp28)
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb51

bb31:                                             ; preds = %bb27
  %9 = call i32 @print(i32 116)
  %tmp32 = load i32, i32* %tmp1, align 4
  %tmp33 = load i32, i32* %tmp2, align 4
  %tmp34 = load i8, i8* %tmp6, align 1
  %tmp35 = zext i8 %tmp34 to i32
  %tmp36 = ashr i32 %tmp33, %tmp35
  %tmp37 = sub nsw i32 %tmp32, %tmp36
  store i32 %tmp37, i32* %tmp3, align 4
  %tmp38 = load i32, i32* %tmp2, align 4
  %tmp39 = load i32, i32* %tmp1, align 4
  %tmp40 = load i8, i8* %tmp6, align 1
  %tmp41 = zext i8 %tmp40 to i32
  %tmp42 = ashr i32 %tmp39, %tmp41
  %tmp43 = add nsw i32 %tmp38, %tmp42
  store i32 %tmp43, i32* %tmp4, align 4
  %tmp44 = load i8, i8* %tmp6, align 1
  %tmp45 = zext i8 %tmp44 to i64
  %tmp46 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp45
  %tmp47 = load i16, i16* %tmp46, align 2
  %tmp48 = zext i16 %tmp47 to i32
  %tmp49 = load i32, i32* %tmp5, align 4
  %tmp50 = sub nsw i32 %tmp49, %tmp48
  store i32 %tmp50, i32* %tmp5, align 4
  br label %bb71

bb51:                                             ; preds = %bb27
  %10 = call i32 @print(i32 117)
  %tmp52 = load i32, i32* %tmp1, align 4
  %tmp53 = load i32, i32* %tmp2, align 4
  %tmp54 = load i8, i8* %tmp6, align 1
  %tmp55 = zext i8 %tmp54 to i32
  %tmp56 = ashr i32 %tmp53, %tmp55
  %tmp57 = add nsw i32 %tmp52, %tmp56
  store i32 %tmp57, i32* %tmp3, align 4
  %tmp58 = load i32, i32* %tmp2, align 4
  %tmp59 = load i32, i32* %tmp1, align 4
  %tmp60 = load i8, i8* %tmp6, align 1
  %tmp61 = zext i8 %tmp60 to i32
  %tmp62 = ashr i32 %tmp59, %tmp61
  %tmp63 = sub nsw i32 %tmp58, %tmp62
  store i32 %tmp63, i32* %tmp4, align 4
  %tmp64 = load i8, i8* %tmp6, align 1
  %tmp65 = zext i8 %tmp64 to i64
  %tmp66 = getelementptr inbounds [16 x i16], [16 x i16]* @atant_cos, i64 0, i64 %tmp65
  %tmp67 = load i16, i16* %tmp66, align 2
  %tmp68 = zext i16 %tmp67 to i32
  %tmp69 = load i32, i32* %tmp5, align 4
  %tmp70 = add nsw i32 %tmp69, %tmp68
  store i32 %tmp70, i32* %tmp5, align 4
  br label %bb71

bb71:                                             ; preds = %bb51, %bb31
  %11 = call i32 @print(i32 118)
  %tmp72 = load i32, i32* %tmp3, align 4
  store i32 %tmp72, i32* %tmp1, align 4
  %tmp73 = load i32, i32* %tmp4, align 4
  store i32 %tmp73, i32* %tmp2, align 4
  %tmp74 = load i8, i8* %tmp6, align 1
  %tmp75 = add i8 %tmp74, 1
  store i8 %tmp75, i8* %tmp6, align 1
  br label %bb23

bb76:                                             ; preds = %bb23
  %12 = call i32 @print(i32 119)
  %tmp77 = load i32, i32* %tmp4, align 4
  %tmp78 = call i32 @mulSE315216_3_2(i32 %tmp77, i32 19898)
  store i32 %tmp78, i32* %tmp7, align 4
  %tmp79 = load i32, i32* %tmp7, align 4
  ret i32 %tmp79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_1_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 120)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_1_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 121)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_1_3(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 122)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_2_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 123)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_2_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 124)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_2_3(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 125)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_3_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 126)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_3_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 127)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_3_3(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 128)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_4_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 129)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_4_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 130)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_4_3(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 131)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_5_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 132)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_5_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 133)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_5_3(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 134)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_6_1(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 135)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_6_2(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 136)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @PATTGAIN_6_3(i32 %arg, i32 %arg1) #0 {
bb:
  %0 = call i32 @print(i32 137)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp2, align 4
  %tmp3 = load i32, i32* %tmp, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = load i32, i32* %tmp2, align 4
  %tmp6 = sext i32 %tmp5 to i64
  %tmp7 = mul nsw i64 %tmp4, %tmp6
  %tmp8 = ashr i64 %tmp7, 12
  %tmp9 = add nsw i64 %tmp8, 1
  %tmp10 = ashr i64 %tmp9, 1
  %tmp11 = trunc i64 %tmp10 to i32
  ret i32 %tmp11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @gain_sat_1(i32 %arg, i32 %arg1, i32 %arg2) #0 {
bb:
  %0 = call i32 @print(i32 138)
  %tmp = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp3, align 4
  store i32 %arg2, i32* %tmp4, align 4
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp3, align 4
  %tmp8 = icmp sgt i32 %tmp6, %tmp7
  br i1 %tmp8, label %bb9, label %bb13

bb9:                                              ; preds = %bb
  %1 = call i32 @print(i32 139)
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = call i32 @PATTGAIN_1_1(i32 %tmp10, i32 %tmp11)
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb28

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 140)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = sub nsw i32 0, %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %bb18, label %bb23

bb18:                                             ; preds = %bb13
  %3 = call i32 @print(i32 141)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp3, align 4
  %tmp21 = sub nsw i32 0, %tmp20
  %tmp22 = call i32 @PATTGAIN_1_2(i32 %tmp19, i32 %tmp21)
  store i32 %tmp22, i32* %tmp5, align 4
  br label %bb27

bb23:                                             ; preds = %bb13
  %4 = call i32 @print(i32 142)
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = load i32, i32* %tmp, align 4
  %tmp26 = call i32 @PATTGAIN_1_3(i32 %tmp24, i32 %tmp25)
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb27

bb27:                                             ; preds = %bb23, %bb18
  %5 = call i32 @print(i32 143)
  br label %bb28

bb28:                                             ; preds = %bb27, %bb9
  %6 = call i32 @print(i32 144)
  %tmp29 = load i32, i32* %tmp5, align 4
  ret i32 %tmp29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @gain_sat_2(i32 %arg, i32 %arg1, i32 %arg2) #0 {
bb:
  %0 = call i32 @print(i32 145)
  %tmp = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp3, align 4
  store i32 %arg2, i32* %tmp4, align 4
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp3, align 4
  %tmp8 = icmp sgt i32 %tmp6, %tmp7
  br i1 %tmp8, label %bb9, label %bb13

bb9:                                              ; preds = %bb
  %1 = call i32 @print(i32 146)
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = call i32 @PATTGAIN_2_1(i32 %tmp10, i32 %tmp11)
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb28

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 147)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = sub nsw i32 0, %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %bb18, label %bb23

bb18:                                             ; preds = %bb13
  %3 = call i32 @print(i32 148)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp3, align 4
  %tmp21 = sub nsw i32 0, %tmp20
  %tmp22 = call i32 @PATTGAIN_2_2(i32 %tmp19, i32 %tmp21)
  store i32 %tmp22, i32* %tmp5, align 4
  br label %bb27

bb23:                                             ; preds = %bb13
  %4 = call i32 @print(i32 149)
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = load i32, i32* %tmp, align 4
  %tmp26 = call i32 @PATTGAIN_2_3(i32 %tmp24, i32 %tmp25)
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb27

bb27:                                             ; preds = %bb23, %bb18
  %5 = call i32 @print(i32 150)
  br label %bb28

bb28:                                             ; preds = %bb27, %bb9
  %6 = call i32 @print(i32 151)
  %tmp29 = load i32, i32* %tmp5, align 4
  ret i32 %tmp29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @gain_sat_3(i32 %arg, i32 %arg1, i32 %arg2) #0 {
bb:
  %0 = call i32 @print(i32 152)
  %tmp = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp3, align 4
  store i32 %arg2, i32* %tmp4, align 4
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp3, align 4
  %tmp8 = icmp sgt i32 %tmp6, %tmp7
  br i1 %tmp8, label %bb9, label %bb13

bb9:                                              ; preds = %bb
  %1 = call i32 @print(i32 153)
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = call i32 @PATTGAIN_3_1(i32 %tmp10, i32 %tmp11)
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb28

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 154)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = sub nsw i32 0, %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %bb18, label %bb23

bb18:                                             ; preds = %bb13
  %3 = call i32 @print(i32 155)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp3, align 4
  %tmp21 = sub nsw i32 0, %tmp20
  %tmp22 = call i32 @PATTGAIN_3_2(i32 %tmp19, i32 %tmp21)
  store i32 %tmp22, i32* %tmp5, align 4
  br label %bb27

bb23:                                             ; preds = %bb13
  %4 = call i32 @print(i32 156)
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = load i32, i32* %tmp, align 4
  %tmp26 = call i32 @PATTGAIN_3_3(i32 %tmp24, i32 %tmp25)
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb27

bb27:                                             ; preds = %bb23, %bb18
  %5 = call i32 @print(i32 157)
  br label %bb28

bb28:                                             ; preds = %bb27, %bb9
  %6 = call i32 @print(i32 158)
  %tmp29 = load i32, i32* %tmp5, align 4
  ret i32 %tmp29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @gain_sat_4(i32 %arg, i32 %arg1, i32 %arg2) #0 {
bb:
  %0 = call i32 @print(i32 159)
  %tmp = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp3, align 4
  store i32 %arg2, i32* %tmp4, align 4
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp3, align 4
  %tmp8 = icmp sgt i32 %tmp6, %tmp7
  br i1 %tmp8, label %bb9, label %bb13

bb9:                                              ; preds = %bb
  %1 = call i32 @print(i32 160)
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = call i32 @PATTGAIN_4_1(i32 %tmp10, i32 %tmp11)
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb28

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 161)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = sub nsw i32 0, %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %bb18, label %bb23

bb18:                                             ; preds = %bb13
  %3 = call i32 @print(i32 162)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp3, align 4
  %tmp21 = sub nsw i32 0, %tmp20
  %tmp22 = call i32 @PATTGAIN_4_2(i32 %tmp19, i32 %tmp21)
  store i32 %tmp22, i32* %tmp5, align 4
  br label %bb27

bb23:                                             ; preds = %bb13
  %4 = call i32 @print(i32 163)
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = load i32, i32* %tmp, align 4
  %tmp26 = call i32 @PATTGAIN_4_3(i32 %tmp24, i32 %tmp25)
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb27

bb27:                                             ; preds = %bb23, %bb18
  %5 = call i32 @print(i32 164)
  br label %bb28

bb28:                                             ; preds = %bb27, %bb9
  %6 = call i32 @print(i32 165)
  %tmp29 = load i32, i32* %tmp5, align 4
  ret i32 %tmp29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @gain_sat_5(i32 %arg, i32 %arg1, i32 %arg2) #0 {
bb:
  %0 = call i32 @print(i32 166)
  %tmp = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp3, align 4
  store i32 %arg2, i32* %tmp4, align 4
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp3, align 4
  %tmp8 = icmp sgt i32 %tmp6, %tmp7
  br i1 %tmp8, label %bb9, label %bb13

bb9:                                              ; preds = %bb
  %1 = call i32 @print(i32 167)
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = call i32 @PATTGAIN_5_1(i32 %tmp10, i32 %tmp11)
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb28

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 168)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = sub nsw i32 0, %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %bb18, label %bb23

bb18:                                             ; preds = %bb13
  %3 = call i32 @print(i32 169)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp3, align 4
  %tmp21 = sub nsw i32 0, %tmp20
  %tmp22 = call i32 @PATTGAIN_5_2(i32 %tmp19, i32 %tmp21)
  store i32 %tmp22, i32* %tmp5, align 4
  br label %bb27

bb23:                                             ; preds = %bb13
  %4 = call i32 @print(i32 170)
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = load i32, i32* %tmp, align 4
  %tmp26 = call i32 @PATTGAIN_5_3(i32 %tmp24, i32 %tmp25)
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb27

bb27:                                             ; preds = %bb23, %bb18
  %5 = call i32 @print(i32 171)
  br label %bb28

bb28:                                             ; preds = %bb27, %bb9
  %6 = call i32 @print(i32 172)
  %tmp29 = load i32, i32* %tmp5, align 4
  ret i32 %tmp29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @gain_sat_6(i32 %arg, i32 %arg1, i32 %arg2) #0 {
bb:
  %0 = call i32 @print(i32 173)
  %tmp = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  store i32 %arg, i32* %tmp, align 4
  store i32 %arg1, i32* %tmp3, align 4
  store i32 %arg2, i32* %tmp4, align 4
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp3, align 4
  %tmp8 = icmp sgt i32 %tmp6, %tmp7
  br i1 %tmp8, label %bb9, label %bb13

bb9:                                              ; preds = %bb
  %1 = call i32 @print(i32 174)
  %tmp10 = load i32, i32* %tmp4, align 4
  %tmp11 = load i32, i32* %tmp3, align 4
  %tmp12 = call i32 @PATTGAIN_6_1(i32 %tmp10, i32 %tmp11)
  store i32 %tmp12, i32* %tmp5, align 4
  br label %bb28

bb13:                                             ; preds = %bb
  %2 = call i32 @print(i32 175)
  %tmp14 = load i32, i32* %tmp, align 4
  %tmp15 = load i32, i32* %tmp3, align 4
  %tmp16 = sub nsw i32 0, %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %bb18, label %bb23

bb18:                                             ; preds = %bb13
  %3 = call i32 @print(i32 176)
  %tmp19 = load i32, i32* %tmp4, align 4
  %tmp20 = load i32, i32* %tmp3, align 4
  %tmp21 = sub nsw i32 0, %tmp20
  %tmp22 = call i32 @PATTGAIN_6_2(i32 %tmp19, i32 %tmp21)
  store i32 %tmp22, i32* %tmp5, align 4
  br label %bb27

bb23:                                             ; preds = %bb13
  %4 = call i32 @print(i32 177)
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = load i32, i32* %tmp, align 4
  %tmp26 = call i32 @PATTGAIN_6_3(i32 %tmp24, i32 %tmp25)
  store i32 %tmp26, i32* %tmp5, align 4
  br label %bb27

bb27:                                             ; preds = %bb23, %bb18
  %5 = call i32 @print(i32 178)
  br label %bb28

bb28:                                             ; preds = %bb27, %bb9
  %6 = call i32 @print(i32 179)
  %tmp29 = load i32, i32* %tmp5, align 4
  ret i32 %tmp29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @read_input() #0 {
bb:
  %0 = call i32 @print(i32 180)
  %tmp = alloca [1024 x i8], align 16
  %tmp1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tmp, i32 0, i32 0
  %tmp2 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %tmp3 = call i8* @fgets(i8* %tmp1, i32 1024, %struct._IO_FILE* %tmp2)
  %tmp4 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tmp, i32 0, i32 0
  %tmp5 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %tmp4, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 1), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 2), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 3), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 4), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 5), i32* getelementptr inbounds ([3 x i32], [3 x i32]* @euler_ref, i64 0, i64 0), i32* getelementptr inbounds ([3 x i32], [3 x i32]* @euler_ref, i64 0, i64 1), i32* getelementptr inbounds ([3 x i32], [3 x i32]* @euler_ref, i64 0, i64 2), i32* @az, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_navsol, i64 0, i64 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_navsol, i64 0, i64 1), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_navsol, i64 0, i64 2), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_navsol, i64 0, i64 3)) #4
  ret void
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @eul_to_quat() #0 {
bb:
  %0 = call i32 @print(i32 181)
  %tmp = alloca [13 x i32], align 16
  %tmp1 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @euler_ref, i64 0, i64 0), align 4
  %tmp2 = ashr i32 %tmp1, 1
  %tmp3 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  store i32 %tmp2, i32* %tmp3, align 16
  %tmp4 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  %tmp5 = load i32, i32* %tmp4, align 16
  %tmp6 = call i32 @fixed_cordCS_cos_1(i32 %tmp5)
  %tmp7 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 1
  store i32 %tmp6, i32* %tmp7, align 4
  %tmp8 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  %tmp9 = load i32, i32* %tmp8, align 16
  %tmp10 = call i32 @fixed_cordCS_sin_1(i32 %tmp9)
  %tmp11 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 2
  store i32 %tmp10, i32* %tmp11, align 8
  %tmp12 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @euler_ref, i64 0, i64 1), align 4
  %tmp13 = ashr i32 %tmp12, 1
  %tmp14 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  store i32 %tmp13, i32* %tmp14, align 16
  %tmp15 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  %tmp16 = load i32, i32* %tmp15, align 16
  %tmp17 = call i32 @fixed_cordCS_cos_2(i32 %tmp16)
  %tmp18 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 3
  store i32 %tmp17, i32* %tmp18, align 4
  %tmp19 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  %tmp20 = load i32, i32* %tmp19, align 16
  %tmp21 = call i32 @fixed_cordCS_sin_2(i32 %tmp20)
  %tmp22 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 4
  store i32 %tmp21, i32* %tmp22, align 16
  %tmp23 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @euler_ref, i64 0, i64 2), align 4
  %tmp24 = ashr i32 %tmp23, 1
  %tmp25 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  store i32 %tmp24, i32* %tmp25, align 16
  %tmp26 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  %tmp27 = load i32, i32* %tmp26, align 16
  %tmp28 = call i32 @fixed_cordCS_cos_3(i32 %tmp27)
  %tmp29 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 5
  store i32 %tmp28, i32* %tmp29, align 4
  %tmp30 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 0
  %tmp31 = load i32, i32* %tmp30, align 16
  %tmp32 = call i32 @fixed_cordCS_sin_3(i32 %tmp31)
  %tmp33 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 6
  store i32 %tmp32, i32* %tmp33, align 8
  %tmp34 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 3
  %tmp35 = load i32, i32* %tmp34, align 4
  %tmp36 = sext i32 %tmp35 to i64
  %tmp37 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 5
  %tmp38 = load i32, i32* %tmp37, align 4
  %tmp39 = sext i32 %tmp38 to i64
  %tmp40 = mul nsw i64 %tmp36, %tmp39
  %tmp41 = ashr i64 %tmp40, 14
  %tmp42 = add nsw i64 %tmp41, 1
  %tmp43 = ashr i64 %tmp42, 1
  %tmp44 = trunc i64 %tmp43 to i32
  %tmp45 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 7
  store i32 %tmp44, i32* %tmp45, align 4
  %tmp46 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 4
  %tmp47 = load i32, i32* %tmp46, align 16
  %tmp48 = sext i32 %tmp47 to i64
  %tmp49 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 6
  %tmp50 = load i32, i32* %tmp49, align 8
  %tmp51 = sext i32 %tmp50 to i64
  %tmp52 = mul nsw i64 %tmp48, %tmp51
  %tmp53 = ashr i64 %tmp52, 14
  %tmp54 = add nsw i64 %tmp53, 1
  %tmp55 = ashr i64 %tmp54, 1
  %tmp56 = trunc i64 %tmp55 to i32
  %tmp57 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 8
  store i32 %tmp56, i32* %tmp57, align 16
  %tmp58 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 4
  %tmp59 = load i32, i32* %tmp58, align 16
  %tmp60 = sext i32 %tmp59 to i64
  %tmp61 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 5
  %tmp62 = load i32, i32* %tmp61, align 4
  %tmp63 = sext i32 %tmp62 to i64
  %tmp64 = mul nsw i64 %tmp60, %tmp63
  %tmp65 = ashr i64 %tmp64, 14
  %tmp66 = add nsw i64 %tmp65, 1
  %tmp67 = ashr i64 %tmp66, 1
  %tmp68 = trunc i64 %tmp67 to i32
  %tmp69 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 9
  store i32 %tmp68, i32* %tmp69, align 4
  %tmp70 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 3
  %tmp71 = load i32, i32* %tmp70, align 4
  %tmp72 = sext i32 %tmp71 to i64
  %tmp73 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 6
  %tmp74 = load i32, i32* %tmp73, align 8
  %tmp75 = sext i32 %tmp74 to i64
  %tmp76 = mul nsw i64 %tmp72, %tmp75
  %tmp77 = ashr i64 %tmp76, 14
  %tmp78 = add nsw i64 %tmp77, 1
  %tmp79 = ashr i64 %tmp78, 1
  %tmp80 = trunc i64 %tmp79 to i32
  %tmp81 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 10
  store i32 %tmp80, i32* %tmp81, align 8
  %tmp82 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 1
  %tmp83 = load i32, i32* %tmp82, align 4
  %tmp84 = sext i32 %tmp83 to i64
  %tmp85 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 7
  %tmp86 = load i32, i32* %tmp85, align 4
  %tmp87 = sext i32 %tmp86 to i64
  %tmp88 = mul nsw i64 %tmp84, %tmp87
  %tmp89 = ashr i64 %tmp88, 14
  %tmp90 = add nsw i64 %tmp89, 1
  %tmp91 = ashr i64 %tmp90, 1
  %tmp92 = trunc i64 %tmp91 to i32
  %tmp93 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  store i32 %tmp92, i32* %tmp93, align 4
  %tmp94 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 2
  %tmp95 = load i32, i32* %tmp94, align 8
  %tmp96 = sext i32 %tmp95 to i64
  %tmp97 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 8
  %tmp98 = load i32, i32* %tmp97, align 16
  %tmp99 = sext i32 %tmp98 to i64
  %tmp100 = mul nsw i64 %tmp96, %tmp99
  %tmp101 = ashr i64 %tmp100, 14
  %tmp102 = add nsw i64 %tmp101, 1
  %tmp103 = ashr i64 %tmp102, 1
  %tmp104 = trunc i64 %tmp103 to i32
  %tmp105 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  store i32 %tmp104, i32* %tmp105, align 16
  %tmp106 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  %tmp107 = load i32, i32* %tmp106, align 4
  %tmp108 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  %tmp109 = load i32, i32* %tmp108, align 16
  %tmp110 = add nsw i32 %tmp107, %tmp109
  store i32 %tmp110, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_ref, i64 0, i64 0), align 16
  %tmp111 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 2
  %tmp112 = load i32, i32* %tmp111, align 8
  %tmp113 = sext i32 %tmp112 to i64
  %tmp114 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 7
  %tmp115 = load i32, i32* %tmp114, align 4
  %tmp116 = sext i32 %tmp115 to i64
  %tmp117 = mul nsw i64 %tmp113, %tmp116
  %tmp118 = ashr i64 %tmp117, 14
  %tmp119 = add nsw i64 %tmp118, 1
  %tmp120 = ashr i64 %tmp119, 1
  %tmp121 = trunc i64 %tmp120 to i32
  %tmp122 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  store i32 %tmp121, i32* %tmp122, align 4
  %tmp123 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 1
  %tmp124 = load i32, i32* %tmp123, align 4
  %tmp125 = sext i32 %tmp124 to i64
  %tmp126 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 8
  %tmp127 = load i32, i32* %tmp126, align 16
  %tmp128 = sext i32 %tmp127 to i64
  %tmp129 = mul nsw i64 %tmp125, %tmp128
  %tmp130 = ashr i64 %tmp129, 14
  %tmp131 = add nsw i64 %tmp130, 1
  %tmp132 = ashr i64 %tmp131, 1
  %tmp133 = trunc i64 %tmp132 to i32
  %tmp134 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  store i32 %tmp133, i32* %tmp134, align 16
  %tmp135 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  %tmp136 = load i32, i32* %tmp135, align 4
  %tmp137 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  %tmp138 = load i32, i32* %tmp137, align 16
  %tmp139 = sub nsw i32 %tmp136, %tmp138
  store i32 %tmp139, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_ref, i64 0, i64 1), align 4
  %tmp140 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 1
  %tmp141 = load i32, i32* %tmp140, align 4
  %tmp142 = sext i32 %tmp141 to i64
  %tmp143 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 9
  %tmp144 = load i32, i32* %tmp143, align 4
  %tmp145 = sext i32 %tmp144 to i64
  %tmp146 = mul nsw i64 %tmp142, %tmp145
  %tmp147 = ashr i64 %tmp146, 14
  %tmp148 = add nsw i64 %tmp147, 1
  %tmp149 = ashr i64 %tmp148, 1
  %tmp150 = trunc i64 %tmp149 to i32
  %tmp151 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  store i32 %tmp150, i32* %tmp151, align 4
  %tmp152 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 2
  %tmp153 = load i32, i32* %tmp152, align 8
  %tmp154 = sext i32 %tmp153 to i64
  %tmp155 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 10
  %tmp156 = load i32, i32* %tmp155, align 8
  %tmp157 = sext i32 %tmp156 to i64
  %tmp158 = mul nsw i64 %tmp154, %tmp157
  %tmp159 = ashr i64 %tmp158, 14
  %tmp160 = add nsw i64 %tmp159, 1
  %tmp161 = ashr i64 %tmp160, 1
  %tmp162 = trunc i64 %tmp161 to i32
  %tmp163 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  store i32 %tmp162, i32* %tmp163, align 16
  %tmp164 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  %tmp165 = load i32, i32* %tmp164, align 4
  %tmp166 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  %tmp167 = load i32, i32* %tmp166, align 16
  %tmp168 = add nsw i32 %tmp165, %tmp167
  store i32 %tmp168, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_ref, i64 0, i64 2), align 8
  %tmp169 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 1
  %tmp170 = load i32, i32* %tmp169, align 4
  %tmp171 = sext i32 %tmp170 to i64
  %tmp172 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 10
  %tmp173 = load i32, i32* %tmp172, align 8
  %tmp174 = sext i32 %tmp173 to i64
  %tmp175 = mul nsw i64 %tmp171, %tmp174
  %tmp176 = ashr i64 %tmp175, 14
  %tmp177 = add nsw i64 %tmp176, 1
  %tmp178 = ashr i64 %tmp177, 1
  %tmp179 = trunc i64 %tmp178 to i32
  %tmp180 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  store i32 %tmp179, i32* %tmp180, align 4
  %tmp181 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 2
  %tmp182 = load i32, i32* %tmp181, align 8
  %tmp183 = sext i32 %tmp182 to i64
  %tmp184 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 9
  %tmp185 = load i32, i32* %tmp184, align 4
  %tmp186 = sext i32 %tmp185 to i64
  %tmp187 = mul nsw i64 %tmp183, %tmp186
  %tmp188 = ashr i64 %tmp187, 14
  %tmp189 = add nsw i64 %tmp188, 1
  %tmp190 = ashr i64 %tmp189, 1
  %tmp191 = trunc i64 %tmp190 to i32
  %tmp192 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  store i32 %tmp191, i32* %tmp192, align 16
  %tmp193 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 11
  %tmp194 = load i32, i32* %tmp193, align 4
  %tmp195 = getelementptr inbounds [13 x i32], [13 x i32]* %tmp, i64 0, i64 12
  %tmp196 = load i32, i32* %tmp195, align 16
  %tmp197 = sub nsw i32 %tmp194, %tmp196
  store i32 %tmp197, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @quat_ref, i64 0, i64 3), align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @err_quat() #0 {
bb:
  %0 = call i32 @print(i32 182)
  %tmp = alloca [4 x [4 x i8]], align 16
  %tmp1 = alloca [4 x [4 x i8]], align 16
  %tmp2 = alloca i8, align 1
  %tmp3 = alloca i8, align 1
  %tmp4 = alloca i8, align 1
  %tmp5 = alloca i8, align 1
  %tmp6 = alloca [4 x i32], align 16
  %tmp7 = bitcast [4 x [4 x i8]]* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp7, i8* align 16 getelementptr inbounds ([4 x [4 x i8]], [4 x [4 x i8]]* @err_quat.Qsign, i32 0, i32 0, i32 0), i64 16, i1 false)
  %tmp8 = bitcast [4 x [4 x i8]]* %tmp1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp8, i8* align 16 getelementptr inbounds ([4 x [4 x i8]], [4 x [4 x i8]]* @err_quat.Qindex, i32 0, i32 0, i32 0), i64 16, i1 false)
  store i8 15, i8* %tmp2, align 1
  store i8 0, i8* %tmp4, align 1
  br label %bb9

bb9:                                              ; preds = %bb98, %bb
  %1 = call i32 @print(i32 183)
  %tmp10 = load i8, i8* %tmp4, align 1
  %tmp11 = sext i8 %tmp10 to i32
  %tmp12 = icmp slt i32 %tmp11, 4
  br i1 %tmp12, label %bb13, label %bb101

bb13:                                             ; preds = %bb9
  %2 = call i32 @print(i32 184)
  store i8 0, i8* %tmp5, align 1
  br label %bb14

bb14:                                             ; preds = %bb80, %bb13
  %3 = call i32 @print(i32 185)
  %tmp15 = load i8, i8* %tmp5, align 1
  %tmp16 = sext i8 %tmp15 to i32
  %tmp17 = icmp slt i32 %tmp16, 4
  br i1 %tmp17, label %bb18, label %bb83

bb18:                                             ; preds = %bb14
  %4 = call i32 @print(i32 186)
  %tmp19 = load i8, i8* %tmp4, align 1
  %tmp20 = sext i8 %tmp19 to i64
  %tmp21 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %tmp, i64 0, i64 %tmp20
  %tmp22 = load i8, i8* %tmp5, align 1
  %tmp23 = sext i8 %tmp22 to i64
  %tmp24 = getelementptr inbounds [4 x i8], [4 x i8]* %tmp21, i64 0, i64 %tmp23
  %tmp25 = load i8, i8* %tmp24, align 1
  %tmp26 = zext i8 %tmp25 to i32
  %tmp27 = icmp eq i32 %tmp26, 0
  br i1 %tmp27, label %bb28, label %bb53

bb28:                                             ; preds = %bb18
  %5 = call i32 @print(i32 187)
  %tmp29 = load i8, i8* %tmp4, align 1
  %tmp30 = sext i8 %tmp29 to i64
  %tmp31 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %tmp1, i64 0, i64 %tmp30
  %tmp32 = load i8, i8* %tmp5, align 1
  %tmp33 = sext i8 %tmp32 to i64
  %tmp34 = getelementptr inbounds [4 x i8], [4 x i8]* %tmp31, i64 0, i64 %tmp33
  %tmp35 = load i8, i8* %tmp34, align 1
  %tmp36 = zext i8 %tmp35 to i64
  %tmp37 = getelementptr inbounds [4 x i32], [4 x i32]* @quat_ref, i64 0, i64 %tmp36
  %tmp38 = load i32, i32* %tmp37, align 4
  %tmp39 = sext i32 %tmp38 to i64
  %tmp40 = load i8, i8* %tmp5, align 1
  %tmp41 = sext i8 %tmp40 to i64
  %tmp42 = getelementptr inbounds [4 x i32], [4 x i32]* @quat_navsol, i64 0, i64 %tmp41
  %tmp43 = load i32, i32* %tmp42, align 4
  %tmp44 = sext i32 %tmp43 to i64
  %tmp45 = mul nsw i64 %tmp39, %tmp44
  %tmp46 = ashr i64 %tmp45, 14
  %tmp47 = add nsw i64 %tmp46, 1
  %tmp48 = ashr i64 %tmp47, 1
  %tmp49 = trunc i64 %tmp48 to i32
  %tmp50 = load i8, i8* %tmp5, align 1
  %tmp51 = sext i8 %tmp50 to i64
  %tmp52 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp6, i64 0, i64 %tmp51
  store i32 %tmp49, i32* %tmp52, align 4
  br label %bb79

bb53:                                             ; preds = %bb18
  %6 = call i32 @print(i32 188)
  %tmp54 = load i8, i8* %tmp4, align 1
  %tmp55 = sext i8 %tmp54 to i64
  %tmp56 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %tmp1, i64 0, i64 %tmp55
  %tmp57 = load i8, i8* %tmp5, align 1
  %tmp58 = sext i8 %tmp57 to i64
  %tmp59 = getelementptr inbounds [4 x i8], [4 x i8]* %tmp56, i64 0, i64 %tmp58
  %tmp60 = load i8, i8* %tmp59, align 1
  %tmp61 = zext i8 %tmp60 to i64
  %tmp62 = getelementptr inbounds [4 x i32], [4 x i32]* @quat_ref, i64 0, i64 %tmp61
  %tmp63 = load i32, i32* %tmp62, align 4
  %tmp64 = sext i32 %tmp63 to i64
  %tmp65 = load i8, i8* %tmp5, align 1
  %tmp66 = sext i8 %tmp65 to i64
  %tmp67 = getelementptr inbounds [4 x i32], [4 x i32]* @quat_navsol, i64 0, i64 %tmp66
  %tmp68 = load i32, i32* %tmp67, align 4
  %tmp69 = sext i32 %tmp68 to i64
  %tmp70 = mul nsw i64 %tmp64, %tmp69
  %tmp71 = ashr i64 %tmp70, 14
  %tmp72 = add nsw i64 %tmp71, 1
  %tmp73 = ashr i64 %tmp72, 1
  %tmp74 = sub nsw i64 0, %tmp73
  %tmp75 = trunc i64 %tmp74 to i32
  %tmp76 = load i8, i8* %tmp5, align 1
  %tmp77 = sext i8 %tmp76 to i64
  %tmp78 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp6, i64 0, i64 %tmp77
  store i32 %tmp75, i32* %tmp78, align 4
  br label %bb79

bb79:                                             ; preds = %bb53, %bb28
  %7 = call i32 @print(i32 189)
  br label %bb80

bb80:                                             ; preds = %bb79
  %8 = call i32 @print(i32 190)
  %tmp81 = load i8, i8* %tmp5, align 1
  %tmp82 = add i8 %tmp81, 1
  store i8 %tmp82, i8* %tmp5, align 1
  br label %bb14

bb83:                                             ; preds = %bb14
  %9 = call i32 @print(i32 191)
  %tmp84 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp6, i64 0, i64 3
  %tmp85 = load i32, i32* %tmp84, align 4
  %tmp86 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp6, i64 0, i64 2
  %tmp87 = load i32, i32* %tmp86, align 8
  %tmp88 = add nsw i32 %tmp85, %tmp87
  %tmp89 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp6, i64 0, i64 1
  %tmp90 = load i32, i32* %tmp89, align 4
  %tmp91 = add nsw i32 %tmp88, %tmp90
  %tmp92 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp6, i64 0, i64 0
  %tmp93 = load i32, i32* %tmp92, align 16
  %tmp94 = add nsw i32 %tmp91, %tmp93
  %tmp95 = load i8, i8* %tmp4, align 1
  %tmp96 = sext i8 %tmp95 to i64
  %tmp97 = getelementptr inbounds [4 x i32], [4 x i32]* @error_quat, i64 0, i64 %tmp96
  store i32 %tmp94, i32* %tmp97, align 4
  br label %bb98

bb98:                                             ; preds = %bb83
  %10 = call i32 @print(i32 192)
  %tmp99 = load i8, i8* %tmp4, align 1
  %tmp100 = add i8 %tmp99, 1
  store i8 %tmp100, i8* %tmp4, align 1
  br label %bb9

bb101:                                            ; preds = %bb9
  %11 = call i32 @print(i32 193)
  %tmp102 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @error_quat, i64 0, i64 0), align 16
  %tmp103 = and i32 %tmp102, -2147483648
  %tmp104 = icmp ne i32 %tmp103, 0
  br i1 %tmp104, label %bb105, label %bb123

bb105:                                            ; preds = %bb101
  %12 = call i32 @print(i32 194)
  store i8 0, i8* %tmp3, align 1
  br label %bb106

bb106:                                            ; preds = %bb119, %bb105
  %13 = call i32 @print(i32 195)
  %tmp107 = load i8, i8* %tmp3, align 1
  %tmp108 = sext i8 %tmp107 to i32
  %tmp109 = icmp slt i32 %tmp108, 4
  br i1 %tmp109, label %bb110, label %bb122

bb110:                                            ; preds = %bb106
  %14 = call i32 @print(i32 196)
  %tmp111 = load i8, i8* %tmp3, align 1
  %tmp112 = sext i8 %tmp111 to i64
  %tmp113 = getelementptr inbounds [4 x i32], [4 x i32]* @error_quat, i64 0, i64 %tmp112
  %tmp114 = load i32, i32* %tmp113, align 4
  %tmp115 = sub nsw i32 0, %tmp114
  %tmp116 = load i8, i8* %tmp3, align 1
  %tmp117 = sext i8 %tmp116 to i64
  %tmp118 = getelementptr inbounds [4 x i32], [4 x i32]* @error_quat, i64 0, i64 %tmp117
  store i32 %tmp115, i32* %tmp118, align 4
  br label %bb119

bb119:                                            ; preds = %bb110
  %15 = call i32 @print(i32 197)
  %tmp120 = load i8, i8* %tmp3, align 1
  %tmp121 = add i8 %tmp120, 1
  store i8 %tmp121, i8* %tmp3, align 1
  br label %bb106

bb122:                                            ; preds = %bb106
  %16 = call i32 @print(i32 198)
  br label %bb123

bb123:                                            ; preds = %bb122, %bb101
  %17 = call i32 @print(i32 199)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @attd_ctrl() #0 {
bb:
  %0 = call i32 @print(i32 200)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 17203, i32* %tmp, align 4
  store i32 17213, i32* %tmp1, align 4
  store i32 27307, i32* %tmp2, align 4
  %tmp3 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @error_quat, i64 0, i64 1), align 4
  %tmp4 = call i32 @power_1(double 2.000000e+00, i32 27)
  %tmp5 = sdiv i32 %tmp4, 17203
  %tmp6 = call i32 @gain_sat_1(i32 %tmp3, i32 %tmp5, i32 17203)
  store i32 %tmp6, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_omegaref, i64 0, i64 0), align 4
  %tmp7 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @error_quat, i64 0, i64 2), align 8
  %tmp8 = call i32 @power_2(double 2.000000e+00, i32 27)
  %tmp9 = sdiv i32 %tmp8, 17213
  %tmp10 = call i32 @gain_sat_2(i32 %tmp7, i32 %tmp9, i32 17213)
  store i32 %tmp10, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_omegaref, i64 0, i64 1), align 4
  %tmp11 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @error_quat, i64 0, i64 3), align 4
  %tmp12 = call i32 @power_3(double 2.000000e+00, i32 27)
  %tmp13 = sdiv i32 %tmp12, 27307
  %tmp14 = call i32 @gain_sat_3(i32 %tmp11, i32 %tmp13, i32 27307)
  store i32 %tmp14, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_omegaref, i64 0, i64 2), align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rate_ctrl() #0 {
bb:
  %0 = call i32 @print(i32 201)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i32, align 4
  %tmp7 = alloca i32, align 4
  %tmp8 = alloca [3 x i32], align 4
  store i32 40960, i32* %tmp, align 4
  store i32 40960, i32* %tmp1, align 4
  store i32 4096, i32* %tmp2, align 4
  store i32 11470, i32* %tmp3, align 4
  store i32 11470, i32* %tmp4, align 4
  store i32 2090, i32* %tmp5, align 4
  store i32 956, i32* %tmp6, align 4
  store i32 48419, i32* %tmp7, align 4
  %tmp9 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_omegaref, i64 0, i64 0), align 4
  %tmp10 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 0), align 16
  %tmp11 = sub nsw i32 %tmp9, %tmp10
  %tmp12 = getelementptr inbounds [3 x i32], [3 x i32]* %tmp8, i64 0, i64 0
  store i32 %tmp11, i32* %tmp12, align 4
  %tmp13 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_omegaref, i64 0, i64 1), align 4
  %tmp14 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 1), align 4
  %tmp15 = sub nsw i32 %tmp13, %tmp14
  %tmp16 = getelementptr inbounds [3 x i32], [3 x i32]* %tmp8, i64 0, i64 1
  store i32 %tmp15, i32* %tmp16, align 4
  %tmp17 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_omegaref, i64 0, i64 2), align 4
  %tmp18 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @imu_data, i64 0, i64 2), align 8
  %tmp19 = sub nsw i32 %tmp17, %tmp18
  %tmp20 = getelementptr inbounds [3 x i32], [3 x i32]* %tmp8, i64 0, i64 2
  store i32 %tmp19, i32* %tmp20, align 4
  %tmp21 = getelementptr inbounds [3 x i32], [3 x i32]* %tmp8, i64 0, i64 0
  %tmp22 = load i32, i32* %tmp21, align 4
  %tmp23 = call i32 @power_4(double 2.000000e+00, i32 26)
  %tmp24 = mul nsw i32 12, %tmp23
  %tmp25 = sdiv i32 %tmp24, 40960
  %tmp26 = call i32 @gain_sat_4(i32 %tmp22, i32 %tmp25, i32 11470)
  store i32 %tmp26, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 0), align 4
  %tmp27 = getelementptr inbounds [3 x i32], [3 x i32]* %tmp8, i64 0, i64 1
  %tmp28 = load i32, i32* %tmp27, align 4
  %tmp29 = call i32 @power_5(double 2.000000e+00, i32 26)
  %tmp30 = mul nsw i32 12, %tmp29
  %tmp31 = sdiv i32 %tmp30, 40960
  %tmp32 = call i32 @gain_sat_5(i32 %tmp28, i32 %tmp31, i32 11470)
  store i32 %tmp32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 1), align 4
  %tmp33 = getelementptr inbounds [3 x i32], [3 x i32]* %tmp8, i64 0, i64 2
  %tmp34 = load i32, i32* %tmp33, align 4
  %tmp35 = call i32 @power_6(double 2.000000e+00, i32 26)
  %tmp36 = mul nsw i32 6, %tmp35
  %tmp37 = sdiv i32 %tmp36, 4096
  %tmp38 = call i32 @gain_sat_6(i32 %tmp34, i32 %tmp37, i32 2090)
  store i32 %tmp38, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 2), align 4
  %tmp39 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 0), align 4
  %tmp40 = sext i32 %tmp39 to i64
  %tmp41 = mul nsw i64 956, %tmp40
  %tmp42 = ashr i64 %tmp41, 10
  %tmp43 = add nsw i64 %tmp42, 1
  %tmp44 = ashr i64 %tmp43, 1
  %tmp45 = trunc i64 %tmp44 to i32
  store i32 %tmp45, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 0), align 4
  %tmp46 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 1), align 4
  %tmp47 = sext i32 %tmp46 to i64
  %tmp48 = mul nsw i64 956, %tmp47
  %tmp49 = ashr i64 %tmp48, 10
  %tmp50 = add nsw i64 %tmp49, 1
  %tmp51 = ashr i64 %tmp50, 1
  %tmp52 = trunc i64 %tmp51 to i32
  store i32 %tmp52, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 1), align 4
  %tmp53 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 2), align 4
  %tmp54 = sext i32 %tmp53 to i64
  %tmp55 = mul nsw i64 956, %tmp54
  %tmp56 = ashr i64 %tmp55, 10
  %tmp57 = add nsw i64 %tmp56, 1
  %tmp58 = ashr i64 %tmp57, 1
  %tmp59 = trunc i64 %tmp58 to i32
  store i32 %tmp59, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 2), align 4
  %tmp60 = load i32, i32* @az, align 4
  %tmp61 = sext i32 %tmp60 to i64
  %tmp62 = mul nsw i64 48419, %tmp61
  %tmp63 = ashr i64 %tmp62, 13
  %tmp64 = add nsw i64 %tmp63, 1
  %tmp65 = trunc i64 %tmp64 to i32
  store i32 %tmp65, i32* @s_zref, align 4
  %tmp66 = load i32, i32* @s_zref, align 4
  %tmp67 = sext i32 %tmp66 to i64
  %tmp68 = mul nsw i64 956, %tmp67
  %tmp69 = ashr i64 %tmp68, 9
  %tmp70 = add nsw i64 %tmp69, 1
  %tmp71 = ashr i64 %tmp70, 1
  %tmp72 = trunc i64 %tmp71 to i32
  store i32 %tmp72, i32* @s_zref, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ecg() #0 {
bb:
  %0 = call i32 @print(i32 202)
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca [8 x i32], align 16
  %tmp7 = alloca [8 x i32], align 16
  %tmp8 = alloca [8 x i32], align 16
  %tmp9 = alloca [8 x i32], align 16
  %tmp10 = alloca i32, align 4
  %tmp11 = alloca i32, align 4
  %tmp12 = alloca [8 x i64], align 16
  %tmp13 = alloca [8 x i32], align 16
  %tmp14 = alloca i8, align 1
  %tmp15 = alloca i8, align 1
  %tmp16 = alloca i8, align 1
  %tmp17 = alloca i8, align 1
  %tmp18 = alloca [4 x i64], align 16
  %tmp19 = alloca i8, align 1
  store i32 10884, i32* %tmp, align 4
  store i32 10884, i32* %tmp1, align 4
  store i32 11853, i32* %tmp2, align 4
  store i32 11853, i32* %tmp3, align 4
  store i32 9218, i32* %tmp4, align 4
  store i32 -8192, i32* %tmp5, align 4
  %tmp20 = bitcast [8 x i32]* %tmp6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp20, i8* align 16 bitcast ([8 x i32]* @ecg.ctrl_mtrx_L_ to i8*), i64 32, i1 false)
  %tmp21 = bitcast [8 x i32]* %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp21, i8* align 16 bitcast ([8 x i32]* @ecg.ctrl_mtrx_M_ to i8*), i64 32, i1 false)
  %tmp22 = bitcast [8 x i32]* %tmp8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp22, i8* align 16 bitcast ([8 x i32]* @ecg.ctrl_mtrx_N_ to i8*), i64 32, i1 false)
  %tmp23 = bitcast [8 x i32]* %tmp9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %tmp23, i8* align 16 bitcast ([8 x i32]* @ecg.ctrl_mtrx_Z_ to i8*), i64 32, i1 false)
  store i32 14405, i32* %tmp10, align 4
  store i32 10284, i32* %tmp11, align 4
  store i8 0, i8* %tmp19, align 1
  br label %bb24

bb24:                                             ; preds = %bb144, %bb
  %1 = call i32 @print(i32 203)
  %tmp25 = load i8, i8* %tmp19, align 1
  %tmp26 = zext i8 %tmp25 to i32
  %tmp27 = icmp slt i32 %tmp26, 8
  br i1 %tmp27, label %bb28, label %bb147

bb28:                                             ; preds = %bb24
  %2 = call i32 @print(i32 204)
  %tmp29 = load i8, i8* %tmp19, align 1
  %tmp30 = zext i8 %tmp29 to i64
  %tmp31 = getelementptr inbounds [8 x i32], [8 x i32]* %tmp6, i64 0, i64 %tmp30
  %tmp32 = load i32, i32* %tmp31, align 4
  %tmp33 = sext i32 %tmp32 to i64
  %tmp34 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 0), align 4
  %tmp35 = sext i32 %tmp34 to i64
  %tmp36 = mul nsw i64 %tmp33, %tmp35
  %tmp37 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 0
  store i64 %tmp36, i64* %tmp37, align 16
  %tmp38 = load i8, i8* %tmp19, align 1
  %tmp39 = zext i8 %tmp38 to i64
  %tmp40 = getelementptr inbounds [8 x i32], [8 x i32]* %tmp7, i64 0, i64 %tmp39
  %tmp41 = load i32, i32* %tmp40, align 4
  %tmp42 = sext i32 %tmp41 to i64
  %tmp43 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 1), align 4
  %tmp44 = sext i32 %tmp43 to i64
  %tmp45 = mul nsw i64 %tmp42, %tmp44
  %tmp46 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 1
  store i64 %tmp45, i64* %tmp46, align 8
  %tmp47 = load i8, i8* %tmp19, align 1
  %tmp48 = zext i8 %tmp47 to i64
  %tmp49 = getelementptr inbounds [8 x i32], [8 x i32]* %tmp8, i64 0, i64 %tmp48
  %tmp50 = load i32, i32* %tmp49, align 4
  %tmp51 = sext i32 %tmp50 to i64
  %tmp52 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @s_qref, i64 0, i64 2), align 4
  %tmp53 = sext i32 %tmp52 to i64
  %tmp54 = mul nsw i64 %tmp51, %tmp53
  %tmp55 = shl i64 %tmp54, 5
  %tmp56 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 2
  store i64 %tmp55, i64* %tmp56, align 16
  %tmp57 = load i8, i8* %tmp19, align 1
  %tmp58 = zext i8 %tmp57 to i64
  %tmp59 = getelementptr inbounds [8 x i32], [8 x i32]* %tmp9, i64 0, i64 %tmp58
  %tmp60 = load i32, i32* %tmp59, align 4
  %tmp61 = sext i32 %tmp60 to i64
  %tmp62 = load i32, i32* @s_zref, align 4
  %tmp63 = sext i32 %tmp62 to i64
  %tmp64 = mul nsw i64 %tmp61, %tmp63
  %tmp65 = shl i64 %tmp64, 1
  %tmp66 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 3
  store i64 %tmp65, i64* %tmp66, align 8
  %tmp67 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 1
  %tmp68 = load i64, i64* %tmp67, align 8
  %tmp69 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 0
  %tmp70 = load i64, i64* %tmp69, align 16
  %tmp71 = add nsw i64 %tmp70, %tmp68
  store i64 %tmp71, i64* %tmp69, align 16
  %tmp72 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 3
  %tmp73 = load i64, i64* %tmp72, align 8
  %tmp74 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 2
  %tmp75 = load i64, i64* %tmp74, align 16
  %tmp76 = add nsw i64 %tmp75, %tmp73
  store i64 %tmp76, i64* %tmp74, align 16
  %tmp77 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 0
  %tmp78 = load i64, i64* %tmp77, align 16
  %tmp79 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 2
  %tmp80 = load i64, i64* %tmp79, align 16
  %tmp81 = add nsw i64 %tmp78, %tmp80
  %tmp82 = load i8, i8* %tmp19, align 1
  %tmp83 = zext i8 %tmp82 to i64
  %tmp84 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp83
  store i64 %tmp81, i64* %tmp84, align 8
  %tmp85 = load i8, i8* %tmp19, align 1
  %tmp86 = zext i8 %tmp85 to i64
  %tmp87 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp86
  %tmp88 = load i64, i64* %tmp87, align 8
  %tmp89 = icmp sgt i64 %tmp88, 1073741824
  br i1 %tmp89, label %bb90, label %bb94

bb90:                                             ; preds = %bb28
  %3 = call i32 @print(i32 205)
  %tmp91 = load i8, i8* %tmp19, align 1
  %tmp92 = zext i8 %tmp91 to i64
  %tmp93 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp92
  store i64 1073741824, i64* %tmp93, align 8
  br label %bb94

bb94:                                             ; preds = %bb90, %bb28
  %4 = call i32 @print(i32 206)
  %tmp95 = load i8, i8* %tmp19, align 1
  %tmp96 = zext i8 %tmp95 to i64
  %tmp97 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp96
  %tmp98 = load i64, i64* %tmp97, align 8
  %tmp99 = icmp slt i64 %tmp98, 0
  br i1 %tmp99, label %bb100, label %bb104

bb100:                                            ; preds = %bb94
  %5 = call i32 @print(i32 207)
  %tmp101 = load i8, i8* %tmp19, align 1
  %tmp102 = zext i8 %tmp101 to i64
  %tmp103 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp102
  store i64 0, i64* %tmp103, align 8
  br label %bb104

bb104:                                            ; preds = %bb100, %bb94
  %6 = call i32 @print(i32 208)
  %tmp105 = load i8, i8* %tmp19, align 1
  %tmp106 = zext i8 %tmp105 to i64
  %tmp107 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp106
  %tmp108 = load i64, i64* %tmp107, align 8
  %tmp109 = sitofp i64 %tmp108 to double
  %tmp110 = call double @sqrt(double %tmp109) #4
  %tmp111 = fptosi double %tmp110 to i32
  %tmp112 = load i8, i8* %tmp19, align 1
  %tmp113 = zext i8 %tmp112 to i64
  %tmp114 = getelementptr inbounds [8 x i32], [8 x i32]* %tmp13, i64 0, i64 %tmp113
  store i32 %tmp111, i32* %tmp114, align 4
  %tmp115 = load i8, i8* %tmp19, align 1
  %tmp116 = zext i8 %tmp115 to i64
  %tmp117 = getelementptr inbounds [8 x i32], [8 x i32]* %tmp13, i64 0, i64 %tmp116
  %tmp118 = load i32, i32* %tmp117, align 4
  %tmp119 = sext i32 %tmp118 to i64
  %tmp120 = mul nsw i64 14405, %tmp119
  %tmp121 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 0
  store i64 %tmp120, i64* %tmp121, align 16
  %tmp122 = load i8, i8* %tmp19, align 1
  %tmp123 = zext i8 %tmp122 to i64
  %tmp124 = getelementptr inbounds [8 x i64], [8 x i64]* %tmp12, i64 0, i64 %tmp123
  %tmp125 = load i64, i64* %tmp124, align 8
  %tmp126 = ashr i64 %tmp125, 14
  %tmp127 = add nsw i64 %tmp126, 1
  %tmp128 = ashr i64 %tmp127, 1
  %tmp129 = mul nsw i64 10284, %tmp128
  %tmp130 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 1
  store i64 %tmp129, i64* %tmp130, align 8
  %tmp131 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 0
  %tmp132 = load i64, i64* %tmp131, align 16
  %tmp133 = getelementptr inbounds [4 x i64], [4 x i64]* %tmp18, i64 0, i64 1
  %tmp134 = load i64, i64* %tmp133, align 8
  %tmp135 = add nsw i64 %tmp132, %tmp134
  %tmp136 = ashr i64 %tmp135, 13
  %tmp137 = add nsw i64 %tmp136, 1
  %tmp138 = ashr i64 %tmp137, 1
  %tmp139 = trunc i64 %tmp138 to i32
  %tmp140 = trunc i32 %tmp139 to i16
  %tmp141 = load i8, i8* %tmp19, align 1
  %tmp142 = zext i8 %tmp141 to i64
  %tmp143 = getelementptr inbounds [8 x i16], [8 x i16]* @mtr_cmd, i64 0, i64 %tmp142
  store i16 %tmp140, i16* %tmp143, align 2
  br label %bb144

bb144:                                            ; preds = %bb104
  %7 = call i32 @print(i32 209)
  %tmp145 = load i8, i8* %tmp19, align 1
  %tmp146 = add i8 %tmp145, 1
  store i8 %tmp146, i8* %tmp19, align 1
  br label %bb24

bb147:                                            ; preds = %bb24
  %8 = call i32 @print(i32 210)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %arg, i8** %arg1) #0 {
bb:
  %0 = call i32 @print(i32 211)
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i8**, align 8
  %tmp4 = alloca i8, align 1
  store i32 0, i32* %tmp, align 4
  store i32 %arg, i32* %tmp2, align 4
  store i8** %arg1, i8*** %tmp3, align 8
  %tmp5 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %tmp5, %struct._IO_FILE** @input_file, align 8
  %tmp6 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %tmp6, %struct._IO_FILE** @output_file, align 8
  br label %bb7

bb7:                                              ; preds = %bb38, %bb
  %1 = call i32 @print(i32 212)
  %tmp8 = load i32, i32* @main.step, align 4
  %tmp9 = icmp ult i32 %tmp8, 1
  br i1 %tmp9, label %bb10, label %bb41

bb10:                                             ; preds = %bb7
  %2 = call i32 @print(i32 213)
  call void @read_input()
  %tmp11 = load i32, i32* @main.step, align 4
  %tmp12 = urem i32 %tmp11, 2
  %tmp13 = icmp eq i32 %tmp12, 0
  br i1 %tmp13, label %bb14, label %bb20

bb14:                                             ; preds = %bb10
  %3 = call i32 @print(i32 214)
  %tmp15 = load i32, i32* @main.step, align 4
  %tmp16 = urem i32 %tmp15, 4
  %tmp17 = icmp eq i32 %tmp16, 0
  br i1 %tmp17, label %bb18, label %bb19

bb18:                                             ; preds = %bb14
  %4 = call i32 @print(i32 215)
  call void @eul_to_quat()
  br label %bb19

bb19:                                             ; preds = %bb18, %bb14
  %5 = call i32 @print(i32 216)
  call void @err_quat()
  call void @attd_ctrl()
  br label %bb20

bb20:                                             ; preds = %bb19, %bb10
  %6 = call i32 @print(i32 217)
  call void @rate_ctrl()
  call void @ecg()
  %tmp21 = load i32, i32* @main.step, align 4
  %tmp22 = add i32 %tmp21, 1
  store i32 %tmp22, i32* @main.step, align 4
  store i8 0, i8* %tmp4, align 1
  br label %bb23

bb23:                                             ; preds = %bb35, %bb20
  %7 = call i32 @print(i32 218)
  %tmp24 = load i8, i8* %tmp4, align 1
  %tmp25 = zext i8 %tmp24 to i32
  %tmp26 = icmp slt i32 %tmp25, 8
  br i1 %tmp26, label %bb27, label %bb38

bb27:                                             ; preds = %bb23
  %8 = call i32 @print(i32 219)
  %tmp28 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %tmp29 = load i8, i8* %tmp4, align 1
  %tmp30 = zext i8 %tmp29 to i64
  %tmp31 = getelementptr inbounds [8 x i16], [8 x i16]* @mtr_cmd, i64 0, i64 %tmp30
  %tmp32 = load i16, i16* %tmp31, align 2
  %tmp33 = zext i16 %tmp32 to i32
  %tmp34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %tmp28, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 %tmp33)
  br label %bb35

bb35:                                             ; preds = %bb27
  %9 = call i32 @print(i32 220)
  %tmp36 = load i8, i8* %tmp4, align 1
  %tmp37 = add i8 %tmp36, 1
  store i8 %tmp37, i8* %tmp4, align 1
  br label %bb23

bb38:                                             ; preds = %bb23
  %10 = call i32 @print(i32 221)
  %tmp39 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %tmp40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %tmp39, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  br label %bb7

bb41:                                             ; preds = %bb7
  %11 = call i32 @print(i32 222)
  %tmp42 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %tmp43 = call i32 @fclose(%struct._IO_FILE* %tmp42)
  %tmp44 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %tmp45 = call i32 @fclose(%struct._IO_FILE* %tmp44)
  call void @ecg()
  ret i32 0
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

declare i32 @print(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
