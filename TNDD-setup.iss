; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Paratext TNDD Views"
#define MyAppVersion "0.1"
#define MyAppPublisher "SILAisaPub"
#define MyAppURL "https://github.com/SILAsiaPub/PT-Views/tree/master/TNDD"
#define MPP "{code:GetPTProjectFolder}"
#define MAppData "C:\Users\Public\PT-Views\TNDD"
#define MAppManager "C:\Users\Public\PT-Views"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D3DD814B-A3C5-4EA1-9E1B-A8C3C1B37DB1}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={#MPP}\Views
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=Yes
LicenseFile=D:\All-SIL-Publishing\github-SILAsiaPub\PT-Views-svn\trunk\LICENSE
InfoAfterFile=D:\All-SIL-Publishing\github-SILAsiaPub\PT-Views-svn\trunk\TNDD\info.md
OutputDir=D:\All-SIL-Publishing\github-SILAsiaPub\PT-Views-svn\trunk\Installers
OutputBaseFilename=Paratext-TNDD-Views-installer
Compression=lzma
SolidCompression=yes

;SignTool=$qC:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x64\signtool.exe$q sign /a /n $qSIL Asia Publishing$q /t http://timestamp.comodoca.com/authenticode /d $qParatext TNDD Views$q $f


[Files]
Source: "TNDD\*.xml"; DestDir: "{app}"
Source: "TNDD\*.xml"; DestDir: "{#MAppData}"
Source: "TNDD\*.xslt"; DestDir: "{app}"
Source: "TNDD\*.xslt"; DestDir: "{#MAppData}"
Source: "common\cms\*.py"; DestDir: "{#MPP}\cms"
Source: "common\cms\*.py"; DestDir: "{#MAppData}\cms"
Source: "TNDD\cms\*.cms"; DestDir: "{#MPP}\cms"
Source: "TNDD\cms\*.cms"; DestDir: "{#MAppData}\cms"
Source: "TNDD\cms\TNDD-info.pdf"; DestDir: "{#MPP}\cms"
Source: "TNDD\info.md"; DestDir: "{#MPP}\cms"
Source: "user-views-manager.cmd"; DestDir: "{#MAppManager}"
Source: "TNDD\Uninstall*.cmd"; DestDir: "{#MAppData}"
Source: "TNDD\install*.cmd"; DestDir: "{#MAppData}"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Code]
function GetPTProjectFolder(Default: String): String;
  {function to get the runtime install folder}
  var ResultStr: String;
  begin
    Result:='{app}';
    if RegQueryStringValue(HKLM,'SOFTWARE\WOW6432Node\Paratext\8','Settings_Directory',ResultStr) then
       Result:=ResultStr
    else if RegQueryStringValue(HKLM,'SOFTWARE\WOW6432Node\Paratext\9','Settings_Directory',ResultStr) then
       Result:=ResultStr
     else
       Result:='C:\My Paratext 8 Projects';
    end;  
  end.
