cls

@echo off

Title Windows Health Checker

echo WELCOME To Windows Health Checker !!!
ping localhost -n 5 > nul
cls

echo STARTING Stage-1 PROCESS.
echo Please Wait.
ping localhost -n 3 > nul
cls
echo STARTING Stage-1 PROCESS..
echo Please Wait..
ping localhost -n 3 > nul
cls
echo STARTING Stage-1 PROCESS...
echo Please Wait...
ping localhost -n 3 > nul
cls

sfc /scannow

ping localhost -n 2 > nul

echo DONE Scanning...

ping localhost -n 5 > nul
cls


echo STARTING Stage-2 PROCESS.
echo Please Wait.
ping localhost -n 3 > nul
cls
echo STARTING Stage-2 PROCESS..
echo Please Wait..
ping localhost -n 3 > nul
cls
echo STARTING Stage-2 PROCESS...
echo Please Wait...
ping localhost -n 3 > nul
cls

DISM /Online /Cleanup-Image /RestoreHealth

ping localhost -n 2 > nul

echo DONE Restore Health...

ping localhost -n 5 > nul
cls


echo STARTING Stage-3 PROCESS.
echo Please Wait.
ping localhost -n 3 > nul
cls
echo STARTING Stage-3 PROCESS..
echo Please Wait..
ping localhost -n 3 > nul
cls
echo STARTING Stage-3 PROCESS...
echo Please Wait...
ping localhost -n 3 > nul
cls

DISM /Online /Cleanup-Image /ScanHealth

ping localhost -n 2 > nul

echo DONE Scanned Health...

ping localhost -n 5 > nul
cls


echo STARTING Stage-4 PROCESS.
echo Please Wait.
ping localhost -n 3 > nul
cls
echo STARTING Stage-4 PROCESS..
echo Please Wait..
ping localhost -n 3 > nul
cls
echo STARTING Stage-4 PROCESS...
echo Please Wait...
ping localhost -n 3 > nul
cls

chkdsk /f C:

ping localhost -n 2 > nul

echo Complete Option...

ping localhost -n 5 > nul
cls

exit