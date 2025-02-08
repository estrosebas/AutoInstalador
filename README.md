# AutoInstall Script

## Descripción
Este script en PowerShell automatiza la descarga e instalación de varios programas esenciales en Windows. Descarga los instaladores en una carpeta específica y los ejecuta para su instalación manual.

## Características
- Crea automáticamente una carpeta en `Descargas` para almacenar los instaladores.
- Descarga una lista predefinida de programas desde sus enlaces oficiales.
- Ejecuta cada instalador manualmente para su instalación.

## Requisitos
- Sistema operativo Windows.
- Conexión a internet.
- Permisos de administrador para ejecutar los instaladores.

## Instalación y Uso
1. Guarda el script en un archivo con extensión `.ps1` (por ejemplo, `AutoInstall.ps1`).
2. Abre PowerShell en modo Administrador.
3. Ejecuta el siguiente comando para permitir la ejecución de scripts:
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process
   ```
4. Ejecuta el script:
   ```powershell
   .\AutoInstall.ps1
   ```
5. Espera a que se descarguen los archivos y sigue las instrucciones para instalar los programas.

## Programas Incluidos
- XAMPP
- Visual Studio Code
- HydraLauncher
- WizTree
- Process Hacker
- NetBeans
- CurseForge
- RadioCaster
- Winamp
- Discord
- WinSCP
- PuTTY
- Blitz
- Epic Games Launcher
- Riot Client
- Steam
- Meme Reduct
- Spotify
- Python
- Java
- Node.js
- Postman
- WinRAR
- Zoom
- Maven

## Notas
- Se recomienda verificar los enlaces de descarga antes de ejecutar el script.
- Algunos programas pueden requerir intervención manual durante la instalación.
- Puede ser necesario desactivar temporalmente el antivirus si bloquea las descargas.

## Autor
Este script fue desarrollado por Sebastian Gonzales (estrosebas) para facilitar la instalación rápida de herramientas esenciales en Windows.

