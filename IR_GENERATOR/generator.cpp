#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#include "../SDL/sim.h"

int main() {
    LLVMContext ctx;
    Module* module = new Module("top", ctx);
    IRBuilder<> builder(ctx);

//--------------------------------------------------------------------------------------------------------------  
// Building module
//-------------------------------------------------------------------------------------------------------------- 
   
    // functions

    ArrayRef<Type*> draw_grid_func_args_ref ({Type::getInt32PtrTy(ctx)});
    FunctionType* draw_grid_func_type = FunctionType::get (Type::getVoidTy(ctx), draw_grid_func_args_ref, false);
    Function* draw_grid_func = Function::Create (draw_grid_func_type, Function::ExternalLinkage, "drawGrid", module);

    ArrayRef<Type*> simPutPixel_func_args_ref ({Type::getInt32Ty(ctx), Type::getInt32Ty(ctx), Type::getInt32Ty(ctx)});
    FunctionType* simPutPixel_func_type = FunctionType::get (Type::getVoidTy(ctx), simPutPixel_func_args_ref, false);
    FunctionCallee simPutPixel_func = module->getOrInsertFunction("simPutPixel", simPutPixel_func_type);

    FunctionType* simFlush_func_type = FunctionType::get(Type::getVoidTy(ctx), false);
    FunctionCallee simFlush_func = module->getOrInsertFunction("simFlush", simFlush_func_type);

    ArrayRef<Type*> update_cell_state_func_args_ref ({Type::getInt8Ty(ctx), Type::getInt32Ty(ctx)});
    FunctionType* update_cell_state_func_type = FunctionType::get (Type::getInt8Ty(ctx), update_cell_state_func_args_ref, false);
    Function* update_cell_state_func = Function::Create (update_cell_state_func_type, Function::ExternalLinkage, "updateCellState", module);

    ArrayRef<Type*> count_neighbors_func_args_ref ({Type::getInt32PtrTy(ctx), Type::getInt32Ty(ctx), Type::getInt32Ty(ctx)});
    FunctionType* count_neighbors_func_type = FunctionType::get (Type::getInt32Ty(ctx), count_neighbors_func_args_ref, false);
    Function* count_neighbors_func = Function::Create (count_neighbors_func_type, Function::ExternalLinkage, "countNeighbours", module);

    
    FunctionType* app_func_type = FunctionType::get (Type::getVoidTy(ctx), false);
    Function* app_func = Function::Create (app_func_type, Function::ExternalLinkage, "app", module);

    FunctionType* simRand_func_type = FunctionType::get (Type::getInt32Ty(ctx), false);
    FunctionCallee simRand_func = module->getOrInsertFunction ("simRand", simRand_func_type);
   
     // App_func
    
        // basic blocks
        BasicBlock* app_entry_bb = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_6 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_8 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_20 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_21 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_23 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_27 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_30 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_40 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_41 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_44 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_47 = BasicBlock::Create (ctx, "", app_func);
        BasicBlock* app_bb_50 = BasicBlock::Create (ctx, "", app_func);
        

        // entry_app_bb
        builder.SetInsertPoint (app_entry_bb);
        Value* appv_1 = builder.CreateAlloca (ArrayType::get (Type::getInt32Ty(ctx), SIM_X_SIZE * SIM_Y_SIZE));
        Value* appv_2 = builder.CreateBitCast (appv_1, Type::getInt8PtrTy(ctx));
        Value* appv_3 = builder.CreateCall (simRand_func);
        Value* appv_4 = builder.CreateSRem (appv_3, ConstantInt::get (Type::getInt32Ty(ctx), 10000));
        Value* appv_5 = builder.CreateICmp (CmpInst::ICMP_SGT, appv_4, ConstantInt::get (Type::getInt32Ty(ctx), 0));
        Value* br_start_config_bb = builder.CreateCondBr(appv_5, app_bb_8, app_bb_6);

        // app_bb_6
        builder.SetInsertPoint (app_bb_6);
        Value* appv_7 = builder.CreateInBoundsGEP (ArrayType::get (Type::getInt32Ty(ctx), SIM_X_SIZE * SIM_Y_SIZE), appv_1, {ConstantInt::get (Type::getInt64Ty(ctx), 0), ConstantInt::get (Type::getInt64Ty(ctx), 0)});
        builder.CreateBr (app_bb_21);

        // app_bb_8
        builder.SetInsertPoint (app_bb_8);
        PHINode* appv_9= builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        Value* appv_10 = builder.CreateCall (simRand_func);
        Value* appv_11 = builder.CreateSRem (appv_10, ConstantInt::get (Type::getInt32Ty(ctx), SIM_X_SIZE * SIM_Y_SIZE));
        Value* appv_12 = builder.CreateSDiv (appv_11, ConstantInt::get (Type::getInt32Ty(ctx), 256 ));
        Value* appv_13 = builder.CreateSRem (appv_11, ConstantInt::get (Type::getInt32Ty(ctx), 256 ));
        Value* appv_14 = builder.CreateShl (appv_13, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", false, true);
        Value* appv_15 = builder.CreateAdd (appv_14, appv_12, "", false, true);
        Value* appv_16 = builder.CreateSExt (appv_15, Type::getInt64Ty(ctx));
        Value* appv_17 = builder.CreateInBoundsGEP (ArrayType::get (Type::getInt32Ty(ctx), SIM_X_SIZE * SIM_Y_SIZE), appv_1, {ConstantInt::get (Type::getInt64Ty(ctx), 0), appv_16});
        builder.CreateStore (ConstantInt::get (Type::getInt32Ty(ctx), 1), appv_17);
        Value* appv_18 = builder.CreateAdd (appv_9, ConstantInt::get (Type::getInt32Ty(ctx), 1), "", true, true);
        Value* appv_19 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_18, appv_4);
        builder.CreateCondBr (appv_19, app_bb_6, app_bb_8);

        // app_bb_20 
        builder.SetInsertPoint (app_bb_20);
        builder.CreateRetVoid();

        // app_bb_21
        builder.SetInsertPoint (app_bb_21);
        PHINode* appv_22 = builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        builder.CreateBr (app_bb_23);

        // app_bb_23
        builder.SetInsertPoint (app_bb_23);
        PHINode* appv_24 = builder.CreatePHI (Type::getInt64Ty(ctx), 2);
        Value* appv_25 = builder.CreateShl (appv_24, ConstantInt::get (Type::getInt64Ty(ctx), 9), "", false, true);
        Value* appv_26 = builder.CreateTrunc(appv_24, Type::getInt32Ty(ctx));
        builder.CreateBr (app_bb_30);

        // app_bb_27
        builder.SetInsertPoint (app_bb_27);
        Value* appv_28 = builder.CreateAdd (appv_24, ConstantInt::get (Type::getInt64Ty(ctx), 1), "", true, true);
        Value* appv_29 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_28, ConstantInt::get (Type::getInt64Ty(ctx), 256));
        builder.CreateCondBr (appv_29, app_bb_40, app_bb_23);

        // app_bb_30
        builder.SetInsertPoint (app_bb_30);
        PHINode* appv_31 = builder.CreatePHI (Type::getInt64Ty(ctx), 2);
        Value* appv_32 = builder.CreateAdd (appv_31, appv_25, "", true, true);
        Value* appv_33 = builder.CreateInBoundsGEP (ArrayType::get (Type::getInt32Ty(ctx), SIM_X_SIZE * SIM_Y_SIZE), appv_1, {ConstantInt::get (Type::getInt64Ty(ctx), 0), appv_32});
        Value* appv_34 = builder.CreateLoad (Type::getInt32Ty(ctx), appv_33);
        Value* appv_35 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_34, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* appv_36 = builder.CreateTrunc (appv_31, Type::getInt32Ty(ctx));
        Value* appv_37 = builder.CreateSelect(appv_35, ConstantInt::get (Type::getInt32Ty(ctx), 65280), ConstantInt::get (Type::getInt32Ty(ctx), 0) );
        builder.CreateCall (simPutPixel_func, {appv_36, appv_26, appv_37});
        Value* appv_38 = builder.CreateAdd (appv_31, ConstantInt::get (Type::getInt64Ty(ctx), 1), "", true, true);
        Value* appv_39 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_38, ConstantInt::get (Type::getInt64Ty(ctx), 512));
        builder.CreateCondBr (appv_39, app_bb_27, app_bb_30);

        // app_bb_40
        builder.SetInsertPoint (app_bb_40);
        builder.CreateCall (simFlush_func);
        builder.CreateBr (app_bb_41);


        // app_bb_41
        builder.SetInsertPoint (app_bb_41);
        PHINode* appv_42 = builder.CreatePHI (Type::getInt64Ty(ctx), 2);
        Value* appv_43 = builder.CreateTrunc (appv_42, Type::getInt32Ty(ctx));
        builder.CreateBr (app_bb_50);

        // app_bb_44
        builder.SetInsertPoint (app_bb_44);
        Value* appv_45 = builder.CreateAdd (appv_22, ConstantInt::get (Type::getInt32Ty(ctx), 1), "", true, true);
        Value* appv_46 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_45, ConstantInt::get (Type::getInt32Ty(ctx), 1000));
        builder.CreateCondBr (appv_46, app_bb_20, app_bb_21);

        // app_bb_47
        builder.SetInsertPoint (app_bb_47);
        Value* appv_48 = builder.CreateAdd (appv_42, ConstantInt::get (Type::getInt64Ty(ctx), 1), "", true, true);
        Value* appv_49 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_48, ConstantInt::get (Type::getInt64Ty(ctx), 512));
        builder.CreateCondBr (appv_49, app_bb_44, app_bb_41);

        // app_bb_50
        builder.SetInsertPoint (app_bb_50);
        PHINode* appv_51 = builder.CreatePHI (Type::getInt64Ty(ctx), 2);
        Value* appv_52 = builder.CreateTrunc (appv_51, Type::getInt32Ty(ctx));
        Value* appv_53 = builder.CreateCall (count_neighbors_func, {appv_7, appv_43, appv_52});
        Value* appv_54 = builder.CreateShl (appv_51, ConstantInt::get (Type::getInt64Ty(ctx), 9), "", true, true);
        Value* appv_55 = builder.CreateAdd (appv_54, appv_42, "", true, true);
        Value* appv_56 = builder.CreateInBoundsGEP (ArrayType::get (Type::getInt32Ty(ctx), SIM_X_SIZE * SIM_Y_SIZE), appv_1, {ConstantInt::get (Type::getInt64Ty(ctx), 0), appv_55});
        Value* appv_57 = builder.CreateLoad (Type::getInt32Ty(ctx), appv_56);
        Value* appv_58 = builder.CreateTrunc (appv_57, Type::getInt8Ty(ctx));
        Value* appv_59 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_58, ConstantInt::get (Type::getInt8Ty(ctx), 1));
        Value* appv_60 = builder.CreateAdd (appv_53, ConstantInt::get (Type::getInt32Ty(ctx), -4), "", true, true);
        Value* appv_61 = builder.CreateICmp (CmpInst::ICMP_ULT, appv_60, ConstantInt::get (Type::getInt32Ty(ctx), -2));
        Value* appv_62 = builder.CreateAnd (appv_61, appv_59);
        Value* appv_63 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_58, ConstantInt::get (Type::getInt8Ty(ctx), 0));
        Value* appv_64 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_53, ConstantInt::get (Type::getInt32Ty(ctx), 3));
        Value* appv_65 = builder.CreateAnd (appv_64, appv_63);
        Value* appv_66 = builder.CreateShl (appv_57, ConstantInt::get (Type::getInt32Ty(ctx), 24), "", false, true);
        Value* appv_67 = builder.CreateAShr (appv_66, ConstantInt::get (Type::getInt32Ty(ctx), 24), "");
        Value* appv_68 = builder.CreateSelect(appv_65, ConstantInt::get (Type::getInt32Ty(ctx), 1), appv_67);
        Value* appv_69 = builder.CreateSelect(appv_62, ConstantInt::get (Type::getInt32Ty(ctx), 0), appv_68);
        builder.CreateStore (appv_69, appv_56);
        Value* appv_70 = builder.CreateAdd (appv_51, ConstantInt::get (Type::getInt64Ty(ctx), 1), "", true, true);
        Value* appv_71 = builder.CreateICmp (CmpInst::ICMP_EQ, appv_70, ConstantInt::get (Type::getInt64Ty(ctx), 256));
        builder.CreateCondBr (appv_71, app_bb_47, app_bb_50);

        // adding phi args
        appv_9->addIncoming (appv_18, app_bb_8);
        appv_9->addIncoming (ConstantInt::get (Type::getInt32Ty(ctx), 0), app_entry_bb);

        appv_22->addIncoming (ConstantInt::get (Type::getInt32Ty(ctx), 0), app_bb_6);
        appv_22->addIncoming (appv_45, app_bb_44);

        appv_24->addIncoming (ConstantInt::get (Type::getInt64Ty(ctx), 0), app_bb_21);
        appv_24->addIncoming (appv_28, app_bb_27);

        appv_31->addIncoming (ConstantInt::get (Type::getInt64Ty(ctx), 0), app_bb_23);
        appv_31->addIncoming (appv_38, app_bb_30);

        appv_42->addIncoming (ConstantInt::get (Type::getInt64Ty(ctx), 0), app_bb_40);
        appv_42->addIncoming (appv_48, app_bb_47);

        appv_51->addIncoming (ConstantInt::get (Type::getInt64Ty(ctx), 0), app_bb_41);
        appv_51->addIncoming (appv_70, app_bb_50);
    
    
        ///////////////////////////////////////////// draw_grid_func//////////////////////////////////////////
  
        // args
        Function::arg_iterator draw_grid_func_args_it = draw_grid_func->arg_begin();
        Value* draw_gridv_0 = draw_grid_func_args_it;

        // basic blocks
        BasicBlock* draw_grid_entry_bb = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_2 = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_7 = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_8 = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_11 = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_18 = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_19 = BasicBlock::Create (ctx, "", draw_grid_func);
        BasicBlock* draw_grid_bb_20 = BasicBlock::Create (ctx, "", draw_grid_func);

        // draw_grid_entry_bb
        builder.SetInsertPoint (draw_grid_entry_bb);
        builder.CreateBr (draw_grid_bb_2);

        // draw_grid_bb_2
        builder.SetInsertPoint (draw_grid_bb_2);
        PHINode* draw_gridv_3 = builder.CreatePHI (Type::getInt64Ty(ctx), 2);
        Value* draw_gridv_4 = builder.CreateShl (draw_gridv_3, ConstantInt::get (Type::getInt64Ty(ctx), 9), "", false, true);
        Value* draw_gridv_5 = builder.CreateTrunc (draw_gridv_3 , Type::getInt32Ty(ctx));
        Value* draw_gridv_6 = builder.CreateTrunc (draw_gridv_3 , Type::getInt32Ty(ctx));
        builder.CreateBr (draw_grid_bb_11);

        // draw_grid_bb_7
        builder.SetInsertPoint (draw_grid_bb_7);
        Value* draw_gridv_8 = builder.CreateCall (simFlush_func);
        builder.CreateRetVoid();

        // draw_grid_bb_8
        builder.SetInsertPoint (draw_grid_bb_8);
        Value* draw_gridv_9 = builder.CreateAdd (draw_gridv_3, ConstantInt::get (Type::getInt64Ty(ctx), 1), "", true, true);
        Value* draw_gridv_10 = builder.CreateICmp (CmpInst::ICMP_EQ, draw_gridv_9, ConstantInt::get (Type::getInt64Ty(ctx), 256));
        builder.CreateCondBr (draw_gridv_10, draw_grid_bb_7, draw_grid_bb_2);

        // draw_grid_bb_11
        builder.SetInsertPoint (draw_grid_bb_11);
        PHINode* draw_gridv_12 = builder.CreatePHI (Type::getInt64Ty(ctx), 2);
        Value* draw_gridv_13 = builder.CreateAdd (draw_gridv_12, draw_gridv_4, "", true, true);
        Value* draw_gridv_14 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), draw_gridv_0, draw_gridv_13);
        Value* draw_gridv_15 = builder.CreateLoad (Type::getInt32Ty(ctx), draw_gridv_14);
        Value* draw_gridv_16 = builder.CreateICmp (CmpInst::ICMP_EQ, draw_gridv_15, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* draw_gridv_17 = builder.CreateTrunc (draw_gridv_12 , Type::getInt32Ty(ctx));
        builder.CreateCondBr (draw_gridv_16, draw_grid_bb_18, draw_grid_bb_19);

        // draw_grid_bb_18
        builder.SetInsertPoint (draw_grid_bb_18);
        builder.CreateCall (simPutPixel_func, {draw_gridv_17, draw_gridv_6, ConstantInt::get (Type::getInt32Ty(ctx), 65280)});
        builder.CreateBr (draw_grid_bb_20);

        // draw_grid_bb_19
        builder.SetInsertPoint (draw_grid_bb_19);
        builder.CreateCall (simPutPixel_func, {draw_gridv_17, draw_gridv_5, ConstantInt::get (Type::getInt32Ty(ctx), 0)});
        builder.CreateBr (draw_grid_bb_20);

        // draw_grid_bb_20
        builder.SetInsertPoint (draw_grid_bb_20);
        Value* draw_gridv_21 = builder.CreateAdd (draw_gridv_12, ConstantInt::get (Type::getInt64Ty(ctx), 1), "", true, true);
        Value* draw_gridv_22 = builder.CreateICmp (CmpInst::ICMP_EQ, draw_gridv_21, ConstantInt::get (Type::getInt64Ty(ctx), 512));
        builder.CreateCondBr (draw_gridv_22, draw_grid_bb_8, draw_grid_bb_11);


        draw_gridv_3->addIncoming (ConstantInt::get (Type::getInt64Ty(ctx), 0), draw_grid_entry_bb);
        draw_gridv_3->addIncoming (draw_gridv_9, draw_grid_bb_8);

        draw_gridv_12->addIncoming (ConstantInt::get (Type::getInt64Ty(ctx), 0), draw_grid_bb_2);
        draw_gridv_12->addIncoming (draw_gridv_21, draw_grid_bb_20);


    
    ////////////////////// Count_neighbors_func /////////////////////////////////
    
        // args
        Function::arg_iterator cnt_nbrs_func_args_it = count_neighbors_func->arg_begin();
        Value* cnt_nbrsv_0 = cnt_nbrs_func_args_it;
        Value* cnt_nbrsv_1 = ++cnt_nbrs_func_args_it;
        Value* cnt_nbrsv_2 = ++cnt_nbrs_func_args_it;

        // basic blocks
        BasicBlock* cnt_nbrs_entry_bb = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb6 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb9 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb17 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb20 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb29 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb33 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb42 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb45 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb48 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb57 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb61 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb70 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb74 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb77 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb86 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb89 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb98 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb102 = BasicBlock::Create (ctx, "", count_neighbors_func);
        BasicBlock* cnt_nbrs_bb111 = BasicBlock::Create (ctx, "", count_neighbors_func);

        // cnt_nbrs_entry_bb
        builder.SetInsertPoint (cnt_nbrs_entry_bb);
        Value* cnt_nbrsv_4 = builder.CreateAdd (cnt_nbrsv_1, ConstantInt::get (Type::getInt32Ty(ctx), -1), "", false, true);
        Value* cnt_nbrsv_5 = builder.CreateICmp (CmpInst::ICMP_UGT, cnt_nbrsv_4, ConstantInt::get (Type::getInt32Ty(ctx), 511));
        builder.CreateCondBr (cnt_nbrsv_5, cnt_nbrs_bb42, cnt_nbrs_bb6);

        // ccnt_nbrs_bb6
        builder.SetInsertPoint (cnt_nbrs_bb6);
        Value* cnt_nbrsv_7 = builder.CreateAdd (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), -1), "", false, true);
        Value* cnt_nbrsv_8 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_7, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_8, cnt_nbrs_bb9, cnt_nbrs_bb17);

        // ccnt_nbrs_bb9
        builder.SetInsertPoint (cnt_nbrs_bb9);
        Value* cnt_nbrsv_10 = builder.CreateShl (cnt_nbrsv_7, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_11 = builder.CreateAdd (cnt_nbrsv_10, cnt_nbrsv_4, "", true, true);
        Value* cnt_nbrsv_12 = builder.CreateZExt(cnt_nbrsv_11, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_13 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_12);
        Value* cnt_nbrsv_14 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_13);
        Value* cnt_nbrsv_15 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_14, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_16 = builder.CreateZExt(cnt_nbrsv_15, Type::getInt32Ty(ctx));
        builder.CreateBr (cnt_nbrs_bb17);

         // ccnt_nbrs_bb17
        builder.SetInsertPoint (cnt_nbrs_bb17);
        PHINode* cnt_nbrsv_18 = builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        Value* cnt_nbrsv_19 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_19, cnt_nbrs_bb20, cnt_nbrs_bb29);

        // ccnt_nbrs_bb20
        builder.SetInsertPoint (cnt_nbrs_bb20);
        Value* cnt_nbrsv_21 = builder.CreateShl (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_22 = builder.CreateAdd (cnt_nbrsv_21, cnt_nbrsv_4, "", true, true);
        Value* cnt_nbrsv_23 = builder.CreateZExt(cnt_nbrsv_22, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_24 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_23);
        Value* cnt_nbrsv_25 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_24);
        Value* cnt_nbrsv_26 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_25, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_27 = builder.CreateZExt(cnt_nbrsv_26, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_28 = builder.CreateAdd (cnt_nbrsv_18, cnt_nbrsv_27, "", true, true);
        builder.CreateBr (cnt_nbrs_bb29);

        // ccnt_nbrs_bb29
        builder.SetInsertPoint (cnt_nbrs_bb29);
        PHINode* cnt_nbrsv_30 = builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        Value* cnt_nbrsv_31 = builder.CreateAdd (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 1), "", true, true);
        Value* cnt_nbrsv_32 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_31, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_32, cnt_nbrs_bb33, cnt_nbrs_bb42);

         // ccnt_nbrs_bb33
        builder.SetInsertPoint (cnt_nbrs_bb33);
        Value* cnt_nbrsv_34 = builder.CreateShl (cnt_nbrsv_31, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_35 = builder.CreateAdd (cnt_nbrsv_34, cnt_nbrsv_4, "", true, true);
        Value* cnt_nbrsv_36 = builder.CreateZExt(cnt_nbrsv_35, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_37 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_36);
        Value* cnt_nbrsv_38 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_37);
        Value* cnt_nbrsv_39 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_38, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_40 = builder.CreateZExt(cnt_nbrsv_39, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_41 = builder.CreateAdd (cnt_nbrsv_30, cnt_nbrsv_40, "", true, true);
        builder.CreateBr (cnt_nbrs_bb42);

         // ccnt_nbrs_bb42
        builder.SetInsertPoint (cnt_nbrs_bb42);
        PHINode* cnt_nbrsv_43 = builder.CreatePHI (Type::getInt32Ty(ctx), 3);
        Value* cnt_nbrsv_44 = builder.CreateICmp (CmpInst::ICMP_UGT, cnt_nbrsv_1, ConstantInt::get (Type::getInt32Ty(ctx), 511));
        builder.CreateCondBr (cnt_nbrsv_44, cnt_nbrs_bb70, cnt_nbrs_bb45);

        // ccnt_nbrs_bb45
        builder.SetInsertPoint (cnt_nbrs_bb45);
        Value* cnt_nbrsv_46 = builder.CreateAdd (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), -1), "", false, true);
        Value* cnt_nbrsv_47 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_46, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_47, cnt_nbrs_bb48, cnt_nbrs_bb57);

        // ccnt_nbrs_bb48
        builder.SetInsertPoint (cnt_nbrs_bb48);
        Value* cnt_nbrsv_49 = builder.CreateShl (cnt_nbrsv_46, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_50 = builder.CreateAdd (cnt_nbrsv_49, cnt_nbrsv_1, "", true, true);
        Value* cnt_nbrsv_51 = builder.CreateZExt(cnt_nbrsv_50, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_52 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_51);
        Value* cnt_nbrsv_53 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_52);
        Value* cnt_nbrsv_54 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_53, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_55 = builder.CreateZExt(cnt_nbrsv_54, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_56 = builder.CreateAdd (cnt_nbrsv_43, cnt_nbrsv_55, "", true, true);
        builder.CreateBr (cnt_nbrs_bb57);

         // ccnt_nbrs_bb57
        builder.SetInsertPoint (cnt_nbrs_bb57);
        PHINode* cnt_nbrsv_58 = builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        Value* cnt_nbrsv_59 = builder.CreateAdd (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 1), "", false, true);
        Value* cnt_nbrsv_60 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_59, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_60, cnt_nbrs_bb61, cnt_nbrs_bb70);

        // ccnt_nbrs_bb61
        builder.SetInsertPoint (cnt_nbrs_bb61);
        Value* cnt_nbrsv_62 = builder.CreateShl (cnt_nbrsv_59, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_63 = builder.CreateAdd (cnt_nbrsv_62, cnt_nbrsv_1, "", true, true);
        Value* cnt_nbrsv_64 = builder.CreateZExt(cnt_nbrsv_63, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_65 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_64);
        Value* cnt_nbrsv_66 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_65);
        Value* cnt_nbrsv_67 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_66, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_68 = builder.CreateZExt(cnt_nbrsv_67, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_69 = builder.CreateAdd (cnt_nbrsv_58, cnt_nbrsv_68, "", true, true);
        builder.CreateBr (cnt_nbrs_bb70);

         // ccnt_nbrs_bb70
        builder.SetInsertPoint (cnt_nbrs_bb70);
        PHINode* cnt_nbrsv_71 = builder.CreatePHI (Type::getInt32Ty(ctx), 3);
        Value* cnt_nbrsv_72 = builder.CreateAdd (cnt_nbrsv_1, ConstantInt::get (Type::getInt32Ty(ctx), 1), "", false, true);
        Value* cnt_nbrsv_73 = builder.CreateICmp (CmpInst::ICMP_UGT, cnt_nbrsv_72, ConstantInt::get (Type::getInt32Ty(ctx), 511));
        builder.CreateCondBr (cnt_nbrsv_73, cnt_nbrs_bb111, cnt_nbrs_bb74);

        // ccnt_nbrs_bb74
        builder.SetInsertPoint (cnt_nbrs_bb74);
        Value* cnt_nbrsv_75 = builder.CreateAdd (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), -1), "", false, true);
        Value* cnt_nbrsv_76 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_75, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_76, cnt_nbrs_bb77, cnt_nbrs_bb86);

         // ccnt_nbrs_bb77
        builder.SetInsertPoint (cnt_nbrs_bb77);
        Value* cnt_nbrsv_78 = builder.CreateShl (cnt_nbrsv_75, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_79 = builder.CreateAdd (cnt_nbrsv_78, cnt_nbrsv_72, "", true, true);
        Value* cnt_nbrsv_80 = builder.CreateZExt(cnt_nbrsv_79, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_81 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_80);
        Value* cnt_nbrsv_82 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_81);
        Value* cnt_nbrsv_83 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_82, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_84 = builder.CreateZExt(cnt_nbrsv_83, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_85 = builder.CreateAdd (cnt_nbrsv_71, cnt_nbrsv_84, "", true, true);
        builder.CreateBr (cnt_nbrs_bb86);

        // ccnt_nbrs_bb86
        builder.SetInsertPoint (cnt_nbrs_bb86);
        PHINode* cnt_nbrsv_87 = builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        Value* cnt_nbrsv_88 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_88, cnt_nbrs_bb89, cnt_nbrs_bb98);

        // ccnt_nbrs_bb89
        builder.SetInsertPoint (cnt_nbrs_bb89);
        Value* cnt_nbrsv_90 = builder.CreateShl (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_91 = builder.CreateAdd (cnt_nbrsv_90, cnt_nbrsv_72, "", true, true);
        Value* cnt_nbrsv_92 = builder.CreateZExt(cnt_nbrsv_91, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_93 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_92);
        Value* cnt_nbrsv_94 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_93);
        Value* cnt_nbrsv_95 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_94, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_96 = builder.CreateZExt(cnt_nbrsv_95, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_97 = builder.CreateAdd (cnt_nbrsv_87, cnt_nbrsv_96, "", true, true);
        builder.CreateBr (cnt_nbrs_bb98);

        // ccnt_nbrs_bb98
        builder.SetInsertPoint (cnt_nbrs_bb98);
        PHINode* cnt_nbrsv_99 = builder.CreatePHI (Type::getInt32Ty(ctx), 2);
        Value* cnt_nbrsv_100 = builder.CreateAdd (cnt_nbrsv_2, ConstantInt::get (Type::getInt32Ty(ctx), 1), "", false, true);
        Value* cnt_nbrsv_101 = builder.CreateICmp (CmpInst::ICMP_ULT, cnt_nbrsv_100, ConstantInt::get (Type::getInt32Ty(ctx), 256));
        builder.CreateCondBr (cnt_nbrsv_101, cnt_nbrs_bb102, cnt_nbrs_bb111);

        // ccnt_nbrs_bb102
        builder.SetInsertPoint (cnt_nbrs_bb102);
        Value* cnt_nbrsv_103 = builder.CreateShl (cnt_nbrsv_100, ConstantInt::get (Type::getInt32Ty(ctx), 9), "", true, true);
        Value* cnt_nbrsv_104 = builder.CreateAdd (cnt_nbrsv_103, cnt_nbrsv_72, "", true, true);
        Value* cnt_nbrsv_105 = builder.CreateZExt(cnt_nbrsv_104, Type::getInt64Ty(ctx));
        Value* cnt_nbrsv_106 = builder.CreateInBoundsGEP (Type::getInt32Ty(ctx), cnt_nbrsv_0, cnt_nbrsv_105);
        Value* cnt_nbrsv_107 = builder.CreateLoad (Type::getInt32Ty(ctx), cnt_nbrsv_106);
        Value* cnt_nbrsv_108 = builder.CreateICmp (CmpInst::ICMP_EQ, cnt_nbrsv_107, ConstantInt::get (Type::getInt32Ty(ctx), 1));
        Value* cnt_nbrsv_109 = builder.CreateZExt(cnt_nbrsv_108, Type::getInt32Ty(ctx));
        Value* cnt_nbrsv_110 = builder.CreateAdd (cnt_nbrsv_99, cnt_nbrsv_109, "", true, true);
        builder.CreateBr (cnt_nbrs_bb111);

        // ccnt_nbrs_bb111
        builder.SetInsertPoint (cnt_nbrs_bb111);
        PHINode* cnt_nbrsv_112 = builder.CreatePHI (Type::getInt32Ty(ctx), 3);
        builder.CreateRet(cnt_nbrsv_112);


        cnt_nbrsv_18->addIncoming (cnt_nbrsv_16, cnt_nbrs_bb9);
        cnt_nbrsv_18->addIncoming (ConstantInt::get (Type::getInt32Ty(ctx), 0), cnt_nbrs_bb6);

        cnt_nbrsv_30->addIncoming (cnt_nbrsv_28, cnt_nbrs_bb20);
        cnt_nbrsv_30->addIncoming (cnt_nbrsv_18, cnt_nbrs_bb17);

        cnt_nbrsv_43->addIncoming (cnt_nbrsv_30, cnt_nbrs_bb29);
        cnt_nbrsv_43->addIncoming (cnt_nbrsv_41, cnt_nbrs_bb33);
        cnt_nbrsv_43->addIncoming (ConstantInt::get (Type::getInt32Ty(ctx), 0), cnt_nbrs_entry_bb);

        cnt_nbrsv_58->addIncoming (cnt_nbrsv_56, cnt_nbrs_bb48);
        cnt_nbrsv_58->addIncoming (cnt_nbrsv_43, cnt_nbrs_bb45);

        cnt_nbrsv_71->addIncoming (cnt_nbrsv_58, cnt_nbrs_bb57);
        cnt_nbrsv_71->addIncoming (cnt_nbrsv_69, cnt_nbrs_bb61);
        cnt_nbrsv_71->addIncoming (cnt_nbrsv_43, cnt_nbrs_bb42);

        cnt_nbrsv_87->addIncoming (cnt_nbrsv_85, cnt_nbrs_bb77);
        cnt_nbrsv_87->addIncoming (cnt_nbrsv_71, cnt_nbrs_bb74);

        cnt_nbrsv_99->addIncoming (cnt_nbrsv_97, cnt_nbrs_bb89);
        cnt_nbrsv_99->addIncoming (cnt_nbrsv_87, cnt_nbrs_bb86);

        cnt_nbrsv_112->addIncoming (cnt_nbrsv_99, cnt_nbrs_bb98);
        cnt_nbrsv_112->addIncoming (cnt_nbrsv_110, cnt_nbrs_bb102);
        cnt_nbrsv_112->addIncoming (cnt_nbrsv_71, cnt_nbrs_bb70);


         ///////////////////////////////////////////// update_cell_state_func//////////////////////////////////////////
  
        // args
        Function::arg_iterator update_cell_state_func_args_it = update_cell_state_func->arg_begin();
        Value* update_cell_statev_0 = update_cell_state_func_args_it;
        Value* update_cell_statev_1 = ++update_cell_state_func_args_it;

        // basic blocks
        BasicBlock* update_cell_state_entry_bb = BasicBlock::Create (ctx, "", update_cell_state_func);

        // cupdate_cell_state_entry_bb
        builder.SetInsertPoint (update_cell_state_entry_bb);
        Value* update_cell_statev_3 = builder.CreateICmp (CmpInst::ICMP_EQ, update_cell_statev_0, ConstantInt::get (Type::getInt8Ty(ctx), 1));
        Value* update_cell_statev_4 = builder.CreateAdd (update_cell_statev_1, ConstantInt::get (Type::getInt32Ty(ctx), -4), "", false, true);
        Value* update_cell_statev_5 = builder.CreateICmp (CmpInst::ICMP_ULT, update_cell_statev_4, ConstantInt::get (Type::getInt32Ty(ctx), -2));
        Value* update_cell_statev_6 = builder.CreateAnd (update_cell_statev_3, update_cell_statev_5);
        Value* update_cell_statev_7 = builder.CreateICmp (CmpInst::ICMP_EQ, update_cell_statev_0, ConstantInt::get (Type::getInt8Ty(ctx), 0));
        Value* update_cell_statev_8 = builder.CreateICmp (CmpInst::ICMP_EQ, update_cell_statev_1, ConstantInt::get (Type::getInt32Ty(ctx), 3));
        Value* update_cell_statev_9 = builder.CreateAnd (update_cell_statev_7, update_cell_statev_8);
        Value* update_cell_statev_10 = builder.CreateSelect(update_cell_statev_9, ConstantInt::get (Type::getInt8Ty(ctx), 1), update_cell_statev_0 );
        Value* update_cell_statev_11 = builder.CreateSelect(update_cell_statev_6, ConstantInt::get (Type::getInt8Ty(ctx), 0), update_cell_statev_10 );
        builder.CreateRet(update_cell_statev_11);
        
// Dump LLVM IR

    module->print(outs(), nullptr);

  
// LLVM IR Interpreter

    outs() << "[EE] Run\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine* ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    
    ee->InstallLazyFunctionCreator([&](const std::string& fnName) -> void* {
        if (fnName == "simRand") {
            return reinterpret_cast<void *>(simRand);
        }
        if (fnName == "simPutPixel") {
            return reinterpret_cast<void *>(simPutPixel);
        }
        if (fnName == "simFlush") {
            return reinterpret_cast<void *>(simFlush);
        }

        return nullptr;
    });

    ee->finalizeObject();

    simInit();

    ArrayRef<GenericValue> noargs;
    GenericValue v = ee->runFunction(app_func, noargs);
    outs() << "[EE] Result: " << v.IntVal << "\n";

    simExit();

    return 0;
}