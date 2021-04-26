all: prepare build test

prepare:
	@echo ">>> $@ >>>"
	cd .site && npm install --save-dev @11ty/eleventy markdown-it-anchor @11ty/eleventy-navigation
	cd .site && wget -q https://github.com/untitaker/hyperlink/releases/download/0.1.13/hyperlink-linux-x86_64 -O _tools/hyperlink && chmod +x _tools/hyperlink

build:
	@echo ">>> $@ >>>"
	cd .site && npx @11ty/eleventy

dev:
	@echo ">>> $@ >>>"
	cd .site && npx @11ty/eleventy --serve

test:
	@echo ">>> $@ >>>"
	.site/_tools/hyperlink .site/_output --check-anchors --sources=.

clean:
	@echo ">>> $@ >>>"
	rm -rf .site/_output

publish: build
	@echo ">>> $@ >>>"
	echo "todo"
