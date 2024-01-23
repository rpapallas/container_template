.PHONY: sandbox-build sandbox-run sandbox-write img-build img-run
GPU_OPTION := $(shell lspci | grep -qi nvidia && echo '--nv' || echo '')
COMMON_BINDS := --bind=/etc/hosts --bind=/etc/localtime --bind=/proc --bind=/sys --bind=/dev --bind=scripts:/scripts -B /tmp -B ${XDG_RUNTIME_DIR} --bind=home:${HOME}

sandbox-build:
	@singularity build --fakeroot --sandbox CONTAINER_NAME Singularity

sandbox-run:
	@rm -rf workdir/*
	@singularity run --contain $(GPU_OPTION) $(COMMON_BINDS) --workdir=workdir CONTAINER_NAME

sandbox-write:
	@singularity shell --fakeroot --writable CONTAINER_NAME

img-build:
	@singularity build --fakeroot CONTAINER_NAME.simg Singularity

img-run:
	@singularity shell $(GPU_OPTION) -B /tmp -B ${XDG_RUNTIME_DIR} CONTAINER_NAME.simg
