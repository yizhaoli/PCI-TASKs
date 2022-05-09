:: Name:     enable_SMB_signing.cmd
:: Purpose:  enable SMB signing client and Server sides 
:: contact:  alex.li@telus.com
:: Revision: March 06 2019

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters" /v "RequireSecuritySignature" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters" /v "EnableSecuritySignature" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "RequireSecuritySignature" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableSecuritySignature" /t REG_DWORD /d 1 /f
SET MSI_Error=%ERRORLEVEL%
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters" /v "RequireSecuritySignature"
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters" /v "EnableSecuritySignature"
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableSecuritySignature"
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "RequireSecuritySignature"
@echo Enable SMB signing registry values are added
@echo SMB signing enabled on both SMB client and SMB server sides
ENDLOCAL & SET Exit_Code=%MSI_Error%
Exit /B %Exit_Code%

