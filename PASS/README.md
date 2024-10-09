
Using LLVM-14

```bash
clang++ PassLog.cpp -fPIC -shared -I$(llvm-config --includedir) -o lib/libPassLog.so
clang ../SDL/app.c -emit-llvm -S -O2 -o IR/app.ll
opt-14 --load-pass-plugin lib/libPassLog.so --passes=PassLog IR/app.ll -o IR/appLog.ll -S
clang IR/appLog.ll ../SDL/sim.c ../SDL/start.c Log.c -O2 -lSDL2 
```
Launch app + log into a file 
``` bash
./a.out > logs/logs.dat
```

Create statistics file
```bash
python3 pythonAnalyse/logStats.py
```

Create Plot
```bash
python3 pythonAnalyse/createPlot.py
```

All plots in png/
