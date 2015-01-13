PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# Use spaces instead of tabs
.RECIPEPREFIX != ps

src_files := src/
build_dir := build/

build/main.js: $(src_files)
	mkdir -p $(dir $@)
	@echo "Making $@..."

