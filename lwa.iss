; LWA Installer Script
#define MyAppName "lwa"
#define MyAppVersion "0.1"
#define MyAppPublisher "DASKR, LWA-team"
#define MyAppURL "https://www.example.com"
#define MyAppExeName "bin\lwa.exe"

[Setup]
AppId={{7BE848AB-576A-4583-B5CD-F24FF1E7888C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName=LWA
OutputBaseFilename=lwa-setup
Compression=lzma
SolidCompression=yes
SetupIconFile=C:\Users\Administrator\Documents\lwa\asset\lwa.ico
WizardStyle=modern
DisableProgramGroupPage=yes
ChangesEnvironment=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Program Files\lwa\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs


[Registry]
; نترك فقط المتغيرات الثابتة، أما الـ Path فنتركه للكود البرمجي لضمان الأمان
Root: HKCU; Subkey: "Environment"; \
ValueType: string; ValueName: "LUAROCKS_CONFIG"; \
ValueData: "{app}\etc\luarocks\config-5.4.lua"; \
Flags: uninsdeletevalue

[Code]

procedure CurStepChanged(CurStep: TSetupStep);
var
  Paths, NewPath, AppBin: string;
begin
  if CurStep = ssPostInstall then
  begin
    AppBin := ExpandConstant('{app}') + '\bin';
    RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Paths);
    
    // إضافة المسار فقط إذا لم يكن موجوداً
    if Pos(AppBin, Paths) = 0 then
    begin
      NewPath := Paths + ';' + AppBin;
      RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', NewPath);
    end;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Paths, NewPath, AppBin: string;
begin
  if CurUninstallStep = usUninstall then
  begin
    AppBin := ExpandConstant('{app}') + '\bin';
    RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Paths);
    
    if Pos(AppBin, Paths) > 0 then
    begin
      NewPath := Paths;
      StringChange(NewPath, ';' + AppBin, '');
      StringChange(NewPath, AppBin, '');
      RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', NewPath);
    end;
  end;
end;