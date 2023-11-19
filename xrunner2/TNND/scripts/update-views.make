ptxspath := D:/My\ Paratext\ 9\ Projects
ptxpath := D:\My Paratext 9 Projects
projspath := D:/All-SIL-Publishing/_xrunner2_projects/Bible/ParatextViews/TNND
projpath := D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND
gh-slocal := D:/All-SIL-Publishing/Github-sillsdev/PT-Views/trunk
gh-local := D:\All-SIL-Publishing\Github-sillsdev\PT-Views\trunk
prince := C:\programs\prince-15.1-win64\bin\prince.exe
green := [32m
reset := [0m
cyan := [36m



update-all: $(ptxspath)/Views/TNND-tag-errors.xslt $(gh-slocal)\TNND\TNND-tag-errors.xslt $(ptxspath)/Views/TNND-tag-errors.xslt.txt $(ptxspath)/Views/TNND-word-count.xslt $(gh-slocal)/TNND/cms/TNND-info.pdf $(gh-slocal)\xrunner2\TNND\scripts\data2xslt-cur.xslt $(gh-slocal)\xrunner2\TNND\scripts\TNND-tag-errors.make $(gh-slocal)\xrunner2\TNND\scripts\update-views.make
	@echo %green%Info: All views updated.%reset%


$(ptxspath)/Views/TNND-tag-errors.xslt: $(projspath)/scripts/TNND-tag-errors.xslt
	@echo %cyan%Copying: Project TNND-tag-errors.xslt to PT/Views%reset%
	@copy $(projpath)\scripts\TNND-tag-errors.xslt "$(ptxpath)\Views\" > nul

$(gh-slocal)\TNND\TNND-tag-errors.xslt: $(projspath)/scripts/TNND-tag-errors.xslt
	@echo %cyan%Copying: Project TNND-tag-errors.xslt to local Github project%reset%
	@copy $(projpath)\scripts\TNND-tag-errors.xslt $(gh-local)\TNND\ > nul

$(ptxspath)/Views/TNND-tag-errors.xslt.txt: $(projspath)/scripts/TNND-tag-errors.xslt
	@echo %cyan%Copying: Project TNND-tag-errors.xslt to PT/Views as .txt file to share%reset%
	@copy $(projpath)\scripts\TNND-tag-errors.xslt "$(ptxpath)\Views\TNND-tag-errors.xslt.txt" > nul

$(ptxspath)/Views/TNND-word-count.xslt: $(projspath)/scripts/TNND-word-count.xslt
	@echo %cyan%Copying: Project TNND-word-count.xslt to PT/Views%reset%
	@xcopy /D $(projpath)\scripts\TNND-word-count.xslt "$(ptxpath)\Views\" > nul
	@echo %cyan%Copying: Project TNND-word-count.xslt to PT/Views as .txt file to share%reset%
	@xcopy /D $(projpath)\scripts\TNND-word-count.xslt "$(ptxpath)\Views\TNND-word-count.xslt.txt" > nul
	
$(gh-slocal)\TNND\TNND-word-count.xslt: $(projspath)\scripts\TNND-word-count.xslt
	@echo %cyan%Copying: Project TNND-word-count.xslt to local Github project%reset%
	@copy $(projpath)\scripts\TNND-word-count.xslt "$(gh-local)\TNND\" > nul

$(gh-slocal)/TNND/cms/TNND-info.pdf: $(gh-slocal)/TNND/TNND-info.pug $(gh-slocal)/TNND/info.md
	@echo %cyan%Converting TNND-info.md to PDF%reset%
	@mdpdf $(gh-local)\TNND\TNND-info.md
	@echo %cyan%Moving PDF to cms folder.%reset%
	@move $(gh-local)\TNND\TNND-info.pdf $(gh-local)\TNND\cms\ > nul

$(gh-slocal)\xrunner2\TNND\scripts\data2xslt-cur.xslt: data2xslt-cur.xslt
	@echo %cyan%Copying: Project data2xslt-cur.xslt to local Github project%reset%
	@copy data2xslt-cur.xslt "$(gh-local)\xrunner2\TNND\scripts\" > nul

$(gh-slocal)\xrunner2\TNND\scripts\TNND-tag-errors.make: TNND-tag-errors.make
	@echo %cyan%Copying: Project TNND-tag-errors.make to local Github project%reset%
	@copy TNND-tag-errors.make "$(gh-local)\xrunner2\TNND\scripts\" > nul

$(gh-slocal)\xrunner2\TNND\scripts\update-views.make: update-views.make
	@echo %cyan%Copying: Project update-views.make to local Github project%reset%
	@copy update-views.make "$(gh-local)\xrunner2\TNND\scripts\" > nul
