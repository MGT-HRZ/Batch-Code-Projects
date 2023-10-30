@ECHO OFF
ECHO\
ECHO REARRANGE SONGS by YEAR
ECHO.

REM Prompt the user for the source directory
ECHO Enter the source directory:
set /p source_directory="> "

ECHO.

REM Prompt the user for the destination directory
ECHO Enter the destination directory:
set /p destination_directory="> "

REM Check if the source directory exists
IF NOT EXIST "%source_directory%" (
    ECHO.
    ECHO -- The folder "%source_directory%" does not exist. --
    PAUSE
    EXIT /B 1
)

REM Check if the destination directory exists
IF NOT EXIST "%destination_directory%" (
    ECHO.
    ECHO -- The folder "%destination_directory%" does not exist. --
    PAUSE
    EXIT /B 1
)

REM Run the PHP script to copy the folder structure
ECHO.
php rearrange_songs.php "%source_directory%" "%destination_directory%"

REM Pause for user to see the result

ECHO.
PAUSE
