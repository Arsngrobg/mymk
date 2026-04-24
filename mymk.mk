#                                 ,──.
#    ,──,──,──.,──. ,──.,──,──,──.│  │,─.
#    │        │ ╲  '  ╱ │        ││     ╱
#    │  │  │  │  ╲   '  │  │  │  ││  ╲  ╲
#    `──`──`──'.─'  ╱   `──`──`──'`──'`──'
#              `───'
#    Standardized, cross-platform GNU Make

# BUILD SYSTEM
BUILDDIR ?= build
OBJDIR   := $(BUILDDIR)/obj
LIBDIR   := $(BUILDDIR)/lib
BINDIR   := $(BUILDDIR)/bin

# SHELL UTILITIES
ifdef ComSpec
PATHSEP := $()\$()
MKDIR   := mkdir
RMDIR   := rmdir /Q /S
RM      := del
else
PATHSEP := /
MKDIR   := mkdir -p
RMDIR   := rm -rf
RM      := rm -f
endif
LOG     := echo make:

# COMPILER
CC      ?= cc
CFLAGS  ?= -std=c11 -O2 -Wall -Wextra -Werror -Wpedantic

# COMMON RECIPES
%/:
	@$(LOG) Creating $@ directory
	@$(MKDIR) $(subst /,$(PATHSEP),$@)
