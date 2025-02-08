@echo off
setlocal EnableDelayedExpansion

:: Crear carpeta temporal para descargas
set DOWNLOAD_DIR=%USERPROFILE%\Downloads\AutoInstall
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"
cd /d "%DOWNLOAD_DIR%"

:: Descargar e instalar programas
set PROGRAMS=(
    "XAMPP|https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/8.2.12/xampp-windows-x64-8.2.12-0-VS16-installer.exe"
    "VisualStudioCode|https://code.visualstudio.com/docs/?dv=win64user"
    "HydraLauncher|https://github.com/hydralauncher/hydra/releases/download/v3.1.5/hydralauncher-3.1.5-setup.exe"
    "WizTree|https://diskanalyzer.com/files/wiztree_4_24_setup.exe"
    "ProcessHacker|https://sourceforge.net/projects/systeminformer/files/systeminformer-3.2.25011-release-setup.exe/download"
    "NetBeans|https://dlcdn.apache.org/netbeans/netbeans-installers/24/Apache-NetBeans-24-bin-windows-x64.exe"
    "CurseForge|https://download.overwolf.com/install/Download?ExtensionId=cfiahnpaolfnlgaihhmobmnjdafknjnjdpdabpcm&utm_term=eyJkb21haW4iOiJjZi13ZWIifQ%3D%3D"
    "RadioCaster|https://dl.djsoft.net/RadioCaster_setup.exe"
    "Winamp|https://www.winamp.com/downloads/"
    "Discord|https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64"
    "WinSCP|https://winscp.net/download/WinSCP-6.3.6-Setup.exe/download"
    "PuTTY|https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.82-installer.msi"
    "Blitz|https://blitz.gg/download/win"
    "EpicGames|https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi?trackingId=0550c7c55b0b4967856a4e3dc43f0813"
    "RiotClient|https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.la1.exe"
    "Steam|https://cdn.fastly.steamstatic.com/client/installer/SteamSetup.exe"
    "MemeReduct|https://github.com/henrypp/memreduct/releases/download/v.3.5.1/memreduct-3.5.1-setup.exe"
    "Spotify|https://download.scdn.co/SpotifySetup.exe"
    "Python|https://www.python.org/ftp/python/3.13.2/python-3.13.2-amd64.exe"
    "Java|https://download.oracle.com/java/23/latest/jdk-23_windows-x64_bin.msi"
    "NodeJS|https://nodejs.org/dist/v22.13.1/node-v22.13.1-x64.msi"
    "Postman|https://dl.pstmn.io/download/latest/win64"
    "WinRAR|https://d.winrar.es/d/103z1738993844/BEK7KtMDC1xR1K0wSvrIQg/winrar-x64-701es.exe"
    "Zoom|https://zoom.us/client/6.3.6.56144/ZoomInstallerFull.exe?archType=x64"
    "Maven|https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip"
)

for %%A in (%PROGRAMS%) do (
    for /f "tokens=1,2 delims=|" %%B in ("%%A") do (
        echo Descargando %%B...
        curl -L -o "%%B.exe" "%%C"
        echo Instalando %%B...
        start /wait "" "%%B.exe" /S
    )
)

:: Extraer Maven y agregarlo al PATH
powershell -Command "Expand-Archive -Path '%DOWNLOAD_DIR%\apache-maven-3.9.9-bin.zip' -DestinationPath 'C:\Maven'"
setx PATH "%PATH%;C:\Maven\bin"

:: Ejecutar script de PowerShell para Spicetify
echo Ejecutando script de PowerShell para Spicetify...
powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex"

:: Abrir link de Grass en el navegador
echo Abriendo Grass en el navegador...
start https://app.getgrass.io/dashboard/store/item/desktop/install

:: Descargar y establecer wallpaper
set WALLPAPER_URL=https://image-1.uhdpaper.com/wallpaper/sunset-horizon-standing-alone-mountains-scenery-ai-art-hd-wallpaper-uhdpaper.com-715@1@l.jpg
set WALLPAPER_PATH=%USERPROFILE%\Pictures\wallpaper.jpg
echo Descargando wallpaper...
curl -L -o "%WALLPAPER_PATH%" "%WALLPAPER_URL"
powershell -Command "(New-Object -ComObject WScript.Shell).RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop\Wallpaper', '%WALLPAPER_PATH%', 'REG_SZ')"
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Instalación completa. Reiniciando en 10 segundos...
timeout /t 10 /nobreak
shutdown /r /t 0
