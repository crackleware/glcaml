LIBDIR=lib
SRCDIR=examples
BINDIR=bin
LIBS=graphics unix bigarray
GL_SOURCE=$(LIBDIR)/glcaml_stub.c $(LIBDIR)/glcaml.mli $(LIBDIR)/glcaml.ml

CLIBS=SDL SDL_mixer GLEW
SDL_SOURCE=$(LIBDIR)/sdl_stub.c $(LIBDIR)/sdl.mli $(LIBDIR)/sdl.ml $(LIBDIR)/sdl_mixer_stub.c $(LIBDIR)/sdl_mixer.mli $(LIBDIR)/sdl_mixer.ml

ifdef NOSDLMIXER
CLIBS=SDL GLEW
SDL_SOURCE=$(LIBDIR)/sdl_stub.c $(LIBDIR)/sdl.mli $(LIBDIR)/sdl.ml
endif

EXAMPLE=$(SRCDIR)/$(MLFILE).ml
CC=gcc
SOURCES=$(WIN_SOURCE) $(SDL_SOURCE) $(GL_SOURCE) $(EXAMPLE)
RESULT=$(BINDIR)/$(MLFILE)
-include OCamlMakefile

# vim: set syn=make :
