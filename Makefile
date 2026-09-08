BUILD_FOLDER        = build

SOURCE_FOLDER       = src
SOURCE_FILES        = $(shell find $(SOURCE_FOLDER) -name '*.c' -not -path '*/drivers/*')

MAC_EXECUTABLE      = $(BUILD_FOLDER)/main_MacOS
MAC_FOLDER          = $(BUILD_FOLDER)/mac
MAC_OBJECTS         = $(SOURCE_FILES:src/%.c=$(MAC_FOLDER)/%.o) $(MAC_FOLDER)/drivers/hal_simulator.o

WINDOWS_EXECUTABLE  = $(BUILD_FOLDER)/main_Windows.exe
WINDOWS_FOLDER      = $(BUILD_FOLDER)/windows
WINDOWS_OBJECTS     = $(SOURCE_FILES:src/%.c=$(WINDOWS_FOLDER)/%.o) $(WINDOWS_FOLDER)/drivers/hal_simulator.o

HARDWARE_EXECUTABLE = $(BUILD_FOLDER)/main_Hardware
HARDWARE_FOLDER     = $(BUILD_FOLDER)/hardware
HARDWARE_OBJECTS    = $(SOURCE_FILES:src/%.c=$(HARDWARE_FOLDER)/%.o) $(HARDWARE_FOLDER)/drivers/hal_hardware.o

CCFLAGS             = -Isrc/contracts

run: mac
	$(MAC_EXECUTABLE)

run_hardware: hardware
	$(HARDWARE_EXECUTABLE)

all: mac windows hardware

mac: $(MAC_OBJECTS)
	gcc $(CCFLAGS) $^ -o $(MAC_EXECUTABLE)

windows: $(WINDOWS_OBJECTS)
	x86_64-w64-mingw32-gcc $(CCFLAGS) $^ -o $(WINDOWS_EXECUTABLE)

hardware: $(HARDWARE_OBJECTS)
	gcc $(CCFLAGS) $^ -o $(HARDWARE_EXECUTABLE)

$(MAC_FOLDER)/%.o: src/%.c
	mkdir -p $(@D)
	gcc $(CCFLAGS) -c $< -o $@

$(WINDOWS_FOLDER)/%.o: src/%.c
	mkdir -p $(@D)
	x86_64-w64-mingw32-gcc $(CCFLAGS) -c $< -o $@

$(HARDWARE_FOLDER)/%.o: src/%.c
	mkdir -p $(@D)
	gcc $(CCFLAGS) -c $< -o $@

clean: 
	rm -rf $(MAC_FOLDER) $(WINDOWS_FOLDER) $(HARDWARE_FOLDER) $(MAC_EXECUTABLE) $(WINDOWS_EXECUTABLE) $(HARDWARE_EXECUTABLE)

.PHONY: run run_hardware all mac windows hardware clean

#$(info log=$(SOURCE_FILES))