; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #0 !dbg !7 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* nonnull @transpose_submit, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #3, !dbg !10
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* nonnull @trans_basic, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !11
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* nonnull @trans_tmp, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !12
  ret void, !dbg !13
}

declare dso_local void @registerTransFunction(void (i64, i64, double*, double*, double*)*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define internal void @transpose_submit(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture readnone) #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata i64 %1, metadata !28, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata double* %2, metadata !29, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata double* %3, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata double* %4, metadata !31, metadata !DIExpression()), !dbg !36
  %6 = icmp eq i64 %0, 32, !dbg !37
  %7 = icmp eq i64 %1, 32, !dbg !39
  %8 = and i1 %6, %7, !dbg !40
  br i1 %8, label %9, label %53, !dbg !40

; <label>:9:                                      ; preds = %5, %51
  %10 = phi i64 [ %11, %51 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !41, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.value(metadata i64 0, metadata !50, metadata !DIExpression()), !dbg !66
  %11 = add i64 %10, 8
  br label %12

; <label>:12:                                     ; preds = %15, %9
  %13 = phi i64 [ %14, %15 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %13, metadata !50, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata i64 %10, metadata !54, metadata !DIExpression()), !dbg !67
  %14 = add i64 %13, 8
  br label %17

; <label>:15:                                     ; preds = %22
  call void @llvm.dbg.value(metadata i64 %14, metadata !50, metadata !DIExpression()), !dbg !66
  %16 = icmp ult i64 %14, 32, !dbg !68
  br i1 %16, label %12, label %51, !dbg !69, !llvm.loop !70

; <label>:17:                                     ; preds = %12, %22
  %18 = phi i64 [ %23, %22 ], [ %10, %12 ]
  call void @llvm.dbg.value(metadata i64 %18, metadata !54, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata i64 %13, metadata !58, metadata !DIExpression()), !dbg !73
  %19 = shl nsw i64 %18, 5
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = getelementptr inbounds double, double* %3, i64 %18
  br label %30, !dbg !74

; <label>:22:                                     ; preds = %48
  %23 = add nuw i64 %18, 1, !dbg !75
  call void @llvm.dbg.value(metadata i64 %23, metadata !54, metadata !DIExpression()), !dbg !67
  %24 = icmp ult i64 %23, %11, !dbg !76
  br i1 %24, label %17, label %15, !dbg !77, !llvm.loop !78

; <label>:25:                                     ; preds = %40
  call void @llvm.dbg.value(metadata i64 %13, metadata !62, metadata !DIExpression()), !dbg !81
  %26 = getelementptr inbounds double, double* %20, i64 %18
  %27 = bitcast double* %26 to i64*
  %28 = getelementptr inbounds double, double* %21, i64 %19
  %29 = bitcast double* %28 to i64*
  br label %43, !dbg !82

; <label>:30:                                     ; preds = %40, %17
  %31 = phi i64 [ %13, %17 ], [ %41, %40 ]
  call void @llvm.dbg.value(metadata i64 %31, metadata !58, metadata !DIExpression()), !dbg !73
  %32 = icmp eq i64 %18, %31, !dbg !83
  br i1 %32, label %40, label %33, !dbg !87

; <label>:33:                                     ; preds = %30
  %34 = getelementptr inbounds double, double* %20, i64 %31, !dbg !88
  %35 = bitcast double* %34 to i64*, !dbg !88
  %36 = load i64, i64* %35, align 8, !dbg !88, !tbaa !90
  %37 = shl nsw i64 %31, 5, !dbg !94
  %38 = getelementptr inbounds double, double* %21, i64 %37, !dbg !94
  %39 = bitcast double* %38 to i64*, !dbg !95
  store i64 %36, i64* %39, align 8, !dbg !95, !tbaa !90
  br label %40, !dbg !96

; <label>:40:                                     ; preds = %33, %30
  %41 = add nuw i64 %31, 1, !dbg !97
  call void @llvm.dbg.value(metadata i64 %41, metadata !58, metadata !DIExpression()), !dbg !73
  %42 = icmp ult i64 %41, %14, !dbg !98
  br i1 %42, label %30, label %25, !dbg !74, !llvm.loop !99

; <label>:43:                                     ; preds = %48, %25
  %44 = phi i64 [ %13, %25 ], [ %49, %48 ]
  call void @llvm.dbg.value(metadata i64 %44, metadata !62, metadata !DIExpression()), !dbg !81
  %45 = icmp eq i64 %18, %44, !dbg !102
  br i1 %45, label %46, label %48, !dbg !106

; <label>:46:                                     ; preds = %43
  %47 = load i64, i64* %27, align 8, !dbg !107, !tbaa !90
  store i64 %47, i64* %29, align 8, !dbg !109, !tbaa !90
  br label %48, !dbg !110

; <label>:48:                                     ; preds = %46, %43
  %49 = add nuw i64 %44, 1, !dbg !111
  call void @llvm.dbg.value(metadata i64 %49, metadata !62, metadata !DIExpression()), !dbg !81
  %50 = icmp ult i64 %49, %14, !dbg !112
  br i1 %50, label %43, label %22, !dbg !82, !llvm.loop !113

; <label>:51:                                     ; preds = %15
  call void @llvm.dbg.value(metadata i64 %11, metadata !41, metadata !DIExpression()), !dbg !64
  %52 = icmp ult i64 %11, 32, !dbg !116
  br i1 %52, label %9, label %124, !dbg !117, !llvm.loop !118

; <label>:53:                                     ; preds = %5
  %54 = icmp eq i64 %0, 1024, !dbg !121
  %55 = icmp eq i64 %1, 0, !dbg !122
  br i1 %54, label %56, label %103, !dbg !123

; <label>:56:                                     ; preds = %53
  call void @llvm.dbg.value(metadata i64 1024, metadata !45, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.value(metadata i64 %1, metadata !46, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.value(metadata double* %2, metadata !47, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.value(metadata double* %3, metadata !48, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.value(metadata double* null, metadata !49, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i64 0, metadata !41, metadata !DIExpression()), !dbg !130
  br i1 %55, label %124, label %57, !dbg !131

; <label>:57:                                     ; preds = %56, %101
  %58 = phi i64 [ %59, %101 ], [ 0, %56 ]
  call void @llvm.dbg.value(metadata i64 %58, metadata !41, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !50, metadata !DIExpression()), !dbg !132
  %59 = add i64 %58, 8
  %60 = icmp eq i64 %58, -8
  br i1 %60, label %101, label %61, !dbg !133

; <label>:61:                                     ; preds = %57, %64
  %62 = phi i64 [ %63, %64 ], [ 0, %57 ]
  call void @llvm.dbg.value(metadata i64 %62, metadata !50, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.value(metadata i64 %58, metadata !54, metadata !DIExpression()), !dbg !134
  %63 = add nuw nsw i64 %62, 8
  br label %66

; <label>:64:                                     ; preds = %71
  call void @llvm.dbg.value(metadata i64 %63, metadata !50, metadata !DIExpression()), !dbg !132
  %65 = icmp ult i64 %63, 1024, !dbg !135
  br i1 %65, label %61, label %101, !dbg !133, !llvm.loop !70

; <label>:66:                                     ; preds = %61, %71
  %67 = phi i64 [ %72, %71 ], [ %58, %61 ]
  call void @llvm.dbg.value(metadata i64 %67, metadata !54, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i64 %62, metadata !58, metadata !DIExpression()), !dbg !136
  %68 = shl nsw i64 %67, 10
  %69 = getelementptr inbounds double, double* %2, i64 %68
  %70 = getelementptr inbounds double, double* %3, i64 %67
  br label %80, !dbg !137

; <label>:71:                                     ; preds = %98
  %72 = add nuw i64 %67, 1, !dbg !138
  call void @llvm.dbg.value(metadata i64 %72, metadata !54, metadata !DIExpression()), !dbg !134
  %73 = icmp ult i64 %72, %59, !dbg !139
  br i1 %73, label %66, label %64, !dbg !140, !llvm.loop !78

; <label>:74:                                     ; preds = %90
  call void @llvm.dbg.value(metadata i64 %62, metadata !62, metadata !DIExpression()), !dbg !141
  %75 = getelementptr inbounds double, double* %69, i64 %67
  %76 = bitcast double* %75 to i64*
  %77 = mul nsw i64 %67, %1
  %78 = getelementptr inbounds double, double* %70, i64 %77
  %79 = bitcast double* %78 to i64*
  br label %93, !dbg !142

; <label>:80:                                     ; preds = %90, %66
  %81 = phi i64 [ %62, %66 ], [ %91, %90 ]
  call void @llvm.dbg.value(metadata i64 %81, metadata !58, metadata !DIExpression()), !dbg !136
  %82 = icmp eq i64 %67, %81, !dbg !143
  br i1 %82, label %90, label %83, !dbg !144

; <label>:83:                                     ; preds = %80
  %84 = getelementptr inbounds double, double* %69, i64 %81, !dbg !145
  %85 = bitcast double* %84 to i64*, !dbg !145
  %86 = load i64, i64* %85, align 8, !dbg !145, !tbaa !90
  %87 = mul nsw i64 %81, %1, !dbg !146
  %88 = getelementptr inbounds double, double* %70, i64 %87, !dbg !146
  %89 = bitcast double* %88 to i64*, !dbg !147
  store i64 %86, i64* %89, align 8, !dbg !147, !tbaa !90
  br label %90, !dbg !148

; <label>:90:                                     ; preds = %83, %80
  %91 = add nuw nsw i64 %81, 1, !dbg !149
  call void @llvm.dbg.value(metadata i64 %91, metadata !58, metadata !DIExpression()), !dbg !136
  %92 = icmp ult i64 %91, %63, !dbg !150
  br i1 %92, label %80, label %74, !dbg !137, !llvm.loop !99

; <label>:93:                                     ; preds = %98, %74
  %94 = phi i64 [ %62, %74 ], [ %99, %98 ]
  call void @llvm.dbg.value(metadata i64 %94, metadata !62, metadata !DIExpression()), !dbg !141
  %95 = icmp eq i64 %67, %94, !dbg !151
  br i1 %95, label %96, label %98, !dbg !152

; <label>:96:                                     ; preds = %93
  %97 = load i64, i64* %76, align 8, !dbg !153, !tbaa !90
  store i64 %97, i64* %79, align 8, !dbg !154, !tbaa !90
  br label %98, !dbg !155

; <label>:98:                                     ; preds = %96, %93
  %99 = add nuw nsw i64 %94, 1, !dbg !156
  call void @llvm.dbg.value(metadata i64 %99, metadata !62, metadata !DIExpression()), !dbg !141
  %100 = icmp ult i64 %99, %63, !dbg !157
  br i1 %100, label %93, label %71, !dbg !142, !llvm.loop !113

; <label>:101:                                    ; preds = %64, %57
  call void @llvm.dbg.value(metadata i64 %59, metadata !41, metadata !DIExpression()), !dbg !130
  %102 = icmp ult i64 %59, %1, !dbg !158
  br i1 %102, label %57, label %124, !dbg !131, !llvm.loop !118

; <label>:103:                                    ; preds = %53
  call void @llvm.dbg.value(metadata i64 %0, metadata !159, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i64 %1, metadata !162, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.value(metadata double* %2, metadata !163, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.value(metadata double* %3, metadata !164, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.value(metadata double* %4, metadata !165, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 0, metadata !166, metadata !DIExpression()), !dbg !178
  %104 = icmp eq i64 %0, 0
  %105 = or i1 %104, %55, !dbg !179
  br i1 %105, label %124, label %106, !dbg !179

; <label>:106:                                    ; preds = %103, %121
  %107 = phi i64 [ %122, %121 ], [ 0, %103 ]
  call void @llvm.dbg.value(metadata i64 %107, metadata !166, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i64 0, metadata !168, metadata !DIExpression()), !dbg !180
  %108 = mul nsw i64 %107, %0
  %109 = getelementptr inbounds double, double* %2, i64 %108
  %110 = getelementptr inbounds double, double* %3, i64 %107
  br label %111, !dbg !181

; <label>:111:                                    ; preds = %111, %106
  %112 = phi i64 [ 0, %106 ], [ %119, %111 ]
  call void @llvm.dbg.value(metadata i64 %112, metadata !168, metadata !DIExpression()), !dbg !180
  %113 = getelementptr inbounds double, double* %109, i64 %112, !dbg !182
  %114 = bitcast double* %113 to i64*, !dbg !182
  %115 = load i64, i64* %114, align 8, !dbg !182, !tbaa !90
  %116 = mul nsw i64 %112, %1, !dbg !185
  %117 = getelementptr inbounds double, double* %110, i64 %116, !dbg !185
  %118 = bitcast double* %117 to i64*, !dbg !186
  store i64 %115, i64* %118, align 8, !dbg !186, !tbaa !90
  %119 = add nuw i64 %112, 1, !dbg !187
  call void @llvm.dbg.value(metadata i64 %119, metadata !168, metadata !DIExpression()), !dbg !180
  %120 = icmp eq i64 %119, %0, !dbg !188
  br i1 %120, label %121, label %111, !dbg !181, !llvm.loop !189

; <label>:121:                                    ; preds = %111
  %122 = add nuw i64 %107, 1, !dbg !192
  call void @llvm.dbg.value(metadata i64 %122, metadata !166, metadata !DIExpression()), !dbg !178
  %123 = icmp eq i64 %122, %1, !dbg !193
  br i1 %123, label %124, label %106, !dbg !179, !llvm.loop !194

; <label>:124:                                    ; preds = %121, %101, %51, %103, %56
  ret void, !dbg !197
}

; Function Attrs: nounwind uwtable
define internal void @trans_basic(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture readnone) #0 !dbg !160 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !159, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata i64 %1, metadata !162, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.value(metadata double* %2, metadata !163, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata double* %3, metadata !164, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.value(metadata double* %4, metadata !165, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.value(metadata i64 0, metadata !166, metadata !DIExpression()), !dbg !203
  %6 = icmp eq i64 %1, 0, !dbg !204
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !195
  br i1 %8, label %27, label %9, !dbg !195

; <label>:9:                                      ; preds = %5, %24
  %10 = phi i64 [ %25, %24 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !166, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata i64 0, metadata !168, metadata !DIExpression()), !dbg !205
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = getelementptr inbounds double, double* %3, i64 %10
  br label %14, !dbg !190

; <label>:14:                                     ; preds = %14, %9
  %15 = phi i64 [ 0, %9 ], [ %22, %14 ]
  call void @llvm.dbg.value(metadata i64 %15, metadata !168, metadata !DIExpression()), !dbg !205
  %16 = getelementptr inbounds double, double* %12, i64 %15, !dbg !206
  %17 = bitcast double* %16 to i64*, !dbg !206
  %18 = load i64, i64* %17, align 8, !dbg !206, !tbaa !90
  %19 = mul nsw i64 %15, %1, !dbg !207
  %20 = getelementptr inbounds double, double* %13, i64 %19, !dbg !207
  %21 = bitcast double* %20 to i64*, !dbg !208
  store i64 %18, i64* %21, align 8, !dbg !208, !tbaa !90
  %22 = add nuw i64 %15, 1, !dbg !209
  call void @llvm.dbg.value(metadata i64 %22, metadata !168, metadata !DIExpression()), !dbg !205
  %23 = icmp eq i64 %22, %0, !dbg !210
  br i1 %23, label %24, label %14, !dbg !190, !llvm.loop !189

; <label>:24:                                     ; preds = %14
  %25 = add nuw i64 %10, 1, !dbg !211
  call void @llvm.dbg.value(metadata i64 %25, metadata !166, metadata !DIExpression()), !dbg !203
  %26 = icmp eq i64 %25, %1, !dbg !204
  br i1 %26, label %27, label %9, !dbg !195, !llvm.loop !194

; <label>:27:                                     ; preds = %24, %5
  ret void, !dbg !212
}

; Function Attrs: nounwind uwtable
define internal void @trans_tmp(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture) #0 !dbg !213 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !215, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.value(metadata i64 %1, metadata !216, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata double* %2, metadata !217, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata double* %3, metadata !218, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata double* %4, metadata !219, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.value(metadata i64 0, metadata !220, metadata !DIExpression()), !dbg !235
  %6 = icmp eq i64 %1, 0, !dbg !236
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !237
  br i1 %8, label %33, label %9, !dbg !237

; <label>:9:                                      ; preds = %5, %30
  %10 = phi i64 [ %31, %30 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !220, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.value(metadata i64 0, metadata !222, metadata !DIExpression()), !dbg !238
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !239

; <label>:16:                                     ; preds = %16, %9
  %17 = phi i64 [ 0, %9 ], [ %28, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !222, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.value(metadata i64 %10, metadata !226, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !240
  %18 = and i64 %17, 1, !dbg !241
  call void @llvm.dbg.value(metadata i64 %18, metadata !229, metadata !DIExpression()), !dbg !242
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !243
  %20 = bitcast double* %19 to i64*, !dbg !243
  %21 = load i64, i64* %20, align 8, !dbg !243, !tbaa !90
  %22 = or i64 %18, %14, !dbg !244
  %23 = getelementptr inbounds double, double* %4, i64 %22, !dbg !245
  %24 = bitcast double* %23 to i64*, !dbg !246
  store i64 %21, i64* %24, align 8, !dbg !246, !tbaa !90
  %25 = mul nsw i64 %17, %1, !dbg !247
  %26 = getelementptr inbounds double, double* %15, i64 %25, !dbg !247
  %27 = bitcast double* %26 to i64*, !dbg !248
  store i64 %21, i64* %27, align 8, !dbg !248, !tbaa !90
  %28 = add nuw i64 %17, 1, !dbg !249
  call void @llvm.dbg.value(metadata i64 %28, metadata !222, metadata !DIExpression()), !dbg !238
  %29 = icmp eq i64 %28, %0, !dbg !250
  br i1 %29, label %30, label %16, !dbg !239, !llvm.loop !251

; <label>:30:                                     ; preds = %16
  %31 = add nuw i64 %10, 1, !dbg !253
  call void @llvm.dbg.value(metadata i64 %31, metadata !220, metadata !DIExpression()), !dbg !235
  %32 = icmp eq i64 %31, %1, !dbg !236
  br i1 %32, label %33, label %9, !dbg !237, !llvm.loop !254

; <label>:33:                                     ; preds = %30, %5
  ret void, !dbg !256
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr9/wchen4/private/18213/cache-lab-wammowammo")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!7 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 162, type: !8, isLocal: false, isDefinition: true, scopeLine: 162, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 164, column: 5, scope: !7)
!11 = !DILocation(line: 167, column: 5, scope: !7)
!12 = !DILocation(line: 168, column: 5, scope: !7)
!13 = !DILocation(line: 169, column: 1, scope: !7)
!14 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 147, type: !15, isLocal: true, isDefinition: true, scopeLine: 148, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !26)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17, !17, !20, !20, !25}
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 62, baseType: !19)
!18 = !DIFile(filename: "/usr/local/depot/llvm-7.0/lib/clang/7.0.0/include/stddef.h", directory: "/afs/andrew.cmu.edu/usr9/wchen4/private/18213/cache-lab-wammowammo")
!19 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, elements: !23)
!22 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!23 = !{!24}
!24 = !DISubrange(count: -1)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!26 = !{!27, !28, !29, !30, !31}
!27 = !DILocalVariable(name: "M", arg: 1, scope: !14, file: !1, line: 147, type: !17)
!28 = !DILocalVariable(name: "N", arg: 2, scope: !14, file: !1, line: 147, type: !17)
!29 = !DILocalVariable(name: "A", arg: 3, scope: !14, file: !1, line: 147, type: !20)
!30 = !DILocalVariable(name: "B", arg: 4, scope: !14, file: !1, line: 147, type: !20)
!31 = !DILocalVariable(name: "tmp", arg: 5, scope: !14, file: !1, line: 148, type: !25)
!32 = !DILocation(line: 147, column: 37, scope: !14)
!33 = !DILocation(line: 147, column: 47, scope: !14)
!34 = !DILocation(line: 147, column: 57, scope: !14)
!35 = !DILocation(line: 147, column: 73, scope: !14)
!36 = !DILocation(line: 148, column: 37, scope: !14)
!37 = !DILocation(line: 149, column: 12, scope: !38)
!38 = distinct !DILexicalBlock(scope: !14, file: !1, line: 149, column: 9)
!39 = !DILocation(line: 149, column: 23, scope: !38)
!40 = !DILocation(line: 149, column: 18, scope: !38)
!41 = !DILocalVariable(name: "i", scope: !42, file: !1, line: 121, type: !17)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 121, column: 5)
!43 = distinct !DISubprogram(name: "trans_other", scope: !1, file: !1, line: 119, type: !15, isLocal: true, isDefinition: true, scopeLine: 120, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !44)
!44 = !{!45, !46, !47, !48, !49, !41, !50, !54, !58, !62}
!45 = !DILocalVariable(name: "M", arg: 1, scope: !43, file: !1, line: 119, type: !17)
!46 = !DILocalVariable(name: "N", arg: 2, scope: !43, file: !1, line: 119, type: !17)
!47 = !DILocalVariable(name: "A", arg: 3, scope: !43, file: !1, line: 119, type: !20)
!48 = !DILocalVariable(name: "B", arg: 4, scope: !43, file: !1, line: 119, type: !20)
!49 = !DILocalVariable(name: "tmp", arg: 5, scope: !43, file: !1, line: 120, type: !25)
!50 = !DILocalVariable(name: "j", scope: !51, file: !1, line: 122, type: !17)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 122, column: 9)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 121, column: 39)
!53 = distinct !DILexicalBlock(scope: !42, file: !1, line: 121, column: 5)
!54 = !DILocalVariable(name: "row", scope: !55, file: !1, line: 123, type: !17)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 123, column: 13)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 122, column: 43)
!57 = distinct !DILexicalBlock(scope: !51, file: !1, line: 122, column: 9)
!58 = !DILocalVariable(name: "col", scope: !59, file: !1, line: 124, type: !17)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 124, column: 17)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 123, column: 54)
!61 = distinct !DILexicalBlock(scope: !55, file: !1, line: 123, column: 13)
!62 = !DILocalVariable(name: "col", scope: !63, file: !1, line: 129, type: !17)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 129, column: 17)
!64 = !DILocation(line: 121, column: 17, scope: !42, inlinedAt: !65)
!65 = distinct !DILocation(line: 150, column: 9, scope: !38)
!66 = !DILocation(line: 122, column: 21, scope: !51, inlinedAt: !65)
!67 = !DILocation(line: 123, column: 25, scope: !55, inlinedAt: !65)
!68 = !DILocation(line: 122, column: 30, scope: !57, inlinedAt: !65)
!69 = !DILocation(line: 122, column: 9, scope: !51, inlinedAt: !65)
!70 = distinct !{!70, !71, !72}
!71 = !DILocation(line: 122, column: 9, scope: !51)
!72 = !DILocation(line: 135, column: 9, scope: !51)
!73 = !DILocation(line: 124, column: 29, scope: !59, inlinedAt: !65)
!74 = !DILocation(line: 124, column: 17, scope: !59, inlinedAt: !65)
!75 = !DILocation(line: 123, column: 50, scope: !61, inlinedAt: !65)
!76 = !DILocation(line: 123, column: 38, scope: !61, inlinedAt: !65)
!77 = !DILocation(line: 123, column: 13, scope: !55, inlinedAt: !65)
!78 = distinct !{!78, !79, !80}
!79 = !DILocation(line: 123, column: 13, scope: !55)
!80 = !DILocation(line: 134, column: 13, scope: !55)
!81 = !DILocation(line: 129, column: 29, scope: !63, inlinedAt: !65)
!82 = !DILocation(line: 129, column: 17, scope: !63, inlinedAt: !65)
!83 = !DILocation(line: 125, column: 29, scope: !84, inlinedAt: !65)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 125, column: 25)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 124, column: 58)
!86 = distinct !DILexicalBlock(scope: !59, file: !1, line: 124, column: 17)
!87 = !DILocation(line: 125, column: 25, scope: !85, inlinedAt: !65)
!88 = !DILocation(line: 126, column: 39, scope: !89, inlinedAt: !65)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 125, column: 37)
!90 = !{!91, !91, i64 0}
!91 = !{!"double", !92, i64 0}
!92 = !{!"omnipotent char", !93, i64 0}
!93 = !{!"Simple C/C++ TBAA"}
!94 = !DILocation(line: 126, column: 25, scope: !89, inlinedAt: !65)
!95 = !DILocation(line: 126, column: 37, scope: !89, inlinedAt: !65)
!96 = !DILocation(line: 127, column: 21, scope: !89, inlinedAt: !65)
!97 = !DILocation(line: 124, column: 54, scope: !86, inlinedAt: !65)
!98 = !DILocation(line: 124, column: 42, scope: !86, inlinedAt: !65)
!99 = distinct !{!99, !100, !101}
!100 = !DILocation(line: 124, column: 17, scope: !59)
!101 = !DILocation(line: 128, column: 17, scope: !59)
!102 = !DILocation(line: 130, column: 29, scope: !103, inlinedAt: !65)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 130, column: 25)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 129, column: 58)
!105 = distinct !DILexicalBlock(scope: !63, file: !1, line: 129, column: 17)
!106 = !DILocation(line: 130, column: 25, scope: !104, inlinedAt: !65)
!107 = !DILocation(line: 131, column: 39, scope: !108, inlinedAt: !65)
!108 = distinct !DILexicalBlock(scope: !103, file: !1, line: 130, column: 37)
!109 = !DILocation(line: 131, column: 37, scope: !108, inlinedAt: !65)
!110 = !DILocation(line: 132, column: 21, scope: !108, inlinedAt: !65)
!111 = !DILocation(line: 129, column: 54, scope: !105, inlinedAt: !65)
!112 = !DILocation(line: 129, column: 42, scope: !105, inlinedAt: !65)
!113 = distinct !{!113, !114, !115}
!114 = !DILocation(line: 129, column: 17, scope: !63)
!115 = !DILocation(line: 133, column: 17, scope: !63)
!116 = !DILocation(line: 121, column: 26, scope: !53, inlinedAt: !65)
!117 = !DILocation(line: 121, column: 5, scope: !42, inlinedAt: !65)
!118 = distinct !{!118, !119, !120}
!119 = !DILocation(line: 121, column: 5, scope: !42)
!120 = !DILocation(line: 136, column: 5, scope: !42)
!121 = !DILocation(line: 149, column: 36, scope: !38)
!122 = !DILocation(line: 0, scope: !38)
!123 = !DILocation(line: 149, column: 44, scope: !38)
!124 = !DILocation(line: 119, column: 32, scope: !43, inlinedAt: !125)
!125 = distinct !DILocation(line: 150, column: 9, scope: !38)
!126 = !DILocation(line: 119, column: 42, scope: !43, inlinedAt: !125)
!127 = !DILocation(line: 119, column: 52, scope: !43, inlinedAt: !125)
!128 = !DILocation(line: 119, column: 68, scope: !43, inlinedAt: !125)
!129 = !DILocation(line: 120, column: 32, scope: !43, inlinedAt: !125)
!130 = !DILocation(line: 121, column: 17, scope: !42, inlinedAt: !125)
!131 = !DILocation(line: 121, column: 5, scope: !42, inlinedAt: !125)
!132 = !DILocation(line: 122, column: 21, scope: !51, inlinedAt: !125)
!133 = !DILocation(line: 122, column: 9, scope: !51, inlinedAt: !125)
!134 = !DILocation(line: 123, column: 25, scope: !55, inlinedAt: !125)
!135 = !DILocation(line: 122, column: 30, scope: !57, inlinedAt: !125)
!136 = !DILocation(line: 124, column: 29, scope: !59, inlinedAt: !125)
!137 = !DILocation(line: 124, column: 17, scope: !59, inlinedAt: !125)
!138 = !DILocation(line: 123, column: 50, scope: !61, inlinedAt: !125)
!139 = !DILocation(line: 123, column: 38, scope: !61, inlinedAt: !125)
!140 = !DILocation(line: 123, column: 13, scope: !55, inlinedAt: !125)
!141 = !DILocation(line: 129, column: 29, scope: !63, inlinedAt: !125)
!142 = !DILocation(line: 129, column: 17, scope: !63, inlinedAt: !125)
!143 = !DILocation(line: 125, column: 29, scope: !84, inlinedAt: !125)
!144 = !DILocation(line: 125, column: 25, scope: !85, inlinedAt: !125)
!145 = !DILocation(line: 126, column: 39, scope: !89, inlinedAt: !125)
!146 = !DILocation(line: 126, column: 25, scope: !89, inlinedAt: !125)
!147 = !DILocation(line: 126, column: 37, scope: !89, inlinedAt: !125)
!148 = !DILocation(line: 127, column: 21, scope: !89, inlinedAt: !125)
!149 = !DILocation(line: 124, column: 54, scope: !86, inlinedAt: !125)
!150 = !DILocation(line: 124, column: 42, scope: !86, inlinedAt: !125)
!151 = !DILocation(line: 130, column: 29, scope: !103, inlinedAt: !125)
!152 = !DILocation(line: 130, column: 25, scope: !104, inlinedAt: !125)
!153 = !DILocation(line: 131, column: 39, scope: !108, inlinedAt: !125)
!154 = !DILocation(line: 131, column: 37, scope: !108, inlinedAt: !125)
!155 = !DILocation(line: 132, column: 21, scope: !108, inlinedAt: !125)
!156 = !DILocation(line: 129, column: 54, scope: !105, inlinedAt: !125)
!157 = !DILocation(line: 129, column: 42, scope: !105, inlinedAt: !125)
!158 = !DILocation(line: 121, column: 26, scope: !53, inlinedAt: !125)
!159 = !DILocalVariable(name: "M", arg: 1, scope: !160, file: !1, line: 81, type: !17)
!160 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !15, isLocal: true, isDefinition: true, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !161)
!161 = !{!159, !162, !163, !164, !165, !166, !168}
!162 = !DILocalVariable(name: "N", arg: 2, scope: !160, file: !1, line: 81, type: !17)
!163 = !DILocalVariable(name: "A", arg: 3, scope: !160, file: !1, line: 81, type: !20)
!164 = !DILocalVariable(name: "B", arg: 4, scope: !160, file: !1, line: 81, type: !20)
!165 = !DILocalVariable(name: "tmp", arg: 5, scope: !160, file: !1, line: 82, type: !25)
!166 = !DILocalVariable(name: "i", scope: !167, file: !1, line: 86, type: !17)
!167 = distinct !DILexicalBlock(scope: !160, file: !1, line: 86, column: 5)
!168 = !DILocalVariable(name: "j", scope: !169, file: !1, line: 87, type: !17)
!169 = distinct !DILexicalBlock(scope: !170, file: !1, line: 87, column: 9)
!170 = distinct !DILexicalBlock(scope: !171, file: !1, line: 86, column: 36)
!171 = distinct !DILexicalBlock(scope: !167, file: !1, line: 86, column: 5)
!172 = !DILocation(line: 81, column: 32, scope: !160, inlinedAt: !173)
!173 = distinct !DILocation(line: 152, column: 9, scope: !38)
!174 = !DILocation(line: 81, column: 42, scope: !160, inlinedAt: !173)
!175 = !DILocation(line: 81, column: 52, scope: !160, inlinedAt: !173)
!176 = !DILocation(line: 81, column: 68, scope: !160, inlinedAt: !173)
!177 = !DILocation(line: 82, column: 32, scope: !160, inlinedAt: !173)
!178 = !DILocation(line: 86, column: 17, scope: !167, inlinedAt: !173)
!179 = !DILocation(line: 86, column: 5, scope: !167, inlinedAt: !173)
!180 = !DILocation(line: 87, column: 21, scope: !169, inlinedAt: !173)
!181 = !DILocation(line: 87, column: 9, scope: !169, inlinedAt: !173)
!182 = !DILocation(line: 88, column: 23, scope: !183, inlinedAt: !173)
!183 = distinct !DILexicalBlock(scope: !184, file: !1, line: 87, column: 40)
!184 = distinct !DILexicalBlock(scope: !169, file: !1, line: 87, column: 9)
!185 = !DILocation(line: 88, column: 13, scope: !183, inlinedAt: !173)
!186 = !DILocation(line: 88, column: 21, scope: !183, inlinedAt: !173)
!187 = !DILocation(line: 87, column: 36, scope: !184, inlinedAt: !173)
!188 = !DILocation(line: 87, column: 30, scope: !184, inlinedAt: !173)
!189 = distinct !{!189, !190, !191}
!190 = !DILocation(line: 87, column: 9, scope: !169)
!191 = !DILocation(line: 89, column: 9, scope: !169)
!192 = !DILocation(line: 86, column: 32, scope: !171, inlinedAt: !173)
!193 = !DILocation(line: 86, column: 26, scope: !171, inlinedAt: !173)
!194 = distinct !{!194, !195, !196}
!195 = !DILocation(line: 86, column: 5, scope: !167)
!196 = !DILocation(line: 90, column: 5, scope: !167)
!197 = !DILocation(line: 153, column: 1, scope: !14)
!198 = !DILocation(line: 81, column: 32, scope: !160)
!199 = !DILocation(line: 81, column: 42, scope: !160)
!200 = !DILocation(line: 81, column: 52, scope: !160)
!201 = !DILocation(line: 81, column: 68, scope: !160)
!202 = !DILocation(line: 82, column: 32, scope: !160)
!203 = !DILocation(line: 86, column: 17, scope: !167)
!204 = !DILocation(line: 86, column: 26, scope: !171)
!205 = !DILocation(line: 87, column: 21, scope: !169)
!206 = !DILocation(line: 88, column: 23, scope: !183)
!207 = !DILocation(line: 88, column: 13, scope: !183)
!208 = !DILocation(line: 88, column: 21, scope: !183)
!209 = !DILocation(line: 87, column: 36, scope: !184)
!210 = !DILocation(line: 87, column: 30, scope: !184)
!211 = !DILocation(line: 86, column: 32, scope: !171)
!212 = !DILocation(line: 93, column: 1, scope: !160)
!213 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !15, isLocal: true, isDefinition: true, scopeLine: 102, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !214)
!214 = !{!215, !216, !217, !218, !219, !220, !222, !226, !229}
!215 = !DILocalVariable(name: "M", arg: 1, scope: !213, file: !1, line: 101, type: !17)
!216 = !DILocalVariable(name: "N", arg: 2, scope: !213, file: !1, line: 101, type: !17)
!217 = !DILocalVariable(name: "A", arg: 3, scope: !213, file: !1, line: 101, type: !20)
!218 = !DILocalVariable(name: "B", arg: 4, scope: !213, file: !1, line: 101, type: !20)
!219 = !DILocalVariable(name: "tmp", arg: 5, scope: !213, file: !1, line: 102, type: !25)
!220 = !DILocalVariable(name: "i", scope: !221, file: !1, line: 106, type: !17)
!221 = distinct !DILexicalBlock(scope: !213, file: !1, line: 106, column: 5)
!222 = !DILocalVariable(name: "j", scope: !223, file: !1, line: 107, type: !17)
!223 = distinct !DILexicalBlock(scope: !224, file: !1, line: 107, column: 9)
!224 = distinct !DILexicalBlock(scope: !225, file: !1, line: 106, column: 36)
!225 = distinct !DILexicalBlock(scope: !221, file: !1, line: 106, column: 5)
!226 = !DILocalVariable(name: "di", scope: !227, file: !1, line: 108, type: !17)
!227 = distinct !DILexicalBlock(scope: !228, file: !1, line: 107, column: 40)
!228 = distinct !DILexicalBlock(scope: !223, file: !1, line: 107, column: 9)
!229 = !DILocalVariable(name: "dj", scope: !227, file: !1, line: 109, type: !17)
!230 = !DILocation(line: 101, column: 30, scope: !213)
!231 = !DILocation(line: 101, column: 40, scope: !213)
!232 = !DILocation(line: 101, column: 50, scope: !213)
!233 = !DILocation(line: 101, column: 66, scope: !213)
!234 = !DILocation(line: 102, column: 30, scope: !213)
!235 = !DILocation(line: 106, column: 17, scope: !221)
!236 = !DILocation(line: 106, column: 26, scope: !225)
!237 = !DILocation(line: 106, column: 5, scope: !221)
!238 = !DILocation(line: 107, column: 21, scope: !223)
!239 = !DILocation(line: 107, column: 9, scope: !223)
!240 = !DILocation(line: 108, column: 20, scope: !227)
!241 = !DILocation(line: 109, column: 27, scope: !227)
!242 = !DILocation(line: 109, column: 20, scope: !227)
!243 = !DILocation(line: 110, column: 32, scope: !227)
!244 = !DILocation(line: 110, column: 24, scope: !227)
!245 = !DILocation(line: 110, column: 13, scope: !227)
!246 = !DILocation(line: 110, column: 30, scope: !227)
!247 = !DILocation(line: 111, column: 13, scope: !227)
!248 = !DILocation(line: 111, column: 21, scope: !227)
!249 = !DILocation(line: 107, column: 36, scope: !228)
!250 = !DILocation(line: 107, column: 30, scope: !228)
!251 = distinct !{!251, !239, !252}
!252 = !DILocation(line: 112, column: 9, scope: !223)
!253 = !DILocation(line: 106, column: 32, scope: !225)
!254 = distinct !{!254, !237, !255}
!255 = !DILocation(line: 113, column: 5, scope: !221)
!256 = !DILocation(line: 116, column: 1, scope: !213)
