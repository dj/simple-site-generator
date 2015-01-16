PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# Use spaces instead of tabs
.RECIPEPREFIX != ps

src_dir := src/
build_dir := build/

src_html := src/**/*.html
build_html := $(shell find src -name '*.html' | sed 's/src/build/')

.PHONY: clean build stylesheets

setup: clean build stylesheets

build:
	@rsync -r --exclude='*.scss' --exclude='*.jade' src/ build/
	@echo 'Copying files to build...'	

stylesheets:
	@compass compile --sass-dir "src/stylesheets" --css-dir "build/stylesheets" --javascripts-dir "scripts" --images-dir "src/images"
	@echo 'Compiled sass...'

templates:
	@find src -type d | xargs jade --out build/
	@echo 'Compiling jade templates...'

jadewatch:
	@find src -type d | xargs jade -w --out build/

sasswatch:
	@compass watch --sass-dir "src/stylesheets" --css-dir "build/stylesheets" --javascripts-dir "scripts" --images-dir "src/images"

clean:
	@rm -rf $(build_dir)
	@echo 'Cleaned old build...'

