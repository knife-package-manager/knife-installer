[Setup]
AppName=comrade package manager
AppVersion=1.0
DefaultDirName={code:GetUserHomeDir}\.comrade\bin
DefaultGroupName=comrade
OutputDir=.
OutputBaseFilename=ComradePackageManagerInstaller
Compression=lzma
SolidCompression=yes

[Files]
Source: "C:\Users\17do\rade.exe"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "{app}\rade.exe"

[Code]
  var 
    ResultCode: Integer;
function GetUserHomeDir(Value: string): string;
begin
  Result := GetEnv('USERPROFILE');  // ユーザーホームディレクトリの取得
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin

  ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\log'));
  ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\log\install'));
  ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\packagelist'));
  Exec('powershell.exe', 'git clone https://github.com/rade-package-manager/rade-package-list $HOME\.comrade\packagelist', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  Exec('powershell.exe', 'rm $HOME\.comrade\bin\unins000.dat', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  Exec('powershell.exe', 'rm $HOME\.comrade\bin\unins000.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  MsgBox(IntToStr(ResultCode), mbError, MB_OK);
  
  
end;

