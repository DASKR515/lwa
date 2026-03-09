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
Source: "C:\Users\Administrator\Documents\luaTEST\lwa\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Registry]
Root: HKCU; Subkey: "Environment"; \
  ValueType: string; ValueName: "LUAROCKS_CONFIG"; \
  ValueData: "{app}\etc\luarocks\config-5.4.lua"; \
  Flags: uninsdeletevalue

Root: HKCU; Subkey: "Environment"; \
  ValueType: string; ValueName: "LUA_CPATH"; \
  ValueData: "{app}\lib\lua\5.4\iuplua\?54.dll;{app}\lib\lua\5.4\?.dll;.\?.dll"; \
  Flags: uninsdeletevalue

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  Paths, AppBin, AppLib: string;
begin
  if CurStep = ssPostInstall then
  begin
    AppBin := ExpandConstant('{app}') + '\bin';
    AppLib := ExpandConstant('{app}') + '\lib\lua\5.4';
    RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Paths);

    if Pos(AppBin, Paths) = 0 then
      Paths := Paths + ';' + AppBin;

    if Pos(AppLib, Paths) = 0 then
      Paths := Paths + ';' + AppLib;

    RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Paths);
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Paths, AppBin, AppLib: string;
begin
  if CurUninstallStep = usUninstall then
  begin
    AppBin := ExpandConstant('{app}') + '\bin';
    AppLib := ExpandConstant('{app}') + '\lib\lua\5.4';
    RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Paths);

    if Pos(AppBin, Paths) > 0 then
    begin
      StringChange(Paths, ';' + AppBin, '');
      StringChange(Paths, AppBin, '');
    end;

    if Pos(AppLib, Paths) > 0 then
    begin
      StringChange(Paths, ';' + AppLib, '');
      StringChange(Paths, AppLib, '');
    end;

    RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Paths);
  end;
end;