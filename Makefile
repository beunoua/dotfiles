STOW_FOLDERS := alacritty git ohmyzsh nvim personal starship tmux zsh 
STOW ?= $(shell command -v stow)

XDG_CONFIG_HOME ?= $HOME/.config


all: check_stow xdg_config clean-stow
	$(STOW) -t $(HOME) $(STOW_FOLDERS)


clean-stow:
	$(STOW) -t $(HOME) -D $(STOW_FOLDERS)


clean: clean-stow


xdg_config:
	mkdir -p $(XDG_CONFIG_HOME)


check_stow:
	@[ $(STOW) ] || ( echo "ERROR: stow not found. Please install stow"; exit 1 )


help:
	@echo "Usage: make [xdg_config|clean-stow|check_stow|clean|help]"
