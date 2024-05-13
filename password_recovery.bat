@echo off
Chcp 65001>Nul

Rem | This code will retreive all wifi name and password associated in an windows pc (in french language) to which the pc have been connected to
Rem | TODO: make it work for all languages
Rem | Grab all profiles
for /f "tokens=4,5,* skip=4" %%a in ('netsh wlan show profile') do (
    Rem | Grab key for each profile
    for /f "tokens=*" %%d in ('netsh wlan show profile "%%c" key^=clear') do (
        Rem | Grab only key
        for /f "tokens=5,*" %%e in ('echo %%d^| find /i "Contenu de la clé"') do (
            echo %%c %%f
        )
    )
)

pause
goto :EOF       