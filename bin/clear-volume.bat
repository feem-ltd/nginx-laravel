@echo off

if "%1" == "-f" goto yes
if "%1" == "-F" goto yes

set /P ANSWER="�{�����[���}�E���g�ō쐬���ꂽ�t�@�C�����폜���܂� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)

goto :end

:yes

set TARGET=laravel\*

del /S /Q %TARGET%
for /D %%1 in (%TARGET%) do echo �폜�����f�B���N�g�� - %%1 & rmdir /S /Q %%1

set TARGET=mysql\*

del /S /Q %TARGET%
for /D %%1 in (%TARGET%) do echo �폜�����f�B���N�g�� - %%1 & rmdir /S /Q %%1

:end
