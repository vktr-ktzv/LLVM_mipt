; ModuleID = '../SDL/app.c'
source_filename = "../SDL/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ALIVE = dso_local local_unnamed_addr constant i32 1, align 4
@DEAD = dso_local local_unnamed_addr constant i32 0, align 4

; Function Attrs: nounwind uwtable
define dso_local i32 @randNum(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (...) @simRand() #5
  %3 = srem i32 %2, %0
  ret i32 %3
}

declare i32 @simRand(...) local_unnamed_addr #1

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
  tail call void (...) @simFlush() #5
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
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %6, i32 noundef 65280) #5
  br label %20

19:                                               ; preds = %11
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %5, i32 noundef 0) #5
  br label %20

20:                                               ; preds = %18, %19
  %21 = add nuw nsw i64 %12, 1
  %22 = icmp eq i64 %21, 512
  br i1 %22, label %8, label %11, !llvm.loop !11
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

declare void @simFlush(...) local_unnamed_addr #1

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
  %2 = tail call i32 (...) @simRand() #5
  %3 = bitcast [131072 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %3) #5
  br label %4

4:                                                ; preds = %0, %10
  %5 = phi i64 [ 0, %0 ], [ %11, %10 ]
  br label %13

6:                                                ; preds = %10
  %7 = tail call i32 (...) @simRand() #5
  %8 = srem i32 %7, 10000
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %34, label %32

10:                                               ; preds = %13
  %11 = add nuw nsw i64 %5, 1
  %12 = icmp eq i64 %11, 512
  br i1 %12, label %6, label %4, !llvm.loop !12

13:                                               ; preds = %13, %4
  %14 = phi i64 [ 0, %4 ], [ %30, %13 ]
  %15 = shl nuw nsw i64 %14, 9
  %16 = add nuw nsw i64 %15, %5
  %17 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %16
  store i32 0, i32* %17, align 4, !tbaa !7
  %18 = shl i64 %14, 9
  %19 = or i64 %18, 512
  %20 = add nuw nsw i64 %19, %5
  %21 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %20
  store i32 0, i32* %21, align 4, !tbaa !7
  %22 = shl i64 %14, 9
  %23 = or i64 %22, 1024
  %24 = add nuw nsw i64 %23, %5
  %25 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %24
  store i32 0, i32* %25, align 4, !tbaa !7
  %26 = shl i64 %14, 9
  %27 = or i64 %26, 1536
  %28 = add nuw nsw i64 %27, %5
  %29 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %28
  store i32 0, i32* %29, align 4, !tbaa !7
  %30 = add nuw nsw i64 %14, 4
  %31 = icmp eq i64 %30, 256
  br i1 %31, label %10, label %13, !llvm.loop !13

32:                                               ; preds = %34, %6
  %33 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 0
  br label %47

34:                                               ; preds = %6, %34
  %35 = phi i32 [ %44, %34 ], [ 0, %6 ]
  %36 = tail call i32 (...) @simRand() #5
  %37 = srem i32 %36, 131072
  %38 = sdiv i32 %37, 256
  %39 = srem i32 %37, 256
  %40 = shl nsw i32 %39, 9
  %41 = add nsw i32 %40, %38
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %42
  store i32 1, i32* %43, align 4, !tbaa !7
  %44 = add nuw nsw i32 %35, 1
  %45 = icmp eq i32 %44, %8
  br i1 %45, label %32, label %34, !llvm.loop !14

46:                                               ; preds = %70
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %3) #5
  ret void

47:                                               ; preds = %32, %70
  %48 = phi i32 [ 0, %32 ], [ %71, %70 ]
  br label %49

49:                                               ; preds = %53, %47
  %50 = phi i64 [ 0, %47 ], [ %54, %53 ]
  %51 = shl nsw i64 %50, 9
  %52 = trunc i64 %50 to i32
  br label %56

53:                                               ; preds = %56
  %54 = add nuw nsw i64 %50, 1
  %55 = icmp eq i64 %54, 256
  br i1 %55, label %66, label %49, !llvm.loop !5

56:                                               ; preds = %56, %49
  %57 = phi i64 [ 0, %49 ], [ %64, %56 ]
  %58 = add nuw nsw i64 %57, %51
  %59 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %58
  %60 = load i32, i32* %59, align 4, !tbaa !7
  %61 = icmp eq i32 %60, 1
  %62 = trunc i64 %57 to i32
  %63 = select i1 %61, i32 65280, i32 0
  tail call void @simPutPixel(i32 noundef %62, i32 noundef %52, i32 noundef %63) #5
  %64 = add nuw nsw i64 %57, 1
  %65 = icmp eq i64 %64, 512
  br i1 %65, label %53, label %56, !llvm.loop !11

66:                                               ; preds = %53
  tail call void (...) @simFlush() #5
  br label %67

67:                                               ; preds = %66, %73
  %68 = phi i64 [ 0, %66 ], [ %74, %73 ]
  %69 = trunc i64 %68 to i32
  br label %76

70:                                               ; preds = %73
  %71 = add nuw nsw i32 %48, 1
  %72 = icmp eq i32 %71, 1000
  br i1 %72, label %46, label %47, !llvm.loop !15

73:                                               ; preds = %76
  %74 = add nuw nsw i64 %68, 1
  %75 = icmp eq i64 %74, 512
  br i1 %75, label %70, label %67, !llvm.loop !16

76:                                               ; preds = %67, %76
  %77 = phi i64 [ 0, %67 ], [ %96, %76 ]
  %78 = trunc i64 %77 to i32
  %79 = call i32 @countNeighbours(i32* noundef nonnull %33, i32 noundef %69, i32 noundef %78)
  %80 = shl nuw nsw i64 %77, 9
  %81 = add nuw nsw i64 %80, %68
  %82 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %81
  %83 = load i32, i32* %82, align 4, !tbaa !7
  %84 = trunc i32 %83 to i8
  %85 = icmp eq i8 %84, 1
  %86 = add i32 %79, -4
  %87 = icmp ult i32 %86, -2
  %88 = and i1 %87, %85
  %89 = icmp eq i8 %84, 0
  %90 = icmp eq i32 %79, 3
  %91 = and i1 %90, %89
  %92 = shl i32 %83, 24
  %93 = ashr exact i32 %92, 24
  %94 = select i1 %91, i32 1, i32 %93
  %95 = select i1 %88, i32 0, i32 %94
  store i32 %95, i32* %82, align 4, !tbaa !7
  %96 = add nuw nsw i64 %77, 1
  %97 = icmp eq i64 %96, 256
  br i1 %97, label %73, label %76, !llvm.loop !17
}

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
