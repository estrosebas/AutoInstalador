# Definir la carpeta de descargas
$DOWNLOAD_DIR = "$env:USERPROFILE\Downloads\AutoInstall"

# Crear la carpeta si no existe
if (-not (Test-Path -Path $DOWNLOAD_DIR)) {
    New-Item -ItemType Directory -Path $DOWNLOAD_DIR | Out-Null
}

# Lista de programas con sus nombres y URLs
$PROGRAMS = @(
    @{ Name = "XAMPP"; Url = "https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/8.2.12/xampp-windows-x64-8.2.12-0-VS16-installer.exe" },
    @{ Name = "VisualStudioCode"; Url = "https://code.visualstudio.com/docs/?dv=win64user" },
    @{ Name = "HydraLauncher"; Url = "https://github.com/hydralauncher/hydra/releases/download/v3.1.5/hydralauncher-3.1.5-setup.exe" },
    @{ Name = "WizTree"; Url = "https://diskanalyzer.com/files/wiztree_4_24_setup.exe" },
    @{ Name = "ProcessHacker"; Url = "https://sourceforge.net/projects/systeminformer/files/systeminformer-3.2.25011-release-setup.exe/download" },
    @{ Name = "NetBeans"; Url = "https://dlcdn.apache.org/netbeans/netbeans-installers/24/Apache-NetBeans-24-bin-windows-x64.exe" },
    @{ Name = "CurseForge"; Url = "https://download.overwolf.com/install/Download?ExtensionId=cfiahnpaolfnlgaihhmobmnjdafknjnjdpdabpcm&utm_term=eyJkb21haW4iOiJjZi13ZWIifQ%3D%3D" },
    @{ Name = "RadioCaster"; Url = "https://dl.djsoft.net/RadioCaster_setup.exe" },
    @{ Name = "Winamp"; Url = "https://www.winamp.com/downloads/" },
    @{ Name = "Discord"; Url = "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64" },
    @{ Name = "WinSCP"; Url = "https://winscp.net/download/WinSCP-6.3.6-Setup.exe/download" },
    @{ Name = "PuTTY"; Url = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.82-installer.msi" },
    @{ Name = "Blitz"; Url = "https://blitz.gg/download/win" },
    @{ Name = "EpicGames"; Url = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi?trackingId=0550c7c55b0b4967856a4e3dc43f0813" },
    @{ Name = "RiotClient"; Url = "https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.la1.exe" },
    @{ Name = "Steam"; Url = "https://cdn.fastly.steamstatic.com/client/installer/SteamSetup.exe" },
    @{ Name = "MemeReduct"; Url = "https://github.com/henrypp/memreduct/releases/download/v.3.5.1/memreduct-3.5.1-setup.exe" },
    @{ Name = "Spotify"; Url = "https://download.scdn.co/SpotifySetup.exe" },
    @{ Name = "Python"; Url = "https://www.python.org/ftp/python/3.13.2/python-3.13.2-amd64.exe" },
    @{ Name = "Java"; Url = "https://download.oracle.com/java/23/latest/jdk-23_windows-x64_bin.msi" },
    @{ Name = "NodeJS"; Url = "https://nodejs.org/dist/v22.13.1/node-v22.13.1-x64.msi" },
    @{ Name = "Postman"; Url = "https://dl.pstmn.io/download/latest/win64" },
    @{ Name = "WinRAR"; Url = "https://d.winrar.es/d/103z1738993844/BEK7KtMDC1xR1K0wSvrIQg/winrar-x64-701es.exe" },
    @{ Name = "Zoom"; Url = "https://zoom.us/client/6.3.6.56144/ZoomInstallerFull.exe?archType=x64" },
    @{ Name = "Maven"; Url = "https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip" }
)

# Descargar cada programa
foreach ($program in $PROGRAMS) {
    $fileName = "$($program.Name).exe"
    $filePath = Join-Path -Path $DOWNLOAD_DIR -ChildPath $fileName
    Write-Host "Descargando $($program.Name)..."
    Invoke-WebRequest -Uri $program.Url -OutFile $filePath
    Write-Host "Descarga completada: $filePath"
}

# Ejecutar cada instalador manualmente
Write-Host "Todos los programas han sido descargados en $DOWNLOAD_DIR."
Write-Host "A continuación, se abrirán los instaladores uno por uno para que puedas instalarlos manualmente."

foreach ($program in $PROGRAMS) {
    $fileName = "$($program.Name).exe"
    $filePath = Join-Path -Path $DOWNLOAD_DIR -ChildPath $fileName
    Write-Host "Ejecutando $fileName..."
    Start-Process -FilePath $filePath -Wait
    Write-Host "Instalación de $fileName completada."
}

# Extraer Maven y agregarlo al PATH
$mavenZipPath = Join-Path -Path $DOWNLOAD_DIR -ChildPath "apache-maven-3.9.9-bin.zip"
$mavenExtractPath = "C:\Maven"
if (Test-Path -Path $mavenZipPath) {
    Write-Host "Extrayendo Maven..."
    Expand-Archive -Path $mavenZipPath -DestinationPath $mavenExtractPath -Force
    $env:Path += ";$mavenExtractPath\bin"
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)
    Write-Host "Maven extraído y agregado al PATH."
}

# Ejecutar script de PowerShell para Spicetify
Write-Host "Ejecutando script de PowerShell para Spicetify..."
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/spicetify/cli/main/install.ps1" -OutFile "$DOWNLOAD_DIR\install_spicetify.ps1"
Start-Process -FilePath "powershell.exe" -ArgumentList "-File `"$DOWNLOAD_DIR\install_spicetify.ps1`"" -Wait

# Abrir link de Grass en el navegador
Write-Host "Abriendo Grass en el navegador..."
Start-Process "https://app.getgrass.io/dashboard/store/item/desktop/install"

# Descargar y establecer wallpaper
$wallpaperUrl = "https://image-1.uhdpaper.com/wallpaper/sunset-horizon-standing-alone-mountains-scenery-ai-art-hd-wallpaper-uhdpaper.com-715@1@l.jpg"
$wallpaperPath = "$env:USERPROFILE\Pictures\wallpaper.jpg"
Write-Host "Descargando wallpaper..."
Invoke-WebRequest -Uri $wallpaperUrl -OutFile $wallpaperPath
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value $wallpaperPath
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

Write-Host "Instalación completa. Reiniciando en 10 segundos..."
Start-Sleep -Seconds 10
Restart-Computer -Force