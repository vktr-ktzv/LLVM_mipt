; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ALIVE = dso_local local_unnamed_addr constant i8 1, align 1
@DEAD = dso_local local_unnamed_addr constant i8 0, align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @randNum(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (...) @simRand() #7
  %3 = srem i32 %2, %0
  ret i32 %3
}

declare i32 @simRand(...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @drawGrid(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %7
  %3 = phi i64 [ 0, %1 ], [ %8, %7 ]
  %4 = trunc i64 %3 to i32
  %5 = trunc i64 %3 to i32
  br label %10

6:                                                ; preds = %7
  tail call void (...) @simFlush() #7
  ret void

7:                                                ; preds = %18
  %8 = add nuw nsw i64 %3, 1
  %9 = icmp eq i64 %8, 256
  br i1 %9, label %6, label %2, !llvm.loop !5

10:                                               ; preds = %2, %18
  %11 = phi i64 [ 0, %2 ], [ %19, %18 ]
  %12 = getelementptr inbounds [256 x i8], ptr %0, i64 %11, i64 %3
  %13 = load i8, ptr %12, align 1, !tbaa !7, !range !11, !noundef !12
  %14 = icmp eq i8 %13, 0
  %15 = trunc i64 %11 to i32
  br i1 %14, label %17, label %16

16:                                               ; preds = %10
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %4, i32 noundef 65280) #7
  br label %18

17:                                               ; preds = %10
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %5, i32 noundef 0) #7
  br label %18

18:                                               ; preds = %16, %17
  %19 = add nuw nsw i64 %11, 1
  %20 = icmp eq i64 %19, 512
  br i1 %20, label %7, label %10, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

declare void @simFlush(...) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef signext i8 @updateCellState(i8 noundef signext %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = icmp eq i8 %0, 1
  %4 = add i32 %1, -4
  %5 = icmp ult i32 %4, -2
  %6 = and i1 %3, %5
  %7 = icmp eq i8 %0, 0
  %8 = icmp eq i32 %1, 3
  %9 = and i1 %7, %8
  %10 = select i1 %9, i8 1, i8 %0
  %11 = select i1 %6, i8 0, i8 %10
  ret i8 %11
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @countNeighbours(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = add nsw i32 %1, -1
  %5 = icmp ugt i32 %4, 511
  %6 = zext nneg i32 %4 to i64
  br i1 %5, label %34, label %7

7:                                                ; preds = %3
  %8 = add nsw i32 %2, -1
  %9 = icmp ult i32 %8, 256
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = zext nneg i32 %8 to i64
  %12 = getelementptr inbounds [256 x i8], ptr %0, i64 %6, i64 %11
  %13 = load i8, ptr %12, align 1, !tbaa !7, !range !11, !noundef !12
  %14 = zext nneg i8 %13 to i32
  br label %15

15:                                               ; preds = %10, %7
  %16 = phi i32 [ %14, %10 ], [ 0, %7 ]
  %17 = icmp ult i32 %2, 256
  br i1 %17, label %18, label %24

18:                                               ; preds = %15
  %19 = zext nneg i32 %2 to i64
  %20 = getelementptr inbounds [256 x i8], ptr %0, i64 %6, i64 %19
  %21 = load i8, ptr %20, align 1, !tbaa !7, !range !11, !noundef !12
  %22 = zext nneg i8 %21 to i32
  %23 = add nuw nsw i32 %16, %22
  br label %24

24:                                               ; preds = %18, %15
  %25 = phi i32 [ %23, %18 ], [ %16, %15 ]
  %26 = add nsw i32 %2, 1
  %27 = icmp ult i32 %26, 256
  br i1 %27, label %28, label %34

28:                                               ; preds = %24
  %29 = zext nneg i32 %26 to i64
  %30 = getelementptr inbounds [256 x i8], ptr %0, i64 %6, i64 %29
  %31 = load i8, ptr %30, align 1, !tbaa !7, !range !11, !noundef !12
  %32 = zext nneg i8 %31 to i32
  %33 = add nuw nsw i32 %25, %32
  br label %34

34:                                               ; preds = %3, %28, %24
  %35 = phi i32 [ %25, %24 ], [ %33, %28 ], [ 0, %3 ]
  %36 = icmp ugt i32 %1, 511
  %37 = zext nneg i32 %1 to i64
  br i1 %36, label %57, label %38

38:                                               ; preds = %34
  %39 = add nsw i32 %2, -1
  %40 = icmp ult i32 %39, 256
  br i1 %40, label %41, label %47

41:                                               ; preds = %38
  %42 = zext nneg i32 %39 to i64
  %43 = getelementptr inbounds [256 x i8], ptr %0, i64 %37, i64 %42
  %44 = load i8, ptr %43, align 1, !tbaa !7, !range !11, !noundef !12
  %45 = zext nneg i8 %44 to i32
  %46 = add nuw nsw i32 %35, %45
  br label %47

47:                                               ; preds = %38, %41
  %48 = phi i32 [ %46, %41 ], [ %35, %38 ]
  %49 = add nsw i32 %2, 1
  %50 = icmp ult i32 %49, 256
  br i1 %50, label %51, label %57

51:                                               ; preds = %47
  %52 = zext nneg i32 %49 to i64
  %53 = getelementptr inbounds [256 x i8], ptr %0, i64 %37, i64 %52
  %54 = load i8, ptr %53, align 1, !tbaa !7, !range !11, !noundef !12
  %55 = zext nneg i8 %54 to i32
  %56 = add nuw nsw i32 %48, %55
  br label %57

57:                                               ; preds = %34, %51, %47
  %58 = phi i32 [ %48, %47 ], [ %56, %51 ], [ %35, %34 ]
  %59 = add nsw i32 %1, 1
  %60 = icmp ugt i32 %59, 511
  %61 = zext nneg i32 %59 to i64
  br i1 %60, label %90, label %62

62:                                               ; preds = %57
  %63 = add nsw i32 %2, -1
  %64 = icmp ult i32 %63, 256
  br i1 %64, label %65, label %71

65:                                               ; preds = %62
  %66 = zext nneg i32 %63 to i64
  %67 = getelementptr inbounds [256 x i8], ptr %0, i64 %61, i64 %66
  %68 = load i8, ptr %67, align 1, !tbaa !7, !range !11, !noundef !12
  %69 = zext nneg i8 %68 to i32
  %70 = add nuw nsw i32 %58, %69
  br label %71

71:                                               ; preds = %65, %62
  %72 = phi i32 [ %70, %65 ], [ %58, %62 ]
  %73 = icmp ult i32 %2, 256
  br i1 %73, label %74, label %80

74:                                               ; preds = %71
  %75 = zext nneg i32 %2 to i64
  %76 = getelementptr inbounds [256 x i8], ptr %0, i64 %61, i64 %75
  %77 = load i8, ptr %76, align 1, !tbaa !7, !range !11, !noundef !12
  %78 = zext nneg i8 %77 to i32
  %79 = add nuw nsw i32 %72, %78
  br label %80

80:                                               ; preds = %74, %71
  %81 = phi i32 [ %79, %74 ], [ %72, %71 ]
  %82 = add nsw i32 %2, 1
  %83 = icmp ult i32 %82, 256
  br i1 %83, label %84, label %90

84:                                               ; preds = %80
  %85 = zext nneg i32 %82 to i64
  %86 = getelementptr inbounds [256 x i8], ptr %0, i64 %61, i64 %85
  %87 = load i8, ptr %86, align 1, !tbaa !7, !range !11, !noundef !12
  %88 = zext nneg i8 %87 to i32
  %89 = add nuw nsw i32 %81, %88
  br label %90

90:                                               ; preds = %57, %84, %80
  %91 = phi i32 [ %81, %80 ], [ %89, %84 ], [ %58, %57 ]
  ret i32 %91
}

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [512 x [256 x i8]], align 16
  %2 = tail call i64 @time(ptr noundef null) #7
  %3 = trunc i64 %2 to i32
  tail call void @srand(i32 noundef %3) #7
  call void @llvm.lifetime.start.p0(i64 131072, ptr nonnull %1) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(131072) %1, i8 0, i64 131072, i1 false), !tbaa !7
  %4 = tail call i32 (...) @simRand() #7
  %5 = srem i32 %4, 10000
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %18

7:                                                ; preds = %0, %7
  %8 = phi i32 [ %16, %7 ], [ 0, %0 ]
  %9 = tail call i32 (...) @simRand() #7
  %10 = srem i32 %9, 131072
  %11 = sdiv i32 %10, 256
  %12 = srem i32 %10, 256
  %13 = sext i32 %11 to i64
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds [512 x [256 x i8]], ptr %1, i64 0, i64 %13, i64 %14
  store i8 1, ptr %15, align 1, !tbaa !7
  %16 = add nuw nsw i32 %8, 1
  %17 = icmp eq i32 %16, %5
  br i1 %17, label %18, label %7, !llvm.loop !14

18:                                               ; preds = %7, %0
  br label %19

19:                                               ; preds = %18, %45
  %20 = phi i32 [ %46, %45 ], [ 0, %18 ]
  br label %22

21:                                               ; preds = %45
  call void @llvm.lifetime.end.p0(i64 131072, ptr nonnull %1) #7
  ret void

22:                                               ; preds = %19, %25
  %23 = phi i64 [ %26, %25 ], [ 0, %19 ]
  %24 = trunc i64 %23 to i32
  br label %28

25:                                               ; preds = %28
  %26 = add nuw nsw i64 %23, 1
  %27 = icmp eq i64 %26, 256
  br i1 %27, label %37, label %22, !llvm.loop !5

28:                                               ; preds = %28, %22
  %29 = phi i64 [ 0, %22 ], [ %35, %28 ]
  %30 = getelementptr inbounds [256 x i8], ptr %1, i64 %29, i64 %23
  %31 = load i8, ptr %30, align 1, !tbaa !7, !range !11, !noundef !12
  %32 = icmp eq i8 %31, 0
  %33 = trunc i64 %29 to i32
  %34 = select i1 %32, i32 0, i32 65280
  tail call void @simPutPixel(i32 noundef %33, i32 noundef %24, i32 noundef %34) #7
  %35 = add nuw nsw i64 %29, 1
  %36 = icmp eq i64 %35, 512
  br i1 %36, label %25, label %28, !llvm.loop !13

37:                                               ; preds = %25
  tail call void (...) @simFlush() #7
  br label %38

38:                                               ; preds = %37, %48
  %39 = phi i64 [ 0, %37 ], [ %43, %48 ]
  %40 = add nsw i64 %39, -1
  %41 = and i64 %40, 4294966784
  %42 = icmp eq i64 %41, 0
  %43 = add nuw nsw i64 %39, 1
  %44 = icmp eq i64 %39, 511
  br label %50

45:                                               ; preds = %48
  %46 = add nuw nsw i32 %20, 1
  %47 = icmp eq i32 %46, 1000
  br i1 %47, label %21, label %19, !llvm.loop !15

48:                                               ; preds = %129
  %49 = icmp eq i64 %43, 512
  br i1 %49, label %45, label %38, !llvm.loop !16

50:                                               ; preds = %38, %129
  %51 = phi i64 [ 0, %38 ], [ %142, %129 ]
  %52 = add nsw i64 %51, -1
  %53 = trunc i64 %52 to i32
  br i1 %42, label %54, label %77

54:                                               ; preds = %50
  %55 = icmp ult i32 %53, 256
  br i1 %55, label %60, label %56

56:                                               ; preds = %54
  %57 = getelementptr inbounds [256 x i8], ptr %1, i64 %40, i64 %51
  %58 = load i8, ptr %57, align 1, !tbaa !7, !range !11, !noundef !12
  %59 = zext nneg i8 %58 to i32
  br label %69

60:                                               ; preds = %54
  %61 = getelementptr inbounds [256 x i8], ptr %1, i64 %40, i64 %52
  %62 = load i8, ptr %61, align 1, !tbaa !7, !range !11, !noundef !12
  %63 = getelementptr inbounds [256 x i8], ptr %1, i64 %40, i64 %51
  %64 = load i8, ptr %63, align 1, !tbaa !7, !range !11, !noundef !12
  %65 = add nuw nsw i8 %64, %62
  %66 = zext nneg i8 %65 to i32
  %67 = icmp eq i64 %51, 255
  %68 = add nuw i64 %51, 1
  br i1 %67, label %91, label %69

69:                                               ; preds = %56, %60
  %70 = phi i64 [ 1, %56 ], [ %68, %60 ]
  %71 = phi i32 [ %59, %56 ], [ %66, %60 ]
  %72 = and i64 %70, 4294967295
  %73 = getelementptr inbounds [256 x i8], ptr %1, i64 %40, i64 %72
  %74 = load i8, ptr %73, align 1, !tbaa !7, !range !11, !noundef !12
  %75 = zext nneg i8 %74 to i32
  %76 = add nuw nsw i32 %71, %75
  br label %77

77:                                               ; preds = %50, %69
  %78 = phi i32 [ %76, %69 ], [ 0, %50 ]
  %79 = icmp ult i32 %53, 256
  br i1 %79, label %80, label %87

80:                                               ; preds = %77
  %81 = getelementptr inbounds [256 x i8], ptr %1, i64 %39, i64 %52
  %82 = load i8, ptr %81, align 1, !tbaa !7, !range !11, !noundef !12
  %83 = zext nneg i8 %82 to i32
  %84 = add nuw nsw i32 %78, %83
  %85 = icmp eq i64 %51, 255
  %86 = add nuw i64 %51, 1
  br i1 %85, label %100, label %87

87:                                               ; preds = %77, %80
  %88 = phi i64 [ %86, %80 ], [ 1, %77 ]
  %89 = phi i32 [ %84, %80 ], [ %78, %77 ]
  %90 = and i64 %88, 4294967295
  br label %91

91:                                               ; preds = %60, %87
  %92 = phi i64 [ %90, %87 ], [ %52, %60 ]
  %93 = phi i32 [ %89, %87 ], [ %66, %60 ]
  %94 = phi i1 [ %79, %87 ], [ true, %60 ]
  %95 = phi i64 [ %52, %87 ], [ 254, %60 ]
  %96 = getelementptr inbounds [256 x i8], ptr %1, i64 %39, i64 %92
  %97 = load i8, ptr %96, align 1, !tbaa !7, !range !11, !noundef !12
  %98 = zext nneg i8 %97 to i32
  %99 = add nuw nsw i32 %93, %98
  br label %100

100:                                              ; preds = %91, %80
  %101 = phi i1 [ true, %80 ], [ %94, %91 ]
  %102 = phi i64 [ %52, %80 ], [ %95, %91 ]
  %103 = phi i32 [ %84, %80 ], [ %99, %91 ]
  br i1 %44, label %129, label %104

104:                                              ; preds = %100
  br i1 %101, label %110, label %105

105:                                              ; preds = %104
  %106 = getelementptr inbounds [256 x i8], ptr %1, i64 %43, i64 %51
  %107 = load i8, ptr %106, align 1, !tbaa !7, !range !11, !noundef !12
  %108 = zext nneg i8 %107 to i32
  %109 = add nuw nsw i32 %103, %108
  br label %121

110:                                              ; preds = %104
  %111 = getelementptr inbounds [256 x i8], ptr %1, i64 %43, i64 %102
  %112 = load i8, ptr %111, align 1, !tbaa !7, !range !11, !noundef !12
  %113 = zext nneg i8 %112 to i32
  %114 = add nuw nsw i32 %103, %113
  %115 = getelementptr inbounds [256 x i8], ptr %1, i64 %43, i64 %51
  %116 = load i8, ptr %115, align 1, !tbaa !7, !range !11, !noundef !12
  %117 = zext nneg i8 %116 to i32
  %118 = add nuw nsw i32 %114, %117
  %119 = icmp eq i64 %51, 255
  %120 = add nuw i64 %51, 1
  br i1 %119, label %129, label %121

121:                                              ; preds = %105, %110
  %122 = phi i64 [ 1, %105 ], [ %120, %110 ]
  %123 = phi i32 [ %109, %105 ], [ %118, %110 ]
  %124 = and i64 %122, 4294967295
  %125 = getelementptr inbounds [256 x i8], ptr %1, i64 %43, i64 %124
  %126 = load i8, ptr %125, align 1, !tbaa !7, !range !11, !noundef !12
  %127 = zext nneg i8 %126 to i32
  %128 = add nuw nsw i32 %123, %127
  br label %129

129:                                              ; preds = %100, %110, %121
  %130 = phi i32 [ %118, %110 ], [ %128, %121 ], [ %103, %100 ]
  %131 = getelementptr inbounds [512 x [256 x i8]], ptr %1, i64 0, i64 %39, i64 %51
  %132 = load i8, ptr %131, align 1, !tbaa !7, !range !11, !noundef !12
  %133 = icmp eq i8 %132, 0
  %134 = and i32 %130, -2
  %135 = icmp eq i32 %134, 2
  %136 = or i1 %133, %135
  %137 = icmp eq i32 %130, 3
  %138 = icmp ne i8 %132, 0
  %139 = or i1 %137, %138
  %140 = select i1 %136, i1 %139, i1 false
  %141 = zext i1 %140 to i8
  store i8 %141, ptr %131, align 1, !tbaa !7
  %142 = add nuw nsw i64 %51, 1
  %143 = icmp eq i64 %142, 256
  br i1 %143, label %48, label %50, !llvm.loop !17
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @time(ptr noundef) local_unnamed_addr #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"_Bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
