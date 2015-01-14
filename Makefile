PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# Use spaces instead of tabs
.RECIPEPREFIX != ps

src_dir := src/
build_dir := build/

src_html := src/**/*.html
build_html := $(shell find src -name '*.html' | sed 's/src/build/')

.PHONY: setup build

setup: clean build

# copy src/ to build/, ignoring files that need processing
build:
	@rsync -r --exclude='*.scss' src/ build/
	@echo 'Copying files to build...'	

clean:
	@rm -rf $(build_dir)
	@echo 'Cleaned old build...'

