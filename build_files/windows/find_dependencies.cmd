@echo off

for %%X in (svn.exe) do set "SVN=%%~$PATH:X"
for %%X in (cmake.exe) do set "CMAKE=%%~$PATH:X"
for %%X in (ctest.exe) do set "CTEST=%%~$PATH:X"
for %%X in (git.exe) do set "GIT=%%~$PATH:X"

REM Prefer Blender's bundled Python.
set "PYTHON=%BLENDER_DIR%\..\lib\win64_vc15\python\310\bin\python.exe"
if exist "%PYTHON%" goto detect_python_done

set "PYTHON=%BLENDER_DIR%\..\lib\win64_vc15\python\311\bin\python.exe"
if exist "%PYTHON%" goto detect_python_done

set "PYTHON=%BLENDER_DIR%\..\lib\win64_vc15\python\312\bin\python.exe"
if exist "%PYTHON%" goto detect_python_done

set "PYTHON=%BLENDER_DIR%\..\lib\win64_vc15\python\39\bin\python.exe"
if exist "%PYTHON%" goto detect_python_done

REM Fall back to Python installed by actions/setup-python.
where python.exe >nul 2>&1
if errorlevel 1 (
    echo Python not found, required for this operation.
    exit /b 1
)

for %%X in (python.exe) do set "PYTHON=%%~$PATH:X"

:detect_python_done
if not exist "%PYTHON%" (
    echo Python not found: "%PYTHON%"
    exit /b 1
)

if not "%VERBOSE%" == "" (
    echo svn    : "%SVN%"
    echo cmake  : "%CMAKE%"
    echo ctest  : "%CTEST%"
    echo git    : "%GIT%"
    echo python : "%PYTHON%"
)

"%PYTHON%" --version
exit /b %errorlevel%
