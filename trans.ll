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
define internal void @transpose_submit(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture) #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata i64 %1, metadata !28, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata double* %2, metadata !29, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata double* %3, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata double* %4, metadata !31, metadata !DIExpression()), !dbg !36
  %6 = icmp eq i64 %0, %1, !dbg !37
  %7 = icmp eq i64 %1, 0, !dbg !39
  %8 = icmp eq i64 %0, 0
  %9 = or i1 %8, %7, !dbg !39
  br i1 %6, label %10, label %29, !dbg !40

; <label>:10:                                     ; preds = %5
  call void @llvm.dbg.value(metadata i64 %0, metadata !41, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i64 %1, metadata !44, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.value(metadata double* %2, metadata !45, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.value(metadata double* %3, metadata !46, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata double* %4, metadata !47, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i64 0, metadata !48, metadata !DIExpression()), !dbg !60
  br i1 %9, label %54, label %11, !dbg !61

; <label>:11:                                     ; preds = %10, %26
  %12 = phi i64 [ %27, %26 ], [ 0, %10 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !48, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.value(metadata i64 0, metadata !50, metadata !DIExpression()), !dbg !62
  %13 = mul nsw i64 %12, %0
  %14 = getelementptr inbounds double, double* %2, i64 %13
  %15 = getelementptr inbounds double, double* %3, i64 %12
  br label %16, !dbg !63

; <label>:16:                                     ; preds = %16, %11
  %17 = phi i64 [ 0, %11 ], [ %24, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !50, metadata !DIExpression()), !dbg !62
  %18 = getelementptr inbounds double, double* %14, i64 %17, !dbg !64
  %19 = bitcast double* %18 to i64*, !dbg !64
  %20 = load i64, i64* %19, align 8, !dbg !64, !tbaa !67
  %21 = mul nsw i64 %17, %0, !dbg !71
  %22 = getelementptr inbounds double, double* %15, i64 %21, !dbg !71
  %23 = bitcast double* %22 to i64*, !dbg !72
  store i64 %20, i64* %23, align 8, !dbg !72, !tbaa !67
  %24 = add nuw i64 %17, 1, !dbg !73
  call void @llvm.dbg.value(metadata i64 %24, metadata !50, metadata !DIExpression()), !dbg !62
  %25 = icmp eq i64 %24, %0, !dbg !74
  br i1 %25, label %26, label %16, !dbg !63, !llvm.loop !75

; <label>:26:                                     ; preds = %16
  %27 = add nuw i64 %12, 1, !dbg !78
  call void @llvm.dbg.value(metadata i64 %27, metadata !48, metadata !DIExpression()), !dbg !60
  %28 = icmp eq i64 %27, %0, !dbg !79
  br i1 %28, label %54, label %11, !dbg !61, !llvm.loop !80

; <label>:29:                                     ; preds = %5
  call void @llvm.dbg.value(metadata i64 %0, metadata !83, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.value(metadata i64 %1, metadata !86, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata double* %2, metadata !87, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.value(metadata double* %3, metadata !88, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata double* %4, metadata !89, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 0, metadata !90, metadata !DIExpression()), !dbg !106
  br i1 %9, label %54, label %30, !dbg !107

; <label>:30:                                     ; preds = %29, %51
  %31 = phi i64 [ %52, %51 ], [ 0, %29 ]
  call void @llvm.dbg.value(metadata i64 %31, metadata !90, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.value(metadata i64 0, metadata !92, metadata !DIExpression()), !dbg !108
  %32 = mul nsw i64 %31, %0
  %33 = getelementptr inbounds double, double* %2, i64 %32
  %34 = shl i64 %31, 1
  %35 = and i64 %34, 2
  %36 = getelementptr inbounds double, double* %3, i64 %31
  br label %37, !dbg !109

; <label>:37:                                     ; preds = %37, %30
  %38 = phi i64 [ 0, %30 ], [ %49, %37 ]
  call void @llvm.dbg.value(metadata i64 %38, metadata !92, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.value(metadata i64 %31, metadata !96, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !110
  %39 = and i64 %38, 1, !dbg !111
  call void @llvm.dbg.value(metadata i64 %39, metadata !99, metadata !DIExpression()), !dbg !112
  %40 = getelementptr inbounds double, double* %33, i64 %38, !dbg !113
  %41 = bitcast double* %40 to i64*, !dbg !113
  %42 = load i64, i64* %41, align 8, !dbg !113, !tbaa !67
  %43 = or i64 %39, %35, !dbg !114
  %44 = getelementptr inbounds double, double* %4, i64 %43, !dbg !115
  %45 = bitcast double* %44 to i64*, !dbg !116
  store i64 %42, i64* %45, align 8, !dbg !116, !tbaa !67
  %46 = mul nsw i64 %38, %1, !dbg !117
  %47 = getelementptr inbounds double, double* %36, i64 %46, !dbg !117
  %48 = bitcast double* %47 to i64*, !dbg !118
  store i64 %42, i64* %48, align 8, !dbg !118, !tbaa !67
  %49 = add nuw i64 %38, 1, !dbg !119
  call void @llvm.dbg.value(metadata i64 %49, metadata !92, metadata !DIExpression()), !dbg !108
  %50 = icmp eq i64 %49, %0, !dbg !120
  br i1 %50, label %51, label %37, !dbg !109, !llvm.loop !121

; <label>:51:                                     ; preds = %37
  %52 = add nuw i64 %31, 1, !dbg !124
  call void @llvm.dbg.value(metadata i64 %52, metadata !90, metadata !DIExpression()), !dbg !106
  %53 = icmp eq i64 %52, %1, !dbg !125
  br i1 %53, label %54, label %30, !dbg !107, !llvm.loop !126

; <label>:54:                                     ; preds = %51, %26, %29, %10
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define internal void @trans_basic(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture readnone) #0 !dbg !42 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !41, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %1, metadata !44, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.value(metadata double* %2, metadata !45, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.value(metadata double* %3, metadata !46, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata double* %4, metadata !47, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i64 0, metadata !48, metadata !DIExpression()), !dbg !135
  %6 = icmp eq i64 %1, 0, !dbg !136
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !81
  br i1 %8, label %27, label %9, !dbg !81

; <label>:9:                                      ; preds = %5, %24
  %10 = phi i64 [ %25, %24 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !48, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i64 0, metadata !50, metadata !DIExpression()), !dbg !137
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = getelementptr inbounds double, double* %3, i64 %10
  br label %14, !dbg !76

; <label>:14:                                     ; preds = %14, %9
  %15 = phi i64 [ 0, %9 ], [ %22, %14 ]
  call void @llvm.dbg.value(metadata i64 %15, metadata !50, metadata !DIExpression()), !dbg !137
  %16 = getelementptr inbounds double, double* %12, i64 %15, !dbg !138
  %17 = bitcast double* %16 to i64*, !dbg !138
  %18 = load i64, i64* %17, align 8, !dbg !138, !tbaa !67
  %19 = mul nsw i64 %15, %1, !dbg !139
  %20 = getelementptr inbounds double, double* %13, i64 %19, !dbg !139
  %21 = bitcast double* %20 to i64*, !dbg !140
  store i64 %18, i64* %21, align 8, !dbg !140, !tbaa !67
  %22 = add nuw i64 %15, 1, !dbg !141
  call void @llvm.dbg.value(metadata i64 %22, metadata !50, metadata !DIExpression()), !dbg !137
  %23 = icmp eq i64 %22, %0, !dbg !142
  br i1 %23, label %24, label %14, !dbg !76, !llvm.loop !75

; <label>:24:                                     ; preds = %14
  %25 = add nuw i64 %10, 1, !dbg !143
  call void @llvm.dbg.value(metadata i64 %25, metadata !48, metadata !DIExpression()), !dbg !135
  %26 = icmp eq i64 %25, %1, !dbg !136
  br i1 %26, label %27, label %9, !dbg !81, !llvm.loop !80

; <label>:27:                                     ; preds = %24, %5
  ret void, !dbg !144
}

; Function Attrs: nounwind uwtable
define internal void @trans_tmp(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture) #0 !dbg !84 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !83, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i64 %1, metadata !86, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata double* %2, metadata !87, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata double* %3, metadata !88, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata double* %4, metadata !89, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i64 0, metadata !90, metadata !DIExpression()), !dbg !150
  %6 = icmp eq i64 %1, 0, !dbg !151
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !127
  br i1 %8, label %33, label %9, !dbg !127

; <label>:9:                                      ; preds = %5, %30
  %10 = phi i64 [ %31, %30 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !90, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i64 0, metadata !92, metadata !DIExpression()), !dbg !152
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !122

; <label>:16:                                     ; preds = %16, %9
  %17 = phi i64 [ 0, %9 ], [ %28, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !92, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.value(metadata i64 %10, metadata !96, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !153
  %18 = and i64 %17, 1, !dbg !154
  call void @llvm.dbg.value(metadata i64 %18, metadata !99, metadata !DIExpression()), !dbg !155
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !156
  %20 = bitcast double* %19 to i64*, !dbg !156
  %21 = load i64, i64* %20, align 8, !dbg !156, !tbaa !67
  %22 = or i64 %18, %14, !dbg !157
  %23 = getelementptr inbounds double, double* %4, i64 %22, !dbg !158
  %24 = bitcast double* %23 to i64*, !dbg !159
  store i64 %21, i64* %24, align 8, !dbg !159, !tbaa !67
  %25 = mul nsw i64 %17, %1, !dbg !160
  %26 = getelementptr inbounds double, double* %15, i64 %25, !dbg !160
  %27 = bitcast double* %26 to i64*, !dbg !161
  store i64 %21, i64* %27, align 8, !dbg !161, !tbaa !67
  %28 = add nuw i64 %17, 1, !dbg !162
  call void @llvm.dbg.value(metadata i64 %28, metadata !92, metadata !DIExpression()), !dbg !152
  %29 = icmp eq i64 %28, %0, !dbg !163
  br i1 %29, label %30, label %16, !dbg !122, !llvm.loop !121

; <label>:30:                                     ; preds = %16
  %31 = add nuw i64 %10, 1, !dbg !164
  call void @llvm.dbg.value(metadata i64 %31, metadata !90, metadata !DIExpression()), !dbg !150
  %32 = icmp eq i64 %31, %1, !dbg !151
  br i1 %32, label %33, label %9, !dbg !127, !llvm.loop !126

; <label>:33:                                     ; preds = %30, %5
  ret void, !dbg !165
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
!7 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 140, type: !8, isLocal: false, isDefinition: true, scopeLine: 140, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 142, column: 5, scope: !7)
!11 = !DILocation(line: 145, column: 5, scope: !7)
!12 = !DILocation(line: 146, column: 5, scope: !7)
!13 = !DILocation(line: 147, column: 1, scope: !7)
!14 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 125, type: !15, isLocal: true, isDefinition: true, scopeLine: 126, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !26)
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
!27 = !DILocalVariable(name: "M", arg: 1, scope: !14, file: !1, line: 125, type: !17)
!28 = !DILocalVariable(name: "N", arg: 2, scope: !14, file: !1, line: 125, type: !17)
!29 = !DILocalVariable(name: "A", arg: 3, scope: !14, file: !1, line: 125, type: !20)
!30 = !DILocalVariable(name: "B", arg: 4, scope: !14, file: !1, line: 125, type: !20)
!31 = !DILocalVariable(name: "tmp", arg: 5, scope: !14, file: !1, line: 126, type: !25)
!32 = !DILocation(line: 125, column: 37, scope: !14)
!33 = !DILocation(line: 125, column: 47, scope: !14)
!34 = !DILocation(line: 125, column: 57, scope: !14)
!35 = !DILocation(line: 125, column: 73, scope: !14)
!36 = !DILocation(line: 126, column: 37, scope: !14)
!37 = !DILocation(line: 127, column: 11, scope: !38)
!38 = distinct !DILexicalBlock(scope: !14, file: !1, line: 127, column: 9)
!39 = !DILocation(line: 0, scope: !38)
!40 = !DILocation(line: 127, column: 9, scope: !14)
!41 = !DILocalVariable(name: "M", arg: 1, scope: !42, file: !1, line: 81, type: !17)
!42 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !15, isLocal: true, isDefinition: true, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !43)
!43 = !{!41, !44, !45, !46, !47, !48, !50}
!44 = !DILocalVariable(name: "N", arg: 2, scope: !42, file: !1, line: 81, type: !17)
!45 = !DILocalVariable(name: "A", arg: 3, scope: !42, file: !1, line: 81, type: !20)
!46 = !DILocalVariable(name: "B", arg: 4, scope: !42, file: !1, line: 81, type: !20)
!47 = !DILocalVariable(name: "tmp", arg: 5, scope: !42, file: !1, line: 82, type: !25)
!48 = !DILocalVariable(name: "i", scope: !49, file: !1, line: 86, type: !17)
!49 = distinct !DILexicalBlock(scope: !42, file: !1, line: 86, column: 5)
!50 = !DILocalVariable(name: "j", scope: !51, file: !1, line: 87, type: !17)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 87, column: 9)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 86, column: 36)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 86, column: 5)
!54 = !DILocation(line: 81, column: 32, scope: !42, inlinedAt: !55)
!55 = distinct !DILocation(line: 128, column: 9, scope: !38)
!56 = !DILocation(line: 81, column: 42, scope: !42, inlinedAt: !55)
!57 = !DILocation(line: 81, column: 52, scope: !42, inlinedAt: !55)
!58 = !DILocation(line: 81, column: 68, scope: !42, inlinedAt: !55)
!59 = !DILocation(line: 82, column: 32, scope: !42, inlinedAt: !55)
!60 = !DILocation(line: 86, column: 17, scope: !49, inlinedAt: !55)
!61 = !DILocation(line: 86, column: 5, scope: !49, inlinedAt: !55)
!62 = !DILocation(line: 87, column: 21, scope: !51, inlinedAt: !55)
!63 = !DILocation(line: 87, column: 9, scope: !51, inlinedAt: !55)
!64 = !DILocation(line: 88, column: 23, scope: !65, inlinedAt: !55)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 87, column: 40)
!66 = distinct !DILexicalBlock(scope: !51, file: !1, line: 87, column: 9)
!67 = !{!68, !68, i64 0}
!68 = !{!"double", !69, i64 0}
!69 = !{!"omnipotent char", !70, i64 0}
!70 = !{!"Simple C/C++ TBAA"}
!71 = !DILocation(line: 88, column: 13, scope: !65, inlinedAt: !55)
!72 = !DILocation(line: 88, column: 21, scope: !65, inlinedAt: !55)
!73 = !DILocation(line: 87, column: 36, scope: !66, inlinedAt: !55)
!74 = !DILocation(line: 87, column: 30, scope: !66, inlinedAt: !55)
!75 = distinct !{!75, !76, !77}
!76 = !DILocation(line: 87, column: 9, scope: !51)
!77 = !DILocation(line: 89, column: 9, scope: !51)
!78 = !DILocation(line: 86, column: 32, scope: !53, inlinedAt: !55)
!79 = !DILocation(line: 86, column: 26, scope: !53, inlinedAt: !55)
!80 = distinct !{!80, !81, !82}
!81 = !DILocation(line: 86, column: 5, scope: !49)
!82 = !DILocation(line: 90, column: 5, scope: !49)
!83 = !DILocalVariable(name: "M", arg: 1, scope: !84, file: !1, line: 101, type: !17)
!84 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !15, isLocal: true, isDefinition: true, scopeLine: 102, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !85)
!85 = !{!83, !86, !87, !88, !89, !90, !92, !96, !99}
!86 = !DILocalVariable(name: "N", arg: 2, scope: !84, file: !1, line: 101, type: !17)
!87 = !DILocalVariable(name: "A", arg: 3, scope: !84, file: !1, line: 101, type: !20)
!88 = !DILocalVariable(name: "B", arg: 4, scope: !84, file: !1, line: 101, type: !20)
!89 = !DILocalVariable(name: "tmp", arg: 5, scope: !84, file: !1, line: 102, type: !25)
!90 = !DILocalVariable(name: "i", scope: !91, file: !1, line: 106, type: !17)
!91 = distinct !DILexicalBlock(scope: !84, file: !1, line: 106, column: 5)
!92 = !DILocalVariable(name: "j", scope: !93, file: !1, line: 107, type: !17)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 107, column: 9)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 106, column: 36)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 106, column: 5)
!96 = !DILocalVariable(name: "di", scope: !97, file: !1, line: 108, type: !17)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 107, column: 40)
!98 = distinct !DILexicalBlock(scope: !93, file: !1, line: 107, column: 9)
!99 = !DILocalVariable(name: "dj", scope: !97, file: !1, line: 109, type: !17)
!100 = !DILocation(line: 101, column: 30, scope: !84, inlinedAt: !101)
!101 = distinct !DILocation(line: 130, column: 9, scope: !38)
!102 = !DILocation(line: 101, column: 40, scope: !84, inlinedAt: !101)
!103 = !DILocation(line: 101, column: 50, scope: !84, inlinedAt: !101)
!104 = !DILocation(line: 101, column: 66, scope: !84, inlinedAt: !101)
!105 = !DILocation(line: 102, column: 30, scope: !84, inlinedAt: !101)
!106 = !DILocation(line: 106, column: 17, scope: !91, inlinedAt: !101)
!107 = !DILocation(line: 106, column: 5, scope: !91, inlinedAt: !101)
!108 = !DILocation(line: 107, column: 21, scope: !93, inlinedAt: !101)
!109 = !DILocation(line: 107, column: 9, scope: !93, inlinedAt: !101)
!110 = !DILocation(line: 108, column: 20, scope: !97, inlinedAt: !101)
!111 = !DILocation(line: 109, column: 27, scope: !97, inlinedAt: !101)
!112 = !DILocation(line: 109, column: 20, scope: !97, inlinedAt: !101)
!113 = !DILocation(line: 110, column: 32, scope: !97, inlinedAt: !101)
!114 = !DILocation(line: 110, column: 24, scope: !97, inlinedAt: !101)
!115 = !DILocation(line: 110, column: 13, scope: !97, inlinedAt: !101)
!116 = !DILocation(line: 110, column: 30, scope: !97, inlinedAt: !101)
!117 = !DILocation(line: 111, column: 13, scope: !97, inlinedAt: !101)
!118 = !DILocation(line: 111, column: 21, scope: !97, inlinedAt: !101)
!119 = !DILocation(line: 107, column: 36, scope: !98, inlinedAt: !101)
!120 = !DILocation(line: 107, column: 30, scope: !98, inlinedAt: !101)
!121 = distinct !{!121, !122, !123}
!122 = !DILocation(line: 107, column: 9, scope: !93)
!123 = !DILocation(line: 112, column: 9, scope: !93)
!124 = !DILocation(line: 106, column: 32, scope: !95, inlinedAt: !101)
!125 = !DILocation(line: 106, column: 26, scope: !95, inlinedAt: !101)
!126 = distinct !{!126, !127, !128}
!127 = !DILocation(line: 106, column: 5, scope: !91)
!128 = !DILocation(line: 113, column: 5, scope: !91)
!129 = !DILocation(line: 131, column: 1, scope: !14)
!130 = !DILocation(line: 81, column: 32, scope: !42)
!131 = !DILocation(line: 81, column: 42, scope: !42)
!132 = !DILocation(line: 81, column: 52, scope: !42)
!133 = !DILocation(line: 81, column: 68, scope: !42)
!134 = !DILocation(line: 82, column: 32, scope: !42)
!135 = !DILocation(line: 86, column: 17, scope: !49)
!136 = !DILocation(line: 86, column: 26, scope: !53)
!137 = !DILocation(line: 87, column: 21, scope: !51)
!138 = !DILocation(line: 88, column: 23, scope: !65)
!139 = !DILocation(line: 88, column: 13, scope: !65)
!140 = !DILocation(line: 88, column: 21, scope: !65)
!141 = !DILocation(line: 87, column: 36, scope: !66)
!142 = !DILocation(line: 87, column: 30, scope: !66)
!143 = !DILocation(line: 86, column: 32, scope: !53)
!144 = !DILocation(line: 93, column: 1, scope: !42)
!145 = !DILocation(line: 101, column: 30, scope: !84)
!146 = !DILocation(line: 101, column: 40, scope: !84)
!147 = !DILocation(line: 101, column: 50, scope: !84)
!148 = !DILocation(line: 101, column: 66, scope: !84)
!149 = !DILocation(line: 102, column: 30, scope: !84)
!150 = !DILocation(line: 106, column: 17, scope: !91)
!151 = !DILocation(line: 106, column: 26, scope: !95)
!152 = !DILocation(line: 107, column: 21, scope: !93)
!153 = !DILocation(line: 108, column: 20, scope: !97)
!154 = !DILocation(line: 109, column: 27, scope: !97)
!155 = !DILocation(line: 109, column: 20, scope: !97)
!156 = !DILocation(line: 110, column: 32, scope: !97)
!157 = !DILocation(line: 110, column: 24, scope: !97)
!158 = !DILocation(line: 110, column: 13, scope: !97)
!159 = !DILocation(line: 110, column: 30, scope: !97)
!160 = !DILocation(line: 111, column: 13, scope: !97)
!161 = !DILocation(line: 111, column: 21, scope: !97)
!162 = !DILocation(line: 107, column: 36, scope: !98)
!163 = !DILocation(line: 107, column: 30, scope: !98)
!164 = !DILocation(line: 106, column: 32, scope: !95)
!165 = !DILocation(line: 116, column: 1, scope: !84)
