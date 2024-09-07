[Setup]
AppName=comrade package manager
AppVersion=1.0
DefaultDirName={code:GetUserHomeDir}\.comrade
DefaultGroupName=comrade
OutputDir=.
OutputBaseFilename=ComradeInstaller
Compression=lzma
SolidCompression=yes
LicenseFile=GPL3-License.txt


[Files]
Source: "rade.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "sh.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: ShouldInstallSh
Source: "GPL3-License.txt"; DestDir: "{app}\..\LICENSE"; Flags: ignoreversion
Source: "MIT-License.txt"; DestDir: "{app}\..\LICENSE"; Flags: ignoreversion
Source: "LGPL-License.txt"; DestDir: "{app}\..\LICENSE"; Flags: ignoreversion
Source: "rade.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "base32.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "base64.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "cat.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "basename.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "bash.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "chgrp.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "chmod.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "chown.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "cp.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "cut.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "date.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "df.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dirname.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "du.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "echo.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "env.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "expand.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "fmt.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "fold.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "grep.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "head.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "install.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "join.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "kill.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ln.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ls.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "mkdir.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "mkfifo.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "mknod.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "mv.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "nl.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "od.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "paste.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "pr.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ps.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "rm.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "rmdir.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "sed.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "shred.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "sleep.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "sort.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "split.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "stat.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "sum.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "tail.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "tar.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "tee.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "touch.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "tr.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "tty.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "uniq.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "unlink.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "wc.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "who.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "xargs.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-2.0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-apr-1-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-aprutil-1-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-asn-1-8.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-assuan-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-bz2-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-cbor-0.11.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-com_err-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-crypt-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-crypt-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-crypto-3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-edit-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-expat-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-ffi-8.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-fido2-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-gcc_s-seh-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-crypt-20.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-gmp-10.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-gnutls-30.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-gpg-error-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-gssapi-3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-hcrypto-4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-heimbase-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-heimntlm-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-hogweed-6.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "msys-.dll"; DestDir: "{app}"; Flags: ignoreversion

[Code]
var
  ResultCode: Integer;
  InstallSh: Boolean;

function GetUserHomeDir(Value: string): string;
begin
  Result := GetEnv('USERPROFILE');  // ユーザーホームディレクトリの取得
end;

function IsShInstalled: Boolean;
var
  ResultCode: Integer;
begin
  // sh.exe がインストールされているか確認
  Result := Exec('cmd.exe', '/C where sh', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) and (ResultCode = 0);
end;

function ZipLicenseInfo: Boolean;
begin
  MsgBox('7zip is Licensed LGPL ', mbInformation, MB_OK);
end;
function ShouldInstallSh: Boolean;
begin
  Result := InstallSh;  // InstallSh 変数の値に基づいてインストールを決定
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  MsgResult: Integer;
  Sum: Integer;
begin
  if CurStep = ssInstall then
  begin
    // shがインストールされていない場合、ユーザーにインストールするか確認
    if not IsShInstalled then
    begin
      MsgResult := MsgBox('sh is not installed. Would you like to install it?', mbConfirmation, MB_YESNO);
      
      if MsgResult = IDYES then
      begin
        InstallSh := True;
        MsgBox('Installing sh.', mbInformation, MB_OK);
      end
      else
      begin
        InstallSh := False;
        MsgBox('Skipping sh installation.', mbInformation, MB_OK);
      end;
    end;

    // Gitのインストール確認
    if not Exec('cmd.exe', '/C where git', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Git is not installed. Please install Git.', mbError, MB_OK);
      Abort;  // Gitがない場合はインストールを中止
    end;

    // 必要なディレクトリ作成
    ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\log'));
    ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\log\install'));
    ForceDirectories(ExpandConstant('{code:GetUserHomeDir}\.comrade\packagelist'));

    // Gitリポジトリのクローン
    if Exec('powershell.exe', '-Command "git clone https://github.com/rade-package-manager/rade-package-list {code:GetUserHomeDir}\.comrade\packagelist"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
      MsgBox('Git clone succeeded', mbInformation, MB_OK)
    else
      MsgBox('Git clone failed', mbError, MB_OK);
  end;

  // ssPostInstall ステップでアンインストールファイルを削除
  if CurStep = ssPostInstall then
  begin
    DeleteFile(ExpandConstant('{app}\unins000.exe'));
    DeleteFile(ExpandConstant('{app}\unins000.dat'));
  end;
end;

