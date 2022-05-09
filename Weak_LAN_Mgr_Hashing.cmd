:: Name:     Weak_LAN_Mgr_Hashing.cmd
:: Purpose:  Modify "Network security: LAN Manager authentication level"
:: Info:     HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel 5
:: Revision: April 23 2021

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:LCL_Reg_Check
@echo *** Weak_LAN_Manager_Hashing FIX ***
@echo The LmCompatibilityLevel Registry Value checking...
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa"|FINDSTR /R /C:"LmCompatibilityLevel"
IF %errorlevel%==0 (goto LCL_Value_Check) else (goto LCL_Reg_Adding)

:LCL_Reg_Adding
@echo The LmCompatibilityLevel Registry registry value adding...
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa"  /v "LmCompatibilityLevel" /t REG_DWORD /d 5 /f

:LCL_Value_Check
@echo The LmCompatibilityLevelregistry value re-checking...
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa"|FINDSTR /R /C:"LmCompatibilityLevel    REG_DWORD    0x5"
IF %errorlevel%==0 (goto END) else (goto setError)

:setError
@echo The LmCompatibilityLevel Registry Value is NOT found on this server %computername%
@echo Please check... 
TIMEOUT /T 20
Endlocal
Exit /b 1

:End
@echo Network security: LAN Manager authentication level is set to right level.
@echo So later, %computername% will pass Weak_LAN_Manager_Hashing scanning...
TIMEOUT /T 20
Endlocal
Exit /b 0


