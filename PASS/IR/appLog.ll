; ModuleID = 'IR/app.ll'
source_filename = "../SDL/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ALIVE = dso_local local_unnamed_addr constant i32 1, align 4
@DEAD = dso_local local_unnamed_addr constant i32 0, align 4
@0 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@1 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@2 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@3 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@4 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@5 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@6 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@7 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@8 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@9 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@10 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@11 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@12 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@13 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@14 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@15 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@16 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@17 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@18 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@19 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@20 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@21 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@22 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@23 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@24 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@25 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@26 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@27 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@28 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@29 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@30 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@31 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@32 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@33 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@34 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@35 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@36 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@37 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@38 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@39 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@40 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@41 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@42 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@43 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@44 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@45 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@46 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@47 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@48 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@49 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@50 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@51 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@52 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@53 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@54 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@55 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@56 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@57 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@58 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@59 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@60 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@61 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@62 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@63 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@64 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@65 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@66 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@67 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@68 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@69 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@70 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@71 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@72 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@73 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@74 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@75 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@76 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@77 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@78 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@79 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@80 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@81 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@82 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@83 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@84 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@85 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@86 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@87 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@88 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@89 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@90 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@91 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@92 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@93 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@94 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@95 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@96 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@97 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@98 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@99 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@100 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@101 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@102 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@103 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@104 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@105 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@106 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@107 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@108 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@109 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@110 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@111 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@112 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@113 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@114 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@115 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@116 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@117 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@118 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@119 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@120 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@121 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@122 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@123 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@124 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@125 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@126 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@127 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@128 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@129 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@130 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@131 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@132 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@133 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@134 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@135 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@136 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@137 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@138 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@139 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@140 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@141 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@142 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@143 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@144 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@145 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@146 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@147 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@148 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@149 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@150 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@151 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@152 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@153 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@154 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@155 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@156 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@157 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@158 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@159 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@160 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@161 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@162 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@163 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@164 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@165 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@166 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@167 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@168 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@169 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@170 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@171 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@172 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@173 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@174 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@175 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@176 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@177 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@178 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@179 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@180 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@181 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@182 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@183 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@184 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@185 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@186 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@187 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@188 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@189 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@190 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@191 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@192 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@193 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@194 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@195 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@196 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@197 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@198 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@199 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@200 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@201 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@202 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@203 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@204 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@205 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@206 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@207 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@208 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@209 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@210 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@211 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@212 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@213 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@214 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@215 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@216 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@217 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@218 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@219 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@220 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@221 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@222 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@223 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@224 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@225 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@226 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@227 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@228 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@229 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@230 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@231 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@232 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@233 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@234 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@235 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@236 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@237 = private unnamed_addr constant [3 x i8] c"br\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @randNum(i32 noundef %0) local_unnamed_addr #0 {
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @0, i32 0, i32 0))
  %2 = tail call i32 (...) @simRand() #5
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @1, i32 0, i32 0))
  %3 = srem i32 %2, %0
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0))
  ret i32 %3
}

declare i32 @simRand(...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @drawGrid(i32* nocapture noundef readonly %0) local_unnamed_addr #0 {
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0))
  br label %2

2:                                                ; preds = %8, %1
  %3 = phi i64 [ 0, %1 ], [ %9, %8 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0))
  %4 = shl nsw i64 %3, 9
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @5, i32 0, i32 0))
  %5 = trunc i64 %3 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @6, i32 0, i32 0))
  %6 = trunc i64 %3 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @7, i32 0, i32 0))
  br label %11

7:                                                ; preds = %8
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0))
  tail call void (...) @simFlush() #5
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0))
  ret void

8:                                                ; preds = %20
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @10, i32 0, i32 0))
  %9 = add nuw nsw i64 %3, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @11, i32 0, i32 0))
  %10 = icmp eq i64 %9, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @12, i32 0, i32 0))
  br i1 %10, label %7, label %2, !llvm.loop !5

11:                                               ; preds = %20, %2
  %12 = phi i64 [ 0, %2 ], [ %21, %20 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @13, i32 0, i32 0))
  %13 = add nuw nsw i64 %12, %4
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @14, i32 0, i32 0))
  %14 = getelementptr inbounds i32, i32* %0, i64 %13
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @15, i32 0, i32 0))
  %15 = load i32, i32* %14, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @16, i32 0, i32 0))
  %16 = icmp eq i32 %15, 1
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @17, i32 0, i32 0))
  %17 = trunc i64 %12 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @18, i32 0, i32 0))
  br i1 %16, label %18, label %19

18:                                               ; preds = %11
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @19, i32 0, i32 0))
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %6, i32 noundef 65280) #5
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @20, i32 0, i32 0))
  br label %20

19:                                               ; preds = %11
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @21, i32 0, i32 0))
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %5, i32 noundef 0) #5
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @22, i32 0, i32 0))
  br label %20

20:                                               ; preds = %19, %18
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @23, i32 0, i32 0))
  %21 = add nuw nsw i64 %12, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @24, i32 0, i32 0))
  %22 = icmp eq i64 %21, 512
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @25, i32 0, i32 0))
  br i1 %22, label %8, label %11, !llvm.loop !11
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

declare void @simFlush(...) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local signext i8 @updateCellState(i8 noundef signext %0, i32 noundef %1) local_unnamed_addr #3 {
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @26, i32 0, i32 0))
  %3 = icmp eq i8 %0, 1
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @27, i32 0, i32 0))
  %4 = add i32 %1, -4
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @28, i32 0, i32 0))
  %5 = icmp ult i32 %4, -2
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @29, i32 0, i32 0))
  %6 = and i1 %3, %5
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @30, i32 0, i32 0))
  %7 = icmp eq i8 %0, 0
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @31, i32 0, i32 0))
  %8 = icmp eq i32 %1, 3
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @32, i32 0, i32 0))
  %9 = and i1 %7, %8
  call void @instructionLogger(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @33, i32 0, i32 0))
  %10 = select i1 %9, i8 1, i8 %0
  call void @instructionLogger(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @34, i32 0, i32 0))
  %11 = select i1 %6, i8 0, i8 %10
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @35, i32 0, i32 0))
  ret i8 %11
}

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i32 @countNeighbours(i32* nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @36, i32 0, i32 0))
  %4 = add nsw i32 %1, -1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @37, i32 0, i32 0))
  %5 = icmp ugt i32 %4, 511
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @38, i32 0, i32 0))
  br i1 %5, label %42, label %6

6:                                                ; preds = %3
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @39, i32 0, i32 0))
  %7 = add nsw i32 %2, -1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @40, i32 0, i32 0))
  %8 = icmp ult i32 %7, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @41, i32 0, i32 0))
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @42, i32 0, i32 0))
  %10 = shl nuw nsw i32 %7, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @43, i32 0, i32 0))
  %11 = add nuw nsw i32 %10, %4
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @44, i32 0, i32 0))
  %12 = zext i32 %11 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @45, i32 0, i32 0))
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @46, i32 0, i32 0))
  %14 = load i32, i32* %13, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @47, i32 0, i32 0))
  %15 = icmp eq i32 %14, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @48, i32 0, i32 0))
  %16 = zext i1 %15 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @49, i32 0, i32 0))
  br label %17

17:                                               ; preds = %9, %6
  %18 = phi i32 [ %16, %9 ], [ 0, %6 ]
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @50, i32 0, i32 0))
  %19 = icmp ult i32 %2, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @51, i32 0, i32 0))
  br i1 %19, label %20, label %29

20:                                               ; preds = %17
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @52, i32 0, i32 0))
  %21 = shl nuw nsw i32 %2, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @53, i32 0, i32 0))
  %22 = add nuw nsw i32 %21, %4
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @54, i32 0, i32 0))
  %23 = zext i32 %22 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @55, i32 0, i32 0))
  %24 = getelementptr inbounds i32, i32* %0, i64 %23
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @56, i32 0, i32 0))
  %25 = load i32, i32* %24, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @57, i32 0, i32 0))
  %26 = icmp eq i32 %25, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @58, i32 0, i32 0))
  %27 = zext i1 %26 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @59, i32 0, i32 0))
  %28 = add nuw nsw i32 %18, %27
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @60, i32 0, i32 0))
  br label %29

29:                                               ; preds = %20, %17
  %30 = phi i32 [ %28, %20 ], [ %18, %17 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @61, i32 0, i32 0))
  %31 = add nsw i32 %2, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @62, i32 0, i32 0))
  %32 = icmp ult i32 %31, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @63, i32 0, i32 0))
  br i1 %32, label %33, label %42

33:                                               ; preds = %29
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @64, i32 0, i32 0))
  %34 = shl nuw nsw i32 %31, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @65, i32 0, i32 0))
  %35 = add nuw nsw i32 %34, %4
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @66, i32 0, i32 0))
  %36 = zext i32 %35 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @67, i32 0, i32 0))
  %37 = getelementptr inbounds i32, i32* %0, i64 %36
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @68, i32 0, i32 0))
  %38 = load i32, i32* %37, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @69, i32 0, i32 0))
  %39 = icmp eq i32 %38, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @70, i32 0, i32 0))
  %40 = zext i1 %39 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @71, i32 0, i32 0))
  %41 = add nuw nsw i32 %30, %40
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @72, i32 0, i32 0))
  br label %42

42:                                               ; preds = %33, %29, %3
  %43 = phi i32 [ %30, %29 ], [ %41, %33 ], [ 0, %3 ]
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @73, i32 0, i32 0))
  %44 = icmp ugt i32 %1, 511
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @74, i32 0, i32 0))
  br i1 %44, label %70, label %45

45:                                               ; preds = %42
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @75, i32 0, i32 0))
  %46 = add nsw i32 %2, -1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @76, i32 0, i32 0))
  %47 = icmp ult i32 %46, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @77, i32 0, i32 0))
  br i1 %47, label %48, label %57

48:                                               ; preds = %45
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @78, i32 0, i32 0))
  %49 = shl nuw nsw i32 %46, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @79, i32 0, i32 0))
  %50 = add nuw nsw i32 %49, %1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @80, i32 0, i32 0))
  %51 = zext i32 %50 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @81, i32 0, i32 0))
  %52 = getelementptr inbounds i32, i32* %0, i64 %51
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @82, i32 0, i32 0))
  %53 = load i32, i32* %52, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @83, i32 0, i32 0))
  %54 = icmp eq i32 %53, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @84, i32 0, i32 0))
  %55 = zext i1 %54 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @85, i32 0, i32 0))
  %56 = add nuw nsw i32 %43, %55
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @86, i32 0, i32 0))
  br label %57

57:                                               ; preds = %48, %45
  %58 = phi i32 [ %56, %48 ], [ %43, %45 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @87, i32 0, i32 0))
  %59 = add nsw i32 %2, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @88, i32 0, i32 0))
  %60 = icmp ult i32 %59, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @89, i32 0, i32 0))
  br i1 %60, label %61, label %70

61:                                               ; preds = %57
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @90, i32 0, i32 0))
  %62 = shl nuw nsw i32 %59, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @91, i32 0, i32 0))
  %63 = add nuw nsw i32 %62, %1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @92, i32 0, i32 0))
  %64 = zext i32 %63 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @93, i32 0, i32 0))
  %65 = getelementptr inbounds i32, i32* %0, i64 %64
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @94, i32 0, i32 0))
  %66 = load i32, i32* %65, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @95, i32 0, i32 0))
  %67 = icmp eq i32 %66, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @96, i32 0, i32 0))
  %68 = zext i1 %67 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @97, i32 0, i32 0))
  %69 = add nuw nsw i32 %58, %68
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @98, i32 0, i32 0))
  br label %70

70:                                               ; preds = %61, %57, %42
  %71 = phi i32 [ %58, %57 ], [ %69, %61 ], [ %43, %42 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @99, i32 0, i32 0))
  %72 = add nsw i32 %1, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @100, i32 0, i32 0))
  %73 = icmp ugt i32 %72, 511
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @101, i32 0, i32 0))
  br i1 %73, label %111, label %74

74:                                               ; preds = %70
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @102, i32 0, i32 0))
  %75 = add nsw i32 %2, -1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @103, i32 0, i32 0))
  %76 = icmp ult i32 %75, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @104, i32 0, i32 0))
  br i1 %76, label %77, label %86

77:                                               ; preds = %74
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @105, i32 0, i32 0))
  %78 = shl nuw nsw i32 %75, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @106, i32 0, i32 0))
  %79 = add nuw nsw i32 %78, %72
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @107, i32 0, i32 0))
  %80 = zext i32 %79 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @108, i32 0, i32 0))
  %81 = getelementptr inbounds i32, i32* %0, i64 %80
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @109, i32 0, i32 0))
  %82 = load i32, i32* %81, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @110, i32 0, i32 0))
  %83 = icmp eq i32 %82, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @111, i32 0, i32 0))
  %84 = zext i1 %83 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @112, i32 0, i32 0))
  %85 = add nuw nsw i32 %71, %84
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @113, i32 0, i32 0))
  br label %86

86:                                               ; preds = %77, %74
  %87 = phi i32 [ %85, %77 ], [ %71, %74 ]
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @114, i32 0, i32 0))
  %88 = icmp ult i32 %2, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @115, i32 0, i32 0))
  br i1 %88, label %89, label %98

89:                                               ; preds = %86
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @116, i32 0, i32 0))
  %90 = shl nuw nsw i32 %2, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @117, i32 0, i32 0))
  %91 = add nuw nsw i32 %90, %72
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @118, i32 0, i32 0))
  %92 = zext i32 %91 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @119, i32 0, i32 0))
  %93 = getelementptr inbounds i32, i32* %0, i64 %92
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @120, i32 0, i32 0))
  %94 = load i32, i32* %93, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @121, i32 0, i32 0))
  %95 = icmp eq i32 %94, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @122, i32 0, i32 0))
  %96 = zext i1 %95 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @123, i32 0, i32 0))
  %97 = add nuw nsw i32 %87, %96
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @124, i32 0, i32 0))
  br label %98

98:                                               ; preds = %89, %86
  %99 = phi i32 [ %97, %89 ], [ %87, %86 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @125, i32 0, i32 0))
  %100 = add nsw i32 %2, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @126, i32 0, i32 0))
  %101 = icmp ult i32 %100, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @127, i32 0, i32 0))
  br i1 %101, label %102, label %111

102:                                              ; preds = %98
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @128, i32 0, i32 0))
  %103 = shl nuw nsw i32 %100, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @129, i32 0, i32 0))
  %104 = add nuw nsw i32 %103, %72
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @130, i32 0, i32 0))
  %105 = zext i32 %104 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @131, i32 0, i32 0))
  %106 = getelementptr inbounds i32, i32* %0, i64 %105
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @132, i32 0, i32 0))
  %107 = load i32, i32* %106, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @133, i32 0, i32 0))
  %108 = icmp eq i32 %107, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @134, i32 0, i32 0))
  %109 = zext i1 %108 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @135, i32 0, i32 0))
  %110 = add nuw nsw i32 %99, %109
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @136, i32 0, i32 0))
  br label %111

111:                                              ; preds = %102, %98, %70
  %112 = phi i32 [ %99, %98 ], [ %110, %102 ], [ %71, %70 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @137, i32 0, i32 0))
  ret i32 %112
}

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  call void @instructionLogger(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @138, i32 0, i32 0))
  %1 = alloca [131072 x i32], align 16
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @139, i32 0, i32 0))
  %2 = tail call i32 (...) @simRand() #5
  call void @instructionLogger(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @140, i32 0, i32 0))
  %3 = bitcast [131072 x i32]* %1 to i8*
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @141, i32 0, i32 0))
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %3) #5
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @142, i32 0, i32 0))
  br label %4

4:                                                ; preds = %10, %0
  %5 = phi i64 [ 0, %0 ], [ %11, %10 ]
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @143, i32 0, i32 0))
  br label %13

6:                                                ; preds = %10
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @144, i32 0, i32 0))
  %7 = tail call i32 (...) @simRand() #5
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @145, i32 0, i32 0))
  %8 = srem i32 %7, 10000
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @146, i32 0, i32 0))
  %9 = icmp sgt i32 %8, 0
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @147, i32 0, i32 0))
  br i1 %9, label %34, label %32

10:                                               ; preds = %13
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @148, i32 0, i32 0))
  %11 = add nuw nsw i64 %5, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @149, i32 0, i32 0))
  %12 = icmp eq i64 %11, 512
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @150, i32 0, i32 0))
  br i1 %12, label %6, label %4, !llvm.loop !12

13:                                               ; preds = %13, %4
  %14 = phi i64 [ 0, %4 ], [ %30, %13 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @151, i32 0, i32 0))
  %15 = shl nuw nsw i64 %14, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @152, i32 0, i32 0))
  %16 = add nuw nsw i64 %15, %5
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @153, i32 0, i32 0))
  %17 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %16
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @154, i32 0, i32 0))
  store i32 0, i32* %17, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @155, i32 0, i32 0))
  %18 = shl i64 %14, 9
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @156, i32 0, i32 0))
  %19 = or i64 %18, 512
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @157, i32 0, i32 0))
  %20 = add nuw nsw i64 %19, %5
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @158, i32 0, i32 0))
  %21 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %20
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @159, i32 0, i32 0))
  store i32 0, i32* %21, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @160, i32 0, i32 0))
  %22 = shl i64 %14, 9
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @161, i32 0, i32 0))
  %23 = or i64 %22, 1024
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @162, i32 0, i32 0))
  %24 = add nuw nsw i64 %23, %5
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @163, i32 0, i32 0))
  %25 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %24
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @164, i32 0, i32 0))
  store i32 0, i32* %25, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @165, i32 0, i32 0))
  %26 = shl i64 %14, 9
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @166, i32 0, i32 0))
  %27 = or i64 %26, 1536
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @167, i32 0, i32 0))
  %28 = add nuw nsw i64 %27, %5
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @168, i32 0, i32 0))
  %29 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %28
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @169, i32 0, i32 0))
  store i32 0, i32* %29, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @170, i32 0, i32 0))
  %30 = add nuw nsw i64 %14, 4
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @171, i32 0, i32 0))
  %31 = icmp eq i64 %30, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @172, i32 0, i32 0))
  br i1 %31, label %10, label %13, !llvm.loop !13

32:                                               ; preds = %34, %6
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @173, i32 0, i32 0))
  %33 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 0
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @174, i32 0, i32 0))
  br label %47

34:                                               ; preds = %34, %6
  %35 = phi i32 [ %44, %34 ], [ 0, %6 ]
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @175, i32 0, i32 0))
  %36 = tail call i32 (...) @simRand() #5
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @176, i32 0, i32 0))
  %37 = srem i32 %36, 131072
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @177, i32 0, i32 0))
  %38 = sdiv i32 %37, 256
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @178, i32 0, i32 0))
  %39 = srem i32 %37, 256
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @179, i32 0, i32 0))
  %40 = shl nsw i32 %39, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @180, i32 0, i32 0))
  %41 = add nsw i32 %40, %38
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @181, i32 0, i32 0))
  %42 = sext i32 %41 to i64
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @182, i32 0, i32 0))
  %43 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %42
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @183, i32 0, i32 0))
  store i32 1, i32* %43, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @184, i32 0, i32 0))
  %44 = add nuw nsw i32 %35, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @185, i32 0, i32 0))
  %45 = icmp eq i32 %44, %8
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @186, i32 0, i32 0))
  br i1 %45, label %32, label %34, !llvm.loop !14

46:                                               ; preds = %70
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @187, i32 0, i32 0))
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %3) #5
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @188, i32 0, i32 0))
  ret void

47:                                               ; preds = %70, %32
  %48 = phi i32 [ 0, %32 ], [ %71, %70 ]
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @189, i32 0, i32 0))
  br label %49

49:                                               ; preds = %53, %47
  %50 = phi i64 [ 0, %47 ], [ %54, %53 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @190, i32 0, i32 0))
  %51 = shl nsw i64 %50, 9
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @191, i32 0, i32 0))
  %52 = trunc i64 %50 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @192, i32 0, i32 0))
  br label %56

53:                                               ; preds = %56
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @193, i32 0, i32 0))
  %54 = add nuw nsw i64 %50, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @194, i32 0, i32 0))
  %55 = icmp eq i64 %54, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @195, i32 0, i32 0))
  br i1 %55, label %66, label %49, !llvm.loop !5

56:                                               ; preds = %56, %49
  %57 = phi i64 [ 0, %49 ], [ %64, %56 ]
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @196, i32 0, i32 0))
  %58 = add nuw nsw i64 %57, %51
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @197, i32 0, i32 0))
  %59 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %58
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @198, i32 0, i32 0))
  %60 = load i32, i32* %59, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @199, i32 0, i32 0))
  %61 = icmp eq i32 %60, 1
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @200, i32 0, i32 0))
  %62 = trunc i64 %57 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @201, i32 0, i32 0))
  %63 = select i1 %61, i32 65280, i32 0
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @202, i32 0, i32 0))
  tail call void @simPutPixel(i32 noundef %62, i32 noundef %52, i32 noundef %63) #5
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @203, i32 0, i32 0))
  %64 = add nuw nsw i64 %57, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @204, i32 0, i32 0))
  %65 = icmp eq i64 %64, 512
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @205, i32 0, i32 0))
  br i1 %65, label %53, label %56, !llvm.loop !11

66:                                               ; preds = %53
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @206, i32 0, i32 0))
  tail call void (...) @simFlush() #5
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @207, i32 0, i32 0))
  br label %67

67:                                               ; preds = %73, %66
  %68 = phi i64 [ 0, %66 ], [ %74, %73 ]
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @208, i32 0, i32 0))
  %69 = trunc i64 %68 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @209, i32 0, i32 0))
  br label %76

70:                                               ; preds = %73
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @210, i32 0, i32 0))
  %71 = add nuw nsw i32 %48, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @211, i32 0, i32 0))
  %72 = icmp eq i32 %71, 1000
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @212, i32 0, i32 0))
  br i1 %72, label %46, label %47, !llvm.loop !15

73:                                               ; preds = %76
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @213, i32 0, i32 0))
  %74 = add nuw nsw i64 %68, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @214, i32 0, i32 0))
  %75 = icmp eq i64 %74, 512
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @215, i32 0, i32 0))
  br i1 %75, label %70, label %67, !llvm.loop !16

76:                                               ; preds = %76, %67
  %77 = phi i64 [ 0, %67 ], [ %96, %76 ]
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @216, i32 0, i32 0))
  %78 = trunc i64 %77 to i32
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @217, i32 0, i32 0))
  %79 = call i32 @countNeighbours(i32* noundef nonnull %33, i32 noundef %69, i32 noundef %78)
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @218, i32 0, i32 0))
  %80 = shl nuw nsw i64 %77, 9
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @219, i32 0, i32 0))
  %81 = add nuw nsw i64 %80, %68
  call void @instructionLogger(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @220, i32 0, i32 0))
  %82 = getelementptr inbounds [131072 x i32], [131072 x i32]* %1, i64 0, i64 %81
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @221, i32 0, i32 0))
  %83 = load i32, i32* %82, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @222, i32 0, i32 0))
  %84 = trunc i32 %83 to i8
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @223, i32 0, i32 0))
  %85 = icmp eq i8 %84, 1
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @224, i32 0, i32 0))
  %86 = add i32 %79, -4
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @225, i32 0, i32 0))
  %87 = icmp ult i32 %86, -2
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @226, i32 0, i32 0))
  %88 = and i1 %87, %85
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @227, i32 0, i32 0))
  %89 = icmp eq i8 %84, 0
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @228, i32 0, i32 0))
  %90 = icmp eq i32 %79, 3
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @229, i32 0, i32 0))
  %91 = and i1 %90, %89
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @230, i32 0, i32 0))
  %92 = shl i32 %83, 24
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @231, i32 0, i32 0))
  %93 = ashr exact i32 %92, 24
  call void @instructionLogger(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @232, i32 0, i32 0))
  %94 = select i1 %91, i32 1, i32 %93
  call void @instructionLogger(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @233, i32 0, i32 0))
  %95 = select i1 %88, i32 0, i32 %94
  call void @instructionLogger(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @234, i32 0, i32 0))
  store i32 %95, i32* %82, align 4, !tbaa !7
  call void @instructionLogger(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @235, i32 0, i32 0))
  %96 = add nuw nsw i64 %77, 1
  call void @instructionLogger(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @236, i32 0, i32 0))
  %97 = icmp eq i64 %96, 256
  call void @instructionLogger(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @237, i32 0, i32 0))
  br i1 %97, label %73, label %76, !llvm.loop !17
}

declare void @instructionLogger(i8*)

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
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
