CFLAGS+=$(ARM64V35_CFLAGS)
ALIBS=$(addprefix arch-arm64/disassembler/,$(V35ARM64_OBJS))
RANLIB?=ranlib

all: disassembler
	$(MAKE) arm64dis.a

include deps.mk

clean:
	rm -rf disassembler arch-arm64 arm64dis.a

disassembler: arch-arm64
	-cd arch-arm64 && git checkout staging && git pull
	cp -rf arch-arm64/disassembler disassembler

$(ALIBS): disassembler

arch-arm64:
	git clone --depth=1 https://github.com/Vector35/arch-arm64

arm64dis.a: $(ALIBS)
	rm -f arm64dis.a
	$(AR) q arm64dis.a $(ALIBS)
	$(RANLIB) arm64dis.a
