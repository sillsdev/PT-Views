ptxspath := D\:/My\ Paratext\ 9\ Projects
ptxpath := D:\My Paratext 9 Projects
projspath := D\:/All-SIL-Publishing/_xrunner2_projects/Bible/ParatextViews/TNND
projpath := D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND
gh-slocal := D\:\All-SIL-Publishing\Github-sillsdev\PT-Views\trunk
gh-local := D:\All-SIL-Publishing\Github-sillsdev\PT-Views\trunk
prince := C:\programs\prince-15.1-win64\bin\prince.exe
update-all: $(ptxspath)/Views/TNND-tag-errors.xslt $(gh-slocal)\TNND\TNND-tag-errors.xslt $(ptxspath)/Views/TNND-tag-errors.xslt.txt $(viewspath)/TNND-word-count.xslt $(gh-slocal)/TNND/cms/TNND-info.pdf $(gh-local)\TNND\TNND-info.html


$(ptxspath)/Views/TNND-tag-errors.xslt: $(projspath)/scripts/TNND-tag-errors.xslt
	copy $(projpath)\scripts\TNND-tag-errors.xslt "$(ptxpath)\Views\"

$(gh-slocal)\TNND\TNND-tag-errors.xslt: $(projspath)/scripts/TNND-tag-errors.xslt
	copy $(projpath)\scripts\TNND-tag-errors.xslt $(gh-local)\TNND\

$(ptxspath)/Views/TNND-tag-errors.xslt.txt: $(projspath)/scripts/TNND-tag-errors.xslt
	copy $(projpath)\scripts\TNND-tag-errors.xslt "$(ptxpath)\Views\TNND-tag-errors.xslt.txt"

$(viewspath)/TNND-word-count.xslt: $(projspath)/scripts/TNND-word-count.xslt
	copy $(projpath)\scripts\TNND-word-count.xslt "$(ptxpath)\Views\"
	copy $(projpath)\scripts\TNND-word-count.xslt "$(ptxpath)\Views\TNND-word-count.xslt.txt"
	copy $(projpath)\scripts\TNND-word-count.xslt $(gh-local)\TNND\

$(gh-slocal)/TNND/cms/TNND-info.pdf: $(gh-slocal)/TNND/TNND-info.pug $(gh-slocal)/TNND/info.md
	relaxed --bo $(gh-local)\TNND\TNND-info.pug
	move $(gh-local)\TNND\TNND-info.pdf $(gh-local)\TNND\cmd\
