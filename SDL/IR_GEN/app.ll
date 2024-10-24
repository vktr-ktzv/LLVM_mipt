; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ALIVE = dso_local local_unnamed_addr constant i32 1, align 4
@DEAD = dso_local local_unnamed_addr constant i32 0, align 4

; Function Attrs: nounwind uwtable
define dso_local void @drawGrid(i32* nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %8
  %3 = phi i64 [ 0, %1 ], [ %9, %8 ]
  %4 = shl nsw i64 %3, 9
  %5 = trunc i64 %3 to i32
  %6 = trunc i64 %3 to i32
  br label %11

7:                                                ; preds = %8
  tail call void (...) @simFlush() #6
  ret void

8:                                                ; preds = %20
  %9 = add nuw nsw i64 %3, 1
  %10 = icmp eq i64 %9, 256
  br i1 %10, label %7, label %2, !llvm.loop !5

11:                                               ; preds = %2, %20
  %12 = phi i64 [ 0, %2 ], [ %21, %20 ]
  %13 = add nuw nsw i64 %12, %4
  %14 = getelementptr inbounds i32, i32* %0, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !7
  %16 = icmp eq i32 %15, 1
  %17 = trunc i64 %12 to i32
  br i1 %16, label %18, label %19

18:                                               ; preds = %11
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %6, i32 noundef 65280) #6
  br label %20

19:                                               ; preds = %11
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %5, i32 noundef 0) #6
  br label %20

20:                                               ; preds = %18, %19
  %21 = add nuw nsw i64 %12, 1
  %22 = icmp eq i64 %21, 512
  br i1 %22, label %8, label %11, !llvm.loop !11
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare void @simFlush(...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local signext i8 @updateCellState(i8 noundef signext %0, i32 noundef %1) local_unnamed_addr #3 {
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

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i32 @countNeighbours(i32* nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = add nsw i32 %1, -1
  %5 = icmp ugt i32 %4, 511
  br i1 %5, label %42, label %6

6:                                                ; preds = %3
  %7 = add nsw i32 %2, -1
  %8 = icmp ult i32 %7, 256
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = shl nuw nsw i32 %7, 9
  %11 = add nuw nsw i32 %10, %4
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !7
  %15 = icmp eq i32 %14, 1
  %16 = zext i1 %15 to i32
  br label %17

17:                                               ; preds = %9, %6
  %18 = phi i32 [ %16, %9 ], [ 0, %6 ]
  %19 = icmp ult i32 %2, 256
  br i1 %19, label %20, label %29

20:                                               ; preds = %17
  %21 = shl nuw nsw i32 %2, 9
  %22 = add nuw nsw i32 %21, %4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32* %0, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !7
  %26 = icmp eq i32 %25, 1
  %27 = zext i1 %26 to i32
  %28 = add nuw nsw i32 %18, %27
  br label %29

29:                                               ; preds = %20, %17
  %30 = phi i32 [ %28, %20 ], [ %18, %17 ]
  %31 = add nsw i32 %2, 1
  %32 = icmp ult i32 %31, 256
  br i1 %32, label %33, label %42

33:                                               ; preds = %29
  %34 = shl nuw nsw i32 %31, 9
  %35 = add nuw nsw i32 %34, %4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32* %0, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !7
  %39 = icmp eq i32 %38, 1
  %40 = zext i1 %39 to i32
  %41 = add nuw nsw i32 %30, %40
  br label %42

42:                                               ; preds = %3, %33, %29
  %43 = phi i32 [ %30, %29 ], [ %41, %33 ], [ 0, %3 ]
  %44 = icmp ugt i32 %1, 511
  br i1 %44, label %70, label %45

45:                                               ; preds = %42
  %46 = add nsw i32 %2, -1
  %47 = icmp ult i32 %46, 256
  br i1 %47, label %48, label %57

48:                                               ; preds = %45
  %49 = shl nuw nsw i32 %46, 9
  %50 = add nuw nsw i32 %49, %1
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32* %0, i64 %51
  %53 = load i32, i32* %52, align 4, !tbaa !7
  %54 = icmp eq i32 %53, 1
  %55 = zext i1 %54 to i32
  %56 = add nuw nsw i32 %43, %55
  br label %57

57:                                               ; preds = %45, %48
  %58 = phi i32 [ %56, %48 ], [ %43, %45 ]
  %59 = add nsw i32 %2, 1
  %60 = icmp ult i32 %59, 256
  br i1 %60, label %61, label %70

61:                                               ; preds = %57
  %62 = shl nuw nsw i32 %59, 9
  %63 = add nuw nsw i32 %62, %1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32* %0, i64 %64
  %66 = load i32, i32* %65, align 4, !tbaa !7
  %67 = icmp eq i32 %66, 1
  %68 = zext i1 %67 to i32
  %69 = add nuw nsw i32 %58, %68
  br label %70

70:                                               ; preds = %42, %61, %57
  %71 = phi i32 [ %58, %57 ], [ %69, %61 ], [ %43, %42 ]
  %72 = add nsw i32 %1, 1
  %73 = icmp ugt i32 %72, 511
  br i1 %73, label %111, label %74

74:                                               ; preds = %70
  %75 = add nsw i32 %2, -1
  %76 = icmp ult i32 %75, 256
  br i1 %76, label %77, label %86

77:                                               ; preds = %74
  %78 = shl nuw nsw i32 %75, 9
  %79 = add nuw nsw i32 %78, %72
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %0, i64 %80
  %82 = load i32, i32* %81, align 4, !tbaa !7
  %83 = icmp eq i32 %82, 1
  %84 = zext i1 %83 to i32
  %85 = add nuw nsw i32 %71, %84
  br label %86

86:                                               ; preds = %77, %74
  %87 = phi i32 [ %85, %77 ], [ %71, %74 ]
  %88 = icmp ult i32 %2, 256
  br i1 %88, label %89, label %98

89:                                               ; preds = %86
  %90 = shl nuw nsw i32 %2, 9
  %91 = add nuw nsw i32 %90, %72
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %0, i64 %92
  %94 = load i32, i32* %93, align 4, !tbaa !7
  %95 = icmp eq i32 %94, 1
  %96 = zext i1 %95 to i32
  %97 = add nuw nsw i32 %87, %96
  br label %98

98:                                               ; preds = %89, %86
  %99 = phi i32 [ %97, %89 ], [ %87, %86 ]
  %100 = add nsw i32 %2, 1
  %101 = icmp ult i32 %100, 256
  br i1 %101, label %102, label %111

102:                                              ; preds = %98
  %103 = shl nuw nsw i32 %100, 9
  %104 = add nuw nsw i32 %103, %72
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %0, i64 %105
  %107 = load i32, i32* %106, align 4, !tbaa !7
  %108 = icmp eq i32 %107, 1
  %109 = zext i1 %108 to i32
  %110 = add nuw nsw i32 %99, %109
  br label %111

111:                                              ; preds = %70, %102, %98
  %112 = phi i32 [ %99, %98 ], [ %110, %102 ], [ %71, %70 ]
  ret i32 %112
}

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [131072 x i32], align 16
  %2 = bitcast [131072 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %2) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(524288) %2, i8 0, i64 524288, i1 false)
  %3 = tail call i32 (...) @simRand() #6
  %4 = srem i32 %3, 10000
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %8, %0
  %7 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 0
  br label %21

8:                                                ; preds = %0, %8
  %9 = phi i32 [ %18, %8 ], [ 0, %0 ]
  %10 = tail call i32 (...) @simRand() #6
  %11 = srem i32 %10, 131072
  %12 = sdiv i32 %11, 256
  %13 = srem i32 %11, 256
  %14 = shl nsw i32 %13, 9
  %15 = add nsw i32 %14, %12
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %16
  store i32 1, i32* %17, align 4, !tbaa !7
  %18 = add nuw nsw i32 %9, 1
  %19 = icmp eq i32 %18, %4
  br i1 %19, label %6, label %8, !llvm.loop !12

20:                                               ; preds = %44
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %2) #6
  ret void

21:                                               ; preds = %6, %44
  %22 = phi i32 [ 0, %6 ], [ %45, %44 ]
  br label %23

23:                                               ; preds = %27, %21
  %24 = phi i64 [ 0, %21 ], [ %28, %27 ]
  %25 = shl nsw i64 %24, 9
  %26 = trunc i64 %24 to i32
  br label %30

27:                                               ; preds = %30
  %28 = add nuw nsw i64 %24, 1
  %29 = icmp eq i64 %28, 256
  br i1 %29, label %40, label %23, !llvm.loop !5

30:                                               ; preds = %30, %23
  %31 = phi i64 [ 0, %23 ], [ %38, %30 ]
  %32 = add nuw nsw i64 %31, %25
  %33 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !7
  %35 = icmp eq i32 %34, 1
  %36 = trunc i64 %31 to i32
  %37 = select i1 %35, i32 65280, i32 0
  tail call void @simPutPixel(i32 noundef %36, i32 noundef %26, i32 noundef %37) #6
  %38 = add nuw nsw i64 %31, 1
  %39 = icmp eq i64 %38, 512
  br i1 %39, label %27, label %30, !llvm.loop !11

40:                                               ; preds = %27
  tail call void (...) @simFlush() #6
  br label %41

41:                                               ; preds = %40, %47
  %42 = phi i64 [ 0, %40 ], [ %48, %47 ]
  %43 = trunc i64 %42 to i32
  br label %50

44:                                               ; preds = %47
  %45 = add nuw nsw i32 %22, 1
  %46 = icmp eq i32 %45, 1000
  br i1 %46, label %20, label %21, !llvm.loop !13

47:                                               ; preds = %50
  %48 = add nuw nsw i64 %42, 1
  %49 = icmp eq i64 %48, 512
  br i1 %49, label %44, label %41, !llvm.loop !14

50:                                               ; preds = %41, %50
  %51 = phi i64 [ 0, %41 ], [ %70, %50 ]
  %52 = trunc i64 %51 to i32
  %53 = call i32 @countNeighbours(i32* noundef nonnull %7, i32 noundef %43, i32 noundef %52)
  %54 = shl nuw nsw i64 %51, 9
  %55 = add nuw nsw i64 %54, %42
  %56 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !7
  %58 = trunc i32 %57 to i8
  %59 = icmp eq i8 %58, 1
  %60 = add i32 %53, -4
  %61 = icmp ult i32 %60, -2
  %62 = and i1 %61, %59
  %63 = icmp eq i8 %58, 0
  %64 = icmp eq i32 %53, 3
  %65 = and i1 %64, %63
  %66 = shl i32 %57, 24
  %67 = ashr exact i32 %66, 24
  %68 = select i1 %65, i32 1, i32 %67
  %69 = select i1 %62, i32 0, i32 %68
  store i32 %69, i32* %56, align 4, !tbaa !7
  %70 = add nuw nsw i64 %51, 1
  %71 = icmp eq i64 %70, 256
  br i1 %71, label %47, label %50, !llvm.loop !15
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i32 @simRand(...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.6"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
