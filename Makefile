PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# Use spaces instead of tabs
.RECIPEPREFIX != ps

src_html := $(shell find src -name '*.jade')
build_html := $(patsubst src/%.jade, build/%.html, $(src_html)) 

.PHONY: all build clean copy jade stylesheets watch

all: clean copy jade stylesheets

# Copy files that don't need processing
copy:
	@cp -r src/fonts src/img build/
	@echo 'Files copied...'

jade: $(build_html)

build/%.html: src/%.jade
	@mkdir -p "$(@D)"
	@jade $< --out $(@D)

stylesheets:
	@compass compile --sass-dir "src/stylesheets" --css-dir "build/stylesheets" --javascripts-dir "scripts" --images-dir "src/images"
	@echo 'Compiled sass...'

clean:
	@rm -rf build/ 
	@mkdir build/
	@echo 'Cleaned build/'

# Run the build process whenever a file is changed in src/
watch:
	@watch make src
