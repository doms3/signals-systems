PDFLATEX_FLAGS = ""

CHAPTERS = $(foreach chapter_dir, $(sort $(dir $(wildcard chapters/*/))), $(patsubst %/, %, $(chapter_dir)))
CHAPTER_PDFS = $(foreach chapter_dir, $(CHAPTERS), $(chapter_dir)/source.pdf)
CHAPTER_LOGS = $(foreach chapter_dir, $(CHAPTERS), $(chapter_dir)/source.log)
CHAPTER_AUXS = $(foreach chapter_dir, $(CHAPTERS), $(chapter_dir)/source.aux)

all : $(CHAPTER_PDFS)

%.pdf : %.tex
	cd $(dir $@) && pdflatex $(PDFLATEX_FLAGS) $(notdir $^)

%/source.tex :
	cp source_template.tex $@

debug :
	echo $(CHAPTERS)
	echo $(CHAPTER_PDFS)

clean :
	$(RM) $(CHAPTER_PDFS) $(CHAPTER_LOGS) $(CHAPTER_AUXS)

.PHONY: all debug
.SILENT:
