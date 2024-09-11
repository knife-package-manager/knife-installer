[Setup]
AppName=comrade package manager
AppVersion=1.0
DefaultDirName={code:GetUserHomeDir}\.comrade
DefaultGroupName=comrade
OutputDir=.
OutputBaseFilename=ComradeInstaller
Compression=lzma
SolidCompression=yes
LicenseFile=MIT-License.txt

[Files]
Source: "rade.exe"; DestDir: "{app}"; Flags: ignoreversion

[Code]
function GetUserHomeDir(Value: string): string;
begin
  Result := GetEnv('USERPROFILE');  // ユーザーホームディレクトリの取得
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  MsgResult: Integer;
  ResultCode: Integer;
begin
  if CurStep = ssInstall then
  begin
    if not Exec('cmd.exe', '/C where git', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Git is not installed. Please install Git.', mbError, MB_OK);
      Abort;  // Gitがない場合はインストールを中止
    end;

    ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\log'));
    ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\log\install'));
    ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\packagelist'));

    if Exec('powershell.exe', '-Command "git clone https://github.com/rade-package-manager/rade-package-list {code:GetUserHomeDir}\.comrade\packagelist"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
      MsgBox('Git clone succeeded', mbInformation, MB_OK)
    else
      MsgBox('Git clone failed', mbError, MB_OK);
  end;

  if CurStep = ssPostInstall then
  begin
    // コマンドの実行
    if not Exec('cmd.exe', '/C rade upgrade', '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Failed to execute post-install command.', mbError, MB_OK);
    end;

    // 不要なファイルの削除
    DeleteFile(ExpandConstant('{app}\unins000.exe'));
    DeleteFile(ExpandConstant('{app}\unins000.dat'));
  end;
end;