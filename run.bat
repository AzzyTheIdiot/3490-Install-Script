@echo off
goto :Check_Permissions


:Start
Set-ExecutionPolicy RemoteSigned
python --version 2>NUL
if errorlevel 1 goto :PYTHON_NOT_INSTALLED 
goto :PYTHON_INSTALLED


:PYTHON_NOT_INSTALLED
cls
echo "Python is not installed, going to run installer once key is clicked!"
pause
powershell.exe -File "pythonInstall.ps1"
echo "Python has installed!"
pause
goto :Install_script


:PYTHON_INSTALLED
cls
echo "Python is already installed!"
echo "Going to execute robotics install script!"
pause
goto :Install_script


:Install_script
Set-ExecutionPolicy Restricted
start py -m pip install --upgrade pip
start pip install Tkinter
cls
echo "Pretend something is installing"
pause
cls
@REM Write the start of a python file here.
echo "Everything succesfully installed!"
pause
exit


:Check_Permissions
echo "Checking if program is ran as an Administator!"
    net session >NUL 2>&1
    if %errorlevel% == 0 (
        echo "Admin priveleges verified!"
        pause
        goto :Start
    ) else (
        echo "Admin priveleges are not on,, please restart the script as an admin."
        pause
    )