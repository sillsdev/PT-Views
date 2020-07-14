@echo off
echo Writing default XML file to go with a created Paratext custom view
set source=%1
if not defined source echo You must provide the name of the xslt file as a parameter. & exit
set namepart=%source:.xslt=%
echo ^<?xml version="1.0" encoding="utf-8"?^> > %namepart%.xml
echo ^<ScriptureViewSettings^> >> %namepart%.xml
echo   ^<EditMode^>PartiallyEditableText^</EditMode^> >> %namepart%.xml
echo   ^<UseMarkerPopup^>false^</UseMarkerPopup^> >> %namepart%.xml
echo   ^<AllowsAnnotations^>false^</AllowsAnnotations^> >> %namepart%.xml
echo   ^<AllowsInsertComments^>false^</AllowsInsertComments^> >> %namepart%.xml
echo   ^<AllowsInsertNotes^>false^</AllowsInsertNotes^> >> %namepart%.xml
echo   ^<AllowsBackslash^>false^</AllowsBackslash^> >> %namepart%.xml
echo   ^<AllowsEnter^>false^</AllowsEnter^> >> %namepart%.xml
echo   ^<AllowsUsfmInsert^>false^</AllowsUsfmInsert^> >> %namepart%.xml
echo   ^<StyleDropdownEnabled^>false^</StyleDropdownEnabled^> >> %namepart%.xml
echo   ^<DisplayOrder^>500^</DisplayOrder^> >> %namepart%.xml
echo ^</ScriptureViewSettings^> >> %namepart%.xml
start %namepart%.xml

