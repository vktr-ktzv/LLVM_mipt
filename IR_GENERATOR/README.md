#  IR Generator


## Usage:
```
clang++ $(llvm-config --cppflags --ldflags --libs) ../SDL/sim.c generator.cpp -o run -lSDL2
```

## Run:
```
./a.out  > generated_ir.log
```