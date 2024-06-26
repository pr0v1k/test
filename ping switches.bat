@echo off
echo Ping Switches...
echo.

set "ip_addresses=10.0.20.1 10.0.20.2 10.0.20.3 10.0.20.4 10.0.20.5 10.0.20.6 10.0.20.7 10.0.20.8 10.0.20.9 10.0.20.10 10.0.20.11 10.0.20.12 10.0.20.13 10.0.20.14 10.0.20.15 10.0.20.16 10.0.20.17 10.0.20.18 10.0.20.19 10.0.20.20 10.0.20.21 10.0.20.22 10.0.20.24 10.0.20.26 10.0.20.27 10.0.20.28 10.0.20.30 10.0.20.31"

for %%i in (%ip_addresses%) do (
    ping -n 1 %%i | find "TTL=" >nul
    if errorlevel 1 (
        echo %%i - NO OK
    ) else (
        echo %%i - OK
    )
)

pause
