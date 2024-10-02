; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
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
define dso_local void @drawGrid(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %9
  %3 = phi i64 [ 0, %1 ], [ %10, %9 ]
  %4 = shl nuw nsw i64 %3, 9
  %5 = getelementptr i32, ptr %0, i64 %4
  %6 = trunc i64 %3 to i32
  %7 = trunc i64 %3 to i32
  br label %12

8:                                                ; preds = %9
  tail call void (...) @simFlush() #5
  ret void

9:                                                ; preds = %20
  %10 = add nuw nsw i64 %3, 1
  %11 = icmp eq i64 %10, 256
  br i1 %11, label %8, label %2, !llvm.loop !5

12:                                               ; preds = %2, %20
  %13 = phi i64 [ 0, %2 ], [ %21, %20 ]
  %14 = getelementptr i32, ptr %5, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !7
  %16 = icmp eq i32 %15, 1
  %17 = trunc i64 %13 to i32
  br i1 %16, label %18, label %19

18:                                               ; preds = %12
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %7, i32 noundef 65280) #5
  br label %20

19:                                               ; preds = %12
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %6, i32 noundef 0) #5
  br label %20

20:                                               ; preds = %18, %19
  %21 = add nuw nsw i64 %13, 1
  %22 = icmp eq i64 %21, 512
  br i1 %22, label %9, label %12, !llvm.loop !11
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
  br i1 %5, label %42, label %6

6:                                                ; preds = %3
  %7 = add nsw i32 %2, -1
  %8 = icmp ult i32 %7, 256
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = shl nuw nsw i32 %7, 9
  %11 = or disjoint i32 %10, %4
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !7
  %15 = icmp eq i32 %14, 1
  %16 = zext i1 %15 to i32
  br label %17

17:                                               ; preds = %9, %6
  %18 = phi i32 [ %16, %9 ], [ 0, %6 ]
  %19 = icmp ult i32 %2, 256
  br i1 %19, label %20, label %29

20:                                               ; preds = %17
  %21 = shl nuw nsw i32 %2, 9
  %22 = or disjoint i32 %21, %4
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds i32, ptr %0, i64 %23
  %25 = load i32, ptr %24, align 4, !tbaa !7
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
  %35 = or disjoint i32 %34, %4
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %0, i64 %36
  %38 = load i32, ptr %37, align 4, !tbaa !7
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
  %50 = or disjoint i32 %49, %1
  %51 = zext nneg i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %0, i64 %51
  %53 = load i32, ptr %52, align 4, !tbaa !7
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
  %63 = or disjoint i32 %62, %1
  %64 = zext nneg i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %0, i64 %64
  %66 = load i32, ptr %65, align 4, !tbaa !7
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
  %79 = or disjoint i32 %78, %72
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr inbounds i32, ptr %0, i64 %80
  %82 = load i32, ptr %81, align 4, !tbaa !7
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
  %91 = or disjoint i32 %90, %72
  %92 = zext nneg i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %0, i64 %92
  %94 = load i32, ptr %93, align 4, !tbaa !7
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
  %104 = or disjoint i32 %103, %72
  %105 = zext nneg i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %0, i64 %105
  %107 = load i32, ptr %106, align 4, !tbaa !7
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
  call void @llvm.lifetime.start.p0(i64 524288, ptr nonnull %1) #5
  br label %3

3:                                                ; preds = %0, %9
  %4 = phi i64 [ 0, %0 ], [ %10, %9 ]
  br label %12

5:                                                ; preds = %9
  %6 = tail call i32 (...) @simRand() #5
  %7 = srem i32 %6, 10000
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %31, label %43

9:                                                ; preds = %12
  %10 = add nuw nsw i64 %4, 1
  %11 = icmp eq i64 %10, 512
  br i1 %11, label %5, label %3, !llvm.loop !12

12:                                               ; preds = %12, %3
  %13 = phi i64 [ 0, %3 ], [ %29, %12 ]
  %14 = shl nuw nsw i64 %13, 9
  %15 = add nuw nsw i64 %14, %4
  %16 = getelementptr inbounds [131072 x i32], ptr %1, i64 0, i64 %15
  store i32 0, ptr %16, align 4, !tbaa !7
  %17 = shl i64 %13, 9
  %18 = or disjoint i64 %17, 512
  %19 = add nuw nsw i64 %18, %4
  %20 = getelementptr inbounds [131072 x i32], ptr %1, i64 0, i64 %19
  store i32 0, ptr %20, align 4, !tbaa !7
  %21 = shl i64 %13, 9
  %22 = or disjoint i64 %21, 1024
  %23 = add nuw nsw i64 %22, %4
  %24 = getelementptr inbounds [131072 x i32], ptr %1, i64 0, i64 %23
  store i32 0, ptr %24, align 4, !tbaa !7
  %25 = shl i64 %13, 9
  %26 = or disjoint i64 %25, 1536
  %27 = add nuw nsw i64 %26, %4
  %28 = getelementptr inbounds [131072 x i32], ptr %1, i64 0, i64 %27
  store i32 0, ptr %28, align 4, !tbaa !7
  %29 = add nuw nsw i64 %13, 4
  %30 = icmp eq i64 %29, 256
  br i1 %30, label %9, label %12, !llvm.loop !13

31:                                               ; preds = %5, %31
  %32 = phi i32 [ %41, %31 ], [ 0, %5 ]
  %33 = tail call i32 (...) @simRand() #5
  %34 = srem i32 %33, 131072
  %35 = sdiv i32 %34, 256
  %36 = srem i32 %34, 256
  %37 = shl nsw i32 %36, 9
  %38 = add nsw i32 %37, %35
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [131072 x i32], ptr %1, i64 0, i64 %39
  store i32 1, ptr %40, align 4, !tbaa !7
  %41 = add nuw nsw i32 %32, 1
  %42 = icmp eq i32 %41, %7
  br i1 %42, label %43, label %31, !llvm.loop !14

43:                                               ; preds = %31, %5
  br label %44

44:                                               ; preds = %43, %68
  %45 = phi i32 [ %69, %68 ], [ 0, %43 ]
  br label %47

46:                                               ; preds = %68
  call void @llvm.lifetime.end.p0(i64 524288, ptr nonnull %1) #5
  ret void

47:                                               ; preds = %44, %52
  %48 = phi i64 [ %53, %52 ], [ 0, %44 ]
  %49 = shl nuw nsw i64 %48, 9
  %50 = getelementptr i32, ptr %1, i64 %49
  %51 = trunc i64 %48 to i32
  br label %55

52:                                               ; preds = %55
  %53 = add nuw nsw i64 %48, 1
  %54 = icmp eq i64 %53, 256
  br i1 %54, label %64, label %47, !llvm.loop !5

55:                                               ; preds = %55, %47
  %56 = phi i64 [ 0, %47 ], [ %62, %55 ]
  %57 = getelementptr i32, ptr %50, i64 %56
  %58 = load i32, ptr %57, align 4, !tbaa !7
  %59 = icmp eq i32 %58, 1
  %60 = trunc i64 %56 to i32
  %61 = select i1 %59, i32 65280, i32 0
  tail call void @simPutPixel(i32 noundef %60, i32 noundef %51, i32 noundef %61) #5
  %62 = add nuw nsw i64 %56, 1
  %63 = icmp eq i64 %62, 512
  br i1 %63, label %52, label %55, !llvm.loop !11

64:                                               ; preds = %52
  tail call void (...) @simFlush() #5
  br label %65

65:                                               ; preds = %64, %71
  %66 = phi i64 [ 0, %64 ], [ %72, %71 ]
  %67 = trunc i64 %66 to i32
  br label %74

68:                                               ; preds = %71
  %69 = add nuw nsw i32 %45, 1
  %70 = icmp eq i32 %69, 1000
  br i1 %70, label %46, label %44, !llvm.loop !15

71:                                               ; preds = %74
  %72 = add nuw nsw i64 %66, 1
  %73 = icmp eq i64 %72, 512
  br i1 %73, label %68, label %65, !llvm.loop !16

74:                                               ; preds = %65, %74
  %75 = phi i64 [ 0, %65 ], [ %94, %74 ]
  %76 = trunc i64 %75 to i32
  %77 = call i32 @countNeighbours(ptr noundef nonnull %1, i32 noundef %67, i32 noundef %76)
  %78 = shl nuw nsw i64 %75, 9
  %79 = add nuw nsw i64 %78, %66
  %80 = getelementptr inbounds [131072 x i32], ptr %1, i64 0, i64 %79
  %81 = load i32, ptr %80, align 4, !tbaa !7
  %82 = trunc i32 %81 to i8
  %83 = icmp eq i8 %82, 1
  %84 = add i32 %77, -4
  %85 = icmp ult i32 %84, -2
  %86 = and i1 %85, %83
  %87 = icmp eq i8 %82, 0
  %88 = icmp eq i32 %77, 3
  %89 = and i1 %88, %87
  %90 = shl i32 %81, 24
  %91 = ashr exact i32 %90, 24
  %92 = select i1 %89, i32 1, i32 %91
  %93 = select i1 %86, i32 0, i32 %92
  store i32 %93, ptr %80, align 4, !tbaa !7
  %94 = add nuw nsw i64 %75, 1
  %95 = icmp eq i64 %94, 256
  br i1 %95, label %71, label %74, !llvm.loop !17
}

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
