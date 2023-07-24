build: TNND-tag-errors.xslt clean
	@echo All up to date

TNND-tag-errors.xslt: ../output/check_data.xml ../output/static-var.xml ../output/sfm-var.xml var-string.xslt 
	@echo Updating TNND-tag-errors.xslt
	@java -jar "D:\programs\xrunner\tools\saxon\saxon9he.jar" -o:"D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\TNND-tag-errors.xslt" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\check_data.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\data2xslt-v4.xslt"

../output/check_data.xml: ../source/check_data.tsv
	@echo Updating check_data.xml
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "tsv2xml-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\check_data.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\check_data.tsv"

../output/static-var.xml: ../source/static-var.tsv
	@echo Updating static-var.xml
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "tsv2xml-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\static-var.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\static-var.tsv"

../output/sfm-var.xml: ../source/sfm-var.tsv
	@echo Updating sfm-var.xml
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "tsv2xml-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\output\sfm-var.xml" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\sfm-var.tsv"

var-string.xslt: ../source/var-string.tsv
	@echo Updating var-string.xslt
	@"D:\programs\xrunner2\tools\cct\Ccw64.exe" -u -b -q -n -t "list2xsltvar-v2.cct" -o "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\scripts\var-string.xslt" "D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\source\var-string.tsv"

../source/check_data.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ check_data.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" "..\source\check_data.tsv" > nul & @echo Moved check_data.tsv

../source/static-var.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ static-var.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" ..\source\static-var.tsv > nul & @echo Moved static-var.tsv

../source/sfm-var.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ sfm-var.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" ..\source\sfm-var.tsv > nul & @echo Moved sfm-var.tsv

../source/var-string.tsv: $(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ var-string.tsv
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" copy /y "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" ..\source\var-string.tsv > nul & @echo Moved var-string.tsv

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ check_data.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" (@echo updating check_data from download ) else (@echo ... no new check_data )

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ static-var.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" (@echo updating static-var from download ) else (@echo ... no new static-var )

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ sfm-var.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" (@echo updating sfm-var from download ) else (@echo ... no new sfm-var )

$(USERPROFILE)/Downloads/TNND\ Views\ for\ Paratext\ -\ var-string.tsv:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" (@echo updating var-string from download ) else (@echo ... no new var-string )


clean:
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - var-string.tsv" 
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - sfm-var.tsv"
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - static-var.tsv"
	@if exist "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv" del "$(USERPROFILE)\Downloads\TNND Views for Paratext - check_data.tsv"

