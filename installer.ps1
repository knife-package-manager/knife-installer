Write-Host "comrade Installer"
Write-Host "This installer builds comrade and generates an executable file tailored to your computer."
Write-Host "Estimated build time is about 4 minutes."
$val = Read-Host "Enter y or yes to run, or n or no to cancel [y/n]"

$ok = $false
$current_dir = Get-Location

if ($val -eq "y" -or $val -eq "yes" -or $val -eq "") {
    Write-Host "Starting installation"
    if (Test-Path "$HOME\.comrade" -and Test-Path "$HOME\.comrade\bin\comrade.exe") {
        Write-Host "comrade is already installed!"
        Write-Host "If you still want to install it, you can reinstall comrade with rade upgrade!"
        Write-Host "Or you can clone the comrade repository to $HOME\.comrade\build and use make to reinstall rade yourself!"
        Remove-Item -Path "$current_dir\install.ps1"
        exit 1
    }

    Write-Host "Creating comrade_build directory..."
    New-Item -ItemType Directory -Path "$HOME\comrade_build" | Out-Null
    Write-Host "ok"

    Write-Host "Downloading test.rs..."
    Invoke-WebRequest -Uri "https://github.com/rade-package-manager/comrade-installer.github.io/releases/download/0.1/check_comrade_install_dependency.rs" -OutFile "$HOME\comrade_build\test.rs"
    Write-Host "ok"

    Write-Host "Checking for rustc..."
    if (Get-Command rustc -ErrorAction SilentlyContinue) {
        Write-Host "ok"
    } else {
        Write-Host "`nrustc is not installed. comrade requires rustc to be installed.`nPlease install Rust before installing comrade."
        exit 1
    }

    Write-Host "Compiling test.rs..."
    rustc "$HOME\comrade_build\test.rs" -o "$HOME\comrade_build\test.exe"
    Write-Host "ok"

    Write-Host "Checking if the program runs correctly..."
    if (& "$HOME\comrade_build\test.exe") {
        Write-Host "ok"
    } else {
        Write-Host "The test program failed to run."
        exit 1
    }

    Write-Host "Creating $HOME\.comrade directory..."
    New-Item -ItemType Directory -Path "$HOME\.comrade" | Out-Null
    Write-Host "ok"

    Write-Host "Cloning rade-package-list..."
    git clone --quiet https://github.com/rade-package-manager/rade-package-list "$HOME\.comrade\packagelist"
    Write-Host "ok"

    Write-Host "Creating $HOME\.comrade\bin directory..."
    New-Item -ItemType Directory -Path "$HOME\.comrade\bin" | Out-Null
    Write-Host "ok"

    Write-Host "Creating $HOME\.comrade\build directory..."
    New-Item -ItemType Directory -Path "$HOME\.comrade\build" | Out-Null
    Write-Host "ok"

    Write-Host "Cloning comrade..."
    git clone --quiet https://github.com/comrade-package-manager/comrade-package-manager "$HOME\.comrade\build"
    Write-Host "ok"

    Write-Host "Navigating to $HOME\.comrade\build..."
    Set-Location "$HOME\.comrade\build"
    Write-Host "ok"

    Write-Host "Building..."
    if (Invoke-Expression "make install") {
        Write-Host "All done!"
        Write-Host "comrade installed successfully! For more information about comrade, please visit the comrade Repository."
        $ok = $true
    } else {
        Write-Host "Build failed."
        exit 1
    }

    # Add comrade to the system PATH
    $comradeBinPath = [System.IO.Path]::Combine($HOME, '.comrade\bin')
    $currentPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)

    if (-not $currentPath.Contains($comradeBinPath)) {
        [Environment]::SetEnvironmentVariable('Path', "$currentPath;$comradeBinPath", [EnvironmentVariableTarget]::Machine)
        Write-Host "comrade bin directory added to the system PATH."
    } else {
        Write-Host "comrade bin directory is already in the system PATH."
    }

    # Clean up the build directory
    if (Test-Path "$HOME\.comrade\build") {
        Get-ChildItem "$HOME\.comrade\build" | Remove-Item -Recurse
    }

} elseif ($val -eq "n" -or $val -eq "no") {
    Write-Host "Installation canceled"
    Remove-Item -Path "$current_dir\install.ps1"
    exit
} else {
    Write-Host "Invalid input. Please enter y or yes to run, or n or no to cancel."
    Remove-Item -Path "$current_dir\install.ps1"
    exit
}
