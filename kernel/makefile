all : bzImage

linux :
	git clone -b v5.15 --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

bzImage : linux
	cp linux.config linux/.config
	cd linux && $(MAKE) LLVM=1

.PHONY : clean config

clean :
	cd linux && $(MAKE) clean LLVM=1

config : linux
	cd linux && $(MAKE) menuconfig LLVM=1