@ECHO OFF

REM ------------------------------------------------------
REM | I use BitLocker on Win 10 to encrypt my E: Partition
REM | Then I use E: to put all my Cloud storage folders
REM | like Dropbox, GDrive, and OwnCloud.
REM ------------------------------------------------------

:BitUnlock
C:\Windows\System32\manage-bde.exe -unlock -pw E:
C:\Windows\System32\manage-bde.exe -status E: | findstr /C:"Unlocked"

REM ------------------------------------------------------
REM | FINDSTR will set %ERRORLEVEL% as follows:
REM |
REM | 0 (False) a match is found in at least one line of at least one file.
REM | 1 (True) if a match is not found in any line of any file, (or if the file is not found at all).
REM | 2 Wrong syntax 
REM ------------------------------------------------------
IF ERRORLEVEL 1 goto BitUnlock
