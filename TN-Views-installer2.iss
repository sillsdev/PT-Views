; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Paratext TN Views"
#define MyAppVersion "8"
#define MyAppPublisher "SIL International"
#define MyAppURL "https://github.com/sillsdev/PT-Views/"

#define MPP "{code:GetPTProjectFolder}"
#define MAppData "C:\Users\Public\PT-TN-Views"


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
LicenseFile=LICENSE
InfoAfterFile=TN-Views\installed.md
OutputDir=Installers
OutputBaseFilename=Paratext-TN-Views-unsigned
Compression=lzma
SolidCompression=yes

[Types]
Name: "full"; Description: "Install TN Views"

[Components]
Name: main; Description: "Install essential files"; Types: full; 

[Tasks]
Name: tnxd;     Description: "Make TNDD and TNND views available in Paratext";            Flags: exclusive;
Name: complete; Description: "Make TNDD, TNND, USX and SFM views available in Paratext";  Flags: exclusive unchecked;
Name: tndd;     Description: "Make TNDD views available in Paratext";                     Flags: exclusive unchecked;
Name: tnnd;     Description: "Make TNND views available in Paratext";                     Flags: exclusive unchecked;
Name: usx;      Description: "Make USX views available in Paratext"; Flags: exclusive unchecked;
Name: sfm;      Description: "Make SFM views available in Paratext"; Flags: exclusive unchecked;

[Files]
; main install all files to install dir
Source: "TN-Views\TN-views-manager.cmd";  DestDir: "{#MAppData}" ;        Components: main;
Source: "TN-Views\Uninstall*.cmd";        DestDir: "{#MAppData}"  ;       Components: main;
Source: "TN-Views\Install*.cmd";          DestDir: "{#MAppData}"  ;       Components: main;
Source: "TN-Views\Views\*.x*";            DestDir: "{#MAppData}\Views" ;  Components: main;
Source: "TN-Views\cms\*.*";               DestDir: "{#MAppData}\cms"  ;   Components: main;

; TN to PT
Source: "TN-Views\cms\*.pdf";           DestDir: "{#MPP}\cms"  ;    Components: main;
Source: "TN-Views\cms\TN_*.*";            DestDir: "{#MPP}\cms"  ;    Components: main;
Source: "TN-Views\cms\*.py";              DestDir: "{#MPP}\cms"  ;    Components: main;

; tnxd tasks
Source: "TN-Views\Views\TNDD*.x*";          DestDir: "{#MPP}\Views" ; Tasks: tnxd;
Source: "TN-Views\cms\TNDD_Views_hide.cms"; DestDir: "{#MPP}\cms" ;   Tasks: tnxd;
Source: "TN-Views\Views\TNND*.x*";          DestDir: "{#MPP}\Views" ; Tasks: tnxd;
Source: "TN-Views\cms\TNND_Views_hide.cms"; DestDir: "{#MPP}\cms" ;   Tasks: tnxd;
Source: "TN-Views\cms\USX_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: tnxd;
Source: "TN-Views\cms\SFM_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: tnxd;


; complete tasks
Source: "TN-Views\Views\TNDD*.x*";          DestDir: "{#MPP}\Views" ; Tasks: complete;
Source: "TN-Views\cms\TNDD_Views_hide.cms"; DestDir: "{#MPP}\cms" ;   Tasks: complete;
Source: "TN-Views\Views\TNND*.x*";          DestDir: "{#MPP}\Views" ; Tasks: complete;
Source: "TN-Views\cms\TNND_Views_hide.cms"; DestDir: "{#MPP}\cms" ;   Tasks: complete;
Source: "TN-Views\Views\USX*.x*";           DestDir: "{#MPP}\Views" ; Tasks: complete;
Source: "TN-Views\cms\USX_Views_hide.cms";  DestDir: "{#MPP}\cms" ;   Tasks: complete;
Source: "TN-Views\Views\SFM*.x*";           DestDir: "{#MPP}\Views" ; Tasks: complete;
Source: "TN-Views\cms\SFM_Views_hide.cms";  DestDir: "{#MPP}\cms" ;   Tasks: complete;

; TNDD to PT
Source: "TN-Views\Views\TNDD*.x*";          DestDir: "{#MPP}\Views" ; Tasks: tndd;
Source: "TN-Views\cms\TNDD_Views_hide.cms"; DestDir: "{#MPP}\cms" ;   Tasks: tndd;
Source: "TN-Views\cms\TNDD_Views_show.cms"; DestDir: "{#MPP}\cms" ;   Tasks: tndd;
Source: "TN-Views\cms\SFM_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: tndd;
Source: "TN-Views\cms\USX_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: tndd;


; TNND to PT
Source: "TN-Views\Views\TNND*.x*";          DestDir: "{#MPP}\Views" ; Tasks: tnnd;
Source: "TN-Views\cms\TNND_Views_hide.cms"; DestDir: "{#MPP}\cms" ;   Tasks: tnnd;
Source: "TN-Views\cms\TNND_Views_show.cms"; DestDir: "{#MPP}\cms" ;   Tasks: tnnd;
Source: "TN-Views\cms\SFM_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: tnnd;
Source: "TN-Views\cms\USX_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: tnnd;

; USX  tasks
Source: "TN-Views\Views\USX*.x*";           DestDir: "{#MPP}\Views" ; Tasks: usx;
Source: "TN-Views\cms\USX_Views_hide.cms";  DestDir: "{#MPP}\cms" ;   Tasks: usx;
Source: "TN-Views\cms\SFM_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: usx;
Source: "TN-Views\cms\TNND_Views_show.cms"; DestDir: "{#MPP}\cms" ;   Tasks: usx;
Source: "TN-Views\cms\TNDD_Views_show.cms"; DestDir: "{#MPP}\cms" ;   Tasks: usx;

; SFM tasks
Source: "TN-Views\Views\SFM*.x*";           DestDir: "{#MPP}\Views" ; Tasks: sfm;
Source: "TN-Views\cms\SFM_Views_hide.cms";  DestDir: "{#MPP}\cms" ;   Tasks: sfm;
Source: "TN-Views\cms\USX_Views_show.cms";  DestDir: "{#MPP}\cms" ;   Tasks: sfm;
Source: "TN-Views\cms\TNND_Views_show.cms"; DestDir: "{#MPP}\cms" ;   Tasks: sfm;
Source: "TN-Views\cms\TNDD_Views_show.cms"; DestDir: "{#MPP}\cms" ;   Tasks: sfm;


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
