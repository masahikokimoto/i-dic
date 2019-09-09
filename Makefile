# I-dic Makefile
VERSION   = 200705a

# tools
PERL = perl
SORT = sort
UNIQ = uniq

# Kanji filter
ETOSJ = nkf -s
#ETOSJ = jconv -es
JCONV = /usr/sony/bin/jconv	# only NEWS-OS

# fepcvt option
#FEPCVTOPT = -no_av	# discard AV

# wnn4 utility
ATOD = /usr/local/bin/Wnn4/atod

# canna utility
MKBINDIC = /usr/local/bin/canna/mkbindic

# emacs
EMACS = mule

#----------------------------------------------------------------------

# file name
I-DIC = i-dic
I-DIC-ALL = $(I-DIC) seimei
I-DIC-DIC = i-dic.dic
I-DIC-USR = i-dic.usr
I-DIC-T = idic.t

FEPCVT = $(PERL) -s fepcvt.pl -fep=$@ $(FEPCVTOPT) $(I-DIC-ALL)


all:
	@echo "Usage: make <fep-name>"
	@echo "Usage: make print FEP=<fep-name>"
	@echo "read INSTALL for more information."

seimei: $(I-DIC)
	$(PERL) split-seimei.pl $(I-DIC) | $(SORT) | $(UNIQ) > $@

print: $(I-DIC-ALL) config/$(FEP).pl config/$(FEP).tbl
	@$(PERL) -s fepcvt.pl -fep=$(FEP) $(FEPCVTOPT) $(I-DIC-ALL)

wnn4: $(I-DIC-ALL) config/wnn4.pl config/wnn4.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ATOD) $(I-DIC-USR)

wnn6: $(I-DIC-ALL) config/wnn6.pl config/wnn6.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ATOD) $(I-DIC-USR)

atok6: $(I-DIC-ALL) config/atok6.pl config/atok6.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

atok7: $(I-DIC-ALL) config/atok7.pl config/atok7.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

wxp: $(I-DIC-ALL) config/wxp.pl config/wxp.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

mttk: $(I-DIC-ALL) config/mttk.pl config/mttk.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

egb: $(I-DIC-ALL) config/egb.pl config/egb.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

sj3: $(I-DIC-ALL) add-sj3dic config/sj3.pl config/sj3.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(JCONV) | add-sj3dic

add-sj3dic: add-sj3dic.c
	$(CC) -O add-sj3dic.c -o add-sj3dic -lsj3lib

kotoeri: $(I-DIC-ALL) config/kotoeri.pl config/kotoeri.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) > $@

canna: $(I-DIC-ALL) config/canna.pl config/canna.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) > $(I-DIC-T)

canna-install: canna
	$(MKBINDIC) $(I-DIC-T)

canna35: $(I-DIC-ALL) config/canna35.pl config/canna35.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) > $(I-DIC-T)

canna35-install: canna35
	$(MKBINDIC) $(I-DIC-T)

wx2p: $(I-DIC-ALL) config/wx2p.pl config/wx2p.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

atok8: $(I-DIC-ALL) config/atok8.pl config/atok8.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

vjeg: $(I-DIC-ALL) config/vjeg.pl config/vjeg.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

egb6: $(I-DIC-ALL) config/egb6.pl config/egb6.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

atok9: $(I-DIC-ALL) config/atok9.pl config/atok9.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

atok11: $(I-DIC-ALL) config/atok11.pl config/atok11.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

ime95: $(I-DIC-ALL) config/ime95.pl config/ime95.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

ime97: $(I-DIC-ALL) config/ime97.pl config/ime97.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

ime2000: $(I-DIC-ALL) config/ime2000.pl config/ime2000.tbl
	$(FEPCVT) | $(SORT) | $(UNIQ) | $(ETOSJ) > $(I-DIC-DIC)

idic-client.elc: idic-client.el
	$(EMACS) -batch -f batch-byte-compile $?

#------------ admin -------------
FILES = README INSTALL FAQ abbrev i-conv.pl tag.def genre fepcvt.pl i-grep.pl \
	tagtab.pl tabtag.pl $(I-DIC) tv-stn rd-stn new-old.sed \
	old-new.sed newdata.pl
FILES2 = config/*.tbl config/*.pl
FILES3 = idism/*
UNIX_FILES = Makefile add-sj3dic.c split-seimei.pl
TOOLS_FILES = idencode.pl merge.pl split.pl

LFTOCRLF = $(PERL) -lne 'print "$$_\r";'
FSTOLF = $(PERL) -ane 'print join("\n",@F)."\n";'
LFTOCR = $(PERL) -lne 'print "$$_\n";'
DOWNCASE = tr 'A-Z' 'a-z'
DISTDIR = i-dic-$(VERSION)
DISTDIR_S = idc$(VERSION)

MANIFEST: $(FILES) $(FILES2) $(FILES3) $(UNIX_FILES)
	echo $(FILES) $(FILES2) $(FILES3) $(UNIX_FILES) $@ | $(FSTOLF) | $(SORT) > $@

manifest:
	echo $(FILES) $(FILES2) $@ make.bat seimei | $(FSTOLF) | $(ODOWNCASE) \
		| $(SORT) > $@

make.bat:
	echo 'jperl -s fepcvt.pl -fep=%1 %2 $(I-DIC-ALL) > $(I-DIC-DIC)' > $@

dist: $(FILES) $(FILES2) $(FILES3) $(UNIX_FILES) MANIFEST
	rm -rf $(DISTDIR)
	mkdir $(DISTDIR) $(DISTDIR)/config $(DISTDIR)/idism
	ln $(FILES) $(UNIX_FILES) MANIFEST $(DISTDIR)
	ln $(FILES2) $(DISTDIR)/config
	ln $(FILES3) $(DISTDIR)/idism
	tar czvhf i-dic-$(VERSION).tar.gz `sed 's/^/$(DISTDIR)\//' MANIFEST`
	rm -rf $(DISTDIR)

dosdist: $(FILES) $(FILES2) MANIFEST make.bat seimei
	rm -rf $(DISTDIR_S)
	mkdir  $(DISTDIR_S) $(DISTDIR_S)/config
	for f in $(FILES) $(FILES2) MANIFEST make.bat seimei Makefile add-sj3dic.c split-seimei.pl; \
	do \
		nkf -e $$f > $(DISTDIR_S)/`echo $$f | $(DOWNCASE)`; \
	done
	rm -f idc$(VERSION).lzh
	lha ateo5 idc$(VERSION).lzh idc$(VERSION)
	rm -rf $(DISTDIR_S)
	rm -f make.bat

encode:
	uuencode i-dic-$(VERSION).tar.gz i-dic-$(VERSION).tar.gz > i-dic-$(VERSION).tar.gz.uue
	ish idc$(VERSION).lzh -s7 -*

README.1st: README
	$(ETOSJ) $? | $(LFTOCRLF) > $@

README.2nd: README.2
	$(ETOSJ) $? | $(LFTOCRLF) > $@

README.1st.mac: README
	$(ETOSJ) $? | $(LFTOCR) > $@

README.2nd.mac: README.2
	$(ETOSJ) $? | $(LFTOCR) > $@

tag:
	mkdir $@
	(cd $@; $(PERL) ../split.pl < ../$(I-DIC); \
	ln -s ../tag.def .; \
	for f in *.tab; \
	do \
		echo $$f; \
		$(PERL) ../tabtag.pl $$f > `basename $$f b`g; \
	done; \
	rm *.tab)

diff: $(FILES) $(FILES2) $(FILES3) $(UNIX_FILES) MANIFEST
	rm -f diff
	-for f in $(FILES) $(FILES2) $(FILES3) $(UNIX_FILES); \
	do diff -Nu $(OLD_DIR)/$$f $$f >> diff; done

clean-canna:
	rm -f $(I-DIC-T)
	rm -f idic.ctd idic.cbd idic.cld
	rm -f idic.d idic.fq

clean: clean-canna
	rm -f $(I-DIC-USR) $(I-DIC-DIC) add-sj3dic seimei \
		idic.tbl idic.yomi idic.hyouki *.lzh *.tar.gz *~

update: 
	mv -f i-dic.tag.8 i-dic.tag.9
	mv -f i-dic.tag.7 i-dic.tag.8
	mv -f i-dic.tag.6 i-dic.tag.7
	mv -f i-dic.tag.5 i-dic.tag.6
	mv -f i-dic.tag.4 i-dic.tag.5
	mv -f i-dic.tag.3 i-dic.tag.4
	mv -f i-dic.tag.2 i-dic.tag.3
	mv -f i-dic.tag.1 i-dic.tag.2
	mv -f i-dic.tag.0 i-dic.tag.1
	mv -f i-dic.tag   i-dic.tag.0
	nkf -e i-dic.tag.aa i-dic.tag.ab i-dic.tag.ac i-dic.tag.ad > i-dic.tag
	./tagtab.pl i-dic.tag | nkf -j | sort | nkf -e > i-dic.work
	mv -f i-dic.8 i-dic.9
	mv -f i-dic.7 i-dic.8
	mv -f i-dic.6 i-dic.7
	mv -f i-dic.5 i-dic.6
	mv -f i-dic.4 i-dic.5
	mv -f i-dic.3 i-dic.4
	mv -f i-dic.2 i-dic.3
	mv -f i-dic.1 i-dic.2
	mv -f i-dic.0 i-dic.1
	mv -f i-dic   i-dic.0
	./idencode.pl i-dic.work | nkf -j | sort | nkf -e > i-dic.all
	./tabtag.deny.pl

denylist.tag: denylist.tab
	./tabtag.pl < denylist.tab > denylist.tag

dosout: README.1st README.2nd
	for f in atok6 atok7 wxp mttk egb wx2p atok8 vjeg egb6 atok9 atok11 ime95 ime97 ime2000;\
	do \
		make $$f ; \
		lha ao5 $$f.lzh i-dic.dic README.1st README.2nd ; \
		rm i-dic.dic ; \
	done

macout: README.1st.mac README.2nd.mac
	for f in kotoeri ;\
	do \
		make $$f ; \
		lha ao5 $$f.lzh kotoeri README.1st.mac README.2nd.mac ; \
		rm kotoeri ; \
	done

split:
	split -100000 i-dic.tag.new i-dic.tag.
