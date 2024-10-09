#include <llvm-14/llvm/Passes/PassBuilder.h>
#include <llvm-14/llvm/Passes/PassPlugin.h>
#include <llvm-14/llvm/IR/IRBuilder.h>

using namespace llvm;

struct PassLog : public PassInfoMixin<PassLog>
{
    bool isLogger(StringRef name)
    {
            return (name == "instructionLogger");
    }

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM)
    {
        for (auto &F : M)
        {
            // skip declarations and logger 
            if (isLogger(F.getName()) || F.isDeclaration())
            {
                    continue;
            }

            // prepare builder for IR modification 
            LLVMContext &ctx = F.getContext();
            IRBuilder<> builder(ctx);
            Type *logger_ret_type = Type::getVoidTy(ctx);

            // prepare the instruction logger 
            ArrayRef<Type *> instructionLogger_param_types = {builder.getInt8Ty()->getPointerTo()};
            FunctionType *instructionLogger_func_type =
            FunctionType::get(logger_ret_type, instructionLogger_param_types, false);
            FunctionCallee instructionLogger_func = M.getOrInsertFunction("instructionLogger", instructionLogger_func_type);

            // insert instruction logger 
            for (auto &B : F)
            {
                for (auto &I : B)
                {
                    if (dyn_cast<PHINode>(&I) == nullptr)
                    {
                        builder.SetInsertPoint(&I);

                        Value *op_name = builder.CreateGlobalStringPtr(I.getOpcodeName());
                        Value *args[] = {op_name};
                        builder.CreateCall(instructionLogger_func, args);
                    }
                }
            }
        }
        return PreservedAnalyses::none();
    }
};
PassPluginLibraryInfo getPassPluginInfo() 
{
    const auto callback = [](PassBuilder &PB) 
    {
        PB.registerPipelineParsingCallback([](StringRef name, ModulePassManager &MPM, auto) 
        {
            if (name == "PassLog") 
            {
                MPM.addPass(PassLog{});
                return true;
            }
            return false;
        });
    };
    return {LLVM_PLUGIN_API_VERSION, "PassLog", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
        return getPassPluginInfo();
}       
