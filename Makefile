PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

# Use spaces instead of tabs
.RECIPEPREFIX != ps

src_html := $(shell find src -name '*.jade' -not -path 'src/scaffolds/*')
build_html := $(patsubst src/%.jade, build/%.html, $(src_html))

src_md	 := $(shell find src -name '*.md')
build_md := $(patsubst src/%.md, src/%.html, $(src_md))

.PHONY: all clean copy jade markdown post stylesheets watch

all: clean copy markdown jade stylesheets

# Copy files that don't need processing
copy:
	@cp -r src/fonts src/img src/resume.pdf build/
	@echo 'Files copied...'

jade: $(build_html)

build/%.html: src/%.jade
	@mkdir -p "$(@D)"
	@jade $< --out $(@D)

# Since Jade filters escape HTML, process all md files
# Then Jade files can include the HTML as plaintext
markdown: $(build_md)

src/%.html: src/%.md
	@mkdir -p "$(@D)"
	@cat $< | marked -o $@

stylesheets:
	@compass compile --sass-dir "src/stylesheets" --css-dir "build/stylesheets" --javascripts-dir "scripts" --images-dir "src/images"
	@echo 'Compiled sass...'

clean:
	@rm -rf build/
	@mkdir build/
	@echo 'Cleaned build/'

# Run the build process whenever a file is changed in src/
watch:
	@watch 'make stylesheets' src/stylesheets/ --wait=1

# Blogging Tasks #
# ============== #

# Create new posts
# ex:
# 	make post NAME='post-title-with-hyphens'
post:
	@mkdir -p src/blog/$(NAME)
	@mkdir -p src/scaffolds
	@cp src/scaffolds/post/index.jade src/scaffolds/post/post.md src/scaffolds/post/_blurb.md src/blog/$(NAME)/
	# Add the blurb to the list of blog posts
	@echo '    include blog/$(NAME)/_blurb.html' >> src/index.jade
	@echo '    include $(NAME)/_blurb.html' >> src/blog/index.jade

