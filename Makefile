PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# Use spaces instead of tabs
.RECIPEPREFIX != ps

src_dir := src/
build_dir := build/

src_html := %.html
build_html := $(src_html:%.html=build/%.html)

.PHONY: setup build

setup: clean build

# Copy the dir tree from src to build
build:
	$(shell find src -type d | sed 's/src/build/' | xargs mkdir -p)

$(build_html): $(src_html)
	@echo "Copying html..."
	cp $< $@

clean:
	@rm -rf $(build_dir)
	@echo "Clean complete..."
	
	@echo $(src_html)
	@echo $(build_html)
