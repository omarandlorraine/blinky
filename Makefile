%.blif: %.v
	yosys -p "synth_ice40 -top top -blif $@" $< | tee logs/yosys.log

%.asc: %.blif
	arachne-pnr -d 8k -p ice40hx8k.pcf $< -o $@ | tee logs/arachne-pnr.log

%.bin: %.asc ice40hx8k.pcf
	icepack $< $@ | tee logs/icepack.log

.PHONY: build
build: blinky.bin

.PHONY: flash
flash: build
	iceFUNprog -P /dev/ttyACM0 blinky.bin

.PHONY: clean
clean:
	rm -rf blinky.asc blinky.blif blinky.bin

