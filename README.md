# C Build Fundamentals

A sandbox repo to play around with C fundamentals I've been scared to learn since 4ever due to convenience of IDEs and build tools.

This repo contains a simplistic attempt at a HAL (hardware abstraction layer) structure to blink an imaginary LED light (outputting the current state to the standard console out), building targets to both MacOS and Windows.

## Getting Started

### Set Up Windows Cross-Compilation

```
brew install mingw-w64
```

### Compile Targets

Compile for both Windows and MacOS:

```
make all 
```

Or individual targets:

```
make mac

make windows
```

Executables are available under `build/main` and `build/main.exe`

## Run Program

To run the application assuming a MacOS target, just execute:

```
make run
```

Feel free to compile each target separately and run their executables directly if you use another dev env:

```
./build/main.exe
```

## Handy Commands

### Show object file symbols

```
nm file.o
```

- T = defined function
- U = undefined (needs to be linked from another file)
- D = initialized data
- B = uninitialized data

### Disassemble object file and show sections

```
objdump -d file.o
```

## Next Steps

I could start exploring C unit tests: https://github.com/ThrowTheSwitch/Unity
