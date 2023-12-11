xrunnerpath := C:/programs/xrunner2
java := D:\programs\javafx\bin\java.exe
saxon := C:\programs\xrunner2\tools\saxon\saxon12he.jar
ccw := C:\programs\xrunner2\tools\cct\Ccw64.exe
green := [32m
reset := [0m
cyan := [36m

build: scripts/TNND-tag-errors.xslt clean
	@echo $(green)Info: TNND-tag-errors up to date$(reset)

scripts/TNND-tag-errors.xslt: output/check_data.xml output/static-var.xml output/sfm-var.xml scripts/var-string.xslt scripts/data2xslt-cur.xslt scripts/project.xslt
	@echo $(cyan)Updating TNND-tag-errors.xslt$(reset)
	@"$(java)" -jar "D:\programs\xrunner\tools\saxon\saxon9he.jar" -o:"D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\TNND-tag-errors.xslt" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\check_data.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\data2xslt-cur.xslt"

output/check_data.xml: source/check_data.tsv
	@echo $(cyan)Updating check_data.xml$(reset)
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "tsv2xml-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\check_data.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\check_data.tsv"

output/static-var.xml: source/static-var.tsv
	@echo $(cyan)Updating static-var.xml$(reset)
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "tsv2xml-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\static-var.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\static-var.tsv"

output/sfm-var.xml: source/sfm-var.tsv
	@echo $(cyan)Updating sfm-var.xml$(reset)
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "tsv2xml-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\tmp\sfm-var1.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\sfm-var.tsv"
	@"$(java)" -jar "D:\programs\xrunner\tools\saxon\saxon9he.jar" -o:"D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\sfm-var.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\tmp\sfm-var1.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\sort-sfm-var.xslt"

scripts/var-string.xslt: source/var-string.tsv
	@echo $(cyan)Updating var-string.xslt$(reset)
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "list2xsltvar-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\var-string.xslt" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\var-string.tsv"

source/check_data.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ check_data.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" "..\source\check_data.tsv" > nul & @echo $(cyan)Moved check_data.tsv$(reset)

source/static-var.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ static-var.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" ..\source\static-var.tsv > nul & @echo $(cyan)Moved static-var.tsv$(reset)

source/sfm-var.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ sfm-var.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" ..\source\sfm-var.tsv > nul & @echo $(cyan)Moved sfm-var.tsv$(reset)

source/var-string.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ var-string.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" ..\source\var-string.tsv > nul & @echo $(cyan)Moved var-string.tsv$(reset)

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ check_data.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" (@echo $(cyan)updating check_data from download$(reset) ) else (@echo $(green)... no new check_data$(reset) )

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ static-var.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" (@echo $(cyan)updating static-var from download$(reset) ) else (@echo $(green)... no new static-var$(reset) )

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ sfm-var.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" (@echo $(cyan)updating sfm-var from download$(reset) ) else (@echo $(green)... no new sfm-var$(reset) )

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ var-string.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" (@echo $(cyan)updating var-string from download$(reset) ) else (@echo $(green)... no new var-string$(reset) )

scripts/project.xslt: project.txt
	@make --no-print-directory -f projxslt.make

project.txt: ;

TNND-tag-errors.make: ;

clean:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" 
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv"
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv"
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv"

