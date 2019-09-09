#################################
#
# Makefile for idism.pl
#
# !! NEED for make !!
# byacc: Berkeley yacc version 1.8.2 (C or perl)
#
# !! NEED for run !!
# perl: perl 4.0.1.8 later
#

#################################
# Commands
SHELL	=/bin/sh
MV	=/bin/mv
RM	=/bin/rm
CP	=/bin/cp
CHMOD	=/bin/chmod
CHGRP	=/bin/chgrp
TAR	=/usr/bin/tar
# yacc must be Berkeley yacc version 1.8.2 (C or perl) later!!
YACC	=/usr/local/bin/byacc

#################################
# Install
BINDIR  =/usr/local/share/bin
INSTALL_MODE = 0755
INSTALL_GRP = local

#################################
ARCFILE	=idism.tar

#################################
# Files
MAIN	= idism.pl
SUB	= yylex.pl syntax.pl 
HEADER  = idism.ph config.ph syntax.ph
TARGET	= $(MAIN) $(SUB) $(HEADER)
GENS	= syntax.pl syntax.ph
JUNK	= y.code.pl
SYNTAX	= syntax.y
DOCS	= README INSTALL idism.hlp

#################################
# Rules
all: $(TARGET)
	@echo
	@echo "  !! NECESSARY before INSTALL !!"
	@echo "  1. Change perl's path at top line of 'idism.pl'."
	@echo "  2. Change i-dic default path at 'config.ph'."
	@echo

syntax.pl: $(SYNTAX)
	$(YACC) -d -P $(SYNTAX)
	$(MV) y.tab.pl syntax.pl
	$(MV) y.tab.ph syntax.ph

syntax.ph: syntax.pl

#################################
# Maintenance
clean:
	$(RM) -f $(GENS) $(JUNK)

install: $(TARGET)
	$(CP) $(TERGET) $(BINDIR)
	$(CHGRP) $(INSTALL_GRP) $(TARGET)
	$(CHMOD) $(INSTALL_MODE) $(MAIN)

tar: $(TARGET) Makefile $(SYNTAX)
	$(TAR) cvf $(ARCFILE) $(DOCS) Makefile $(TARGET) $(SYNTAX)
