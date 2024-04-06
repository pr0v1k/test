@echo on
setlocal enabledelayedexpansion

set regkey=HKEY_LOCAL_MACHINE\SOFTWARE\IS-WorkTime
set regvalue=WTServer
set newvalue=fito710.fito.local

for /L %%i in (1,1,254) do (
    set ip=10.0.10.%%i
    reg.exe add "\\!ip!\%regkey%" /v %regvalue% /t REG_SZ /d %newvalue% /f > nul 2>&1
    if !errorlevel! equ 0 (
        echo Success: !ip!
    ) else (
        echo Error: !ip!
    )
)
