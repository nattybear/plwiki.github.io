.PHONY: all install serve clean

all: _shake/build
	_shake/build all

install: all
	cp -r ./site/* $(out)

serve: all
	serve ./site

clean:
	rm -rf _shake _build bin site

_shake/build: ./Shakefile.hs
	@mkdir -p ./_shake
	ghc ./Shakefile.hs -Wall -O3 -rtsopts -threaded -with-rtsopts=-IO -outputdir=_shake -o $@
