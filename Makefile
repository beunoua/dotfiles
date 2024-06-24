
STOW_FOLDERS := bin git personal starship zsh nvim oh-my-zsh
STOW ?= $(shell command -v stow)


# OS detection.
OS := $(shell uname)
ifeq ($(OS), Darwin)
	OS := macos
else ifeq ($(OS), Linux)
	OS := linux
else
    $(error Unsupported operating system: $(OS))
endif

export XDG_CONFIG_HOME = $(HOME)/.config


all: check_stow xdg_config clean-stow
	$(STOW) -t $(HOME) $(STOW_FOLDERS)


xdg_config:
	mkdir -p $(XDG_CONFIG_HOME)

clean-stow:
	$(STOW) -D $(STOW_FOLDERS)

check_stow:
	@[ $(STOW) ] || ( echo "ERROR: stow not found. Please install stow"; exit 1 )


clean: clean-stow
