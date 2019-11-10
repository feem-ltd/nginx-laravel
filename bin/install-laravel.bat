@ECHO off

SET filename="laravel\.env"
IF EXIST %filename% (
    ECHO ���� laravel ���C���X�g�[������Ă��܂��B
    GOTO BAT_END
)

SET CMD_STR=docker-compose build
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

IF NOT EXIST laravel (
    MD laravel
)

REM IF NOT EXIST etc\logrotate.d\laravel (
REM MD etc\logrotate.d\laravel
REM )

SET CMD_STR=docker-compose up -d
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

SET CMD_STR=docker-compose exec laravel composer create-project laravel/laravel ./ 6.* --prefer-dist
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO [31m�G���[�����������̂ŏ������I�����܂��B[0m
    GOTO BAT_END
)

REM ECHO docker-compose exec laravel npm install
REM docker-compose exec laravel npm install

REM IF not "%ERRORLEVEL%"  == "0" (
REM     ECHO �G���[�����������̂ŏ������I�����܂��B
REM     GOTO BAT_END
REM )

SET CMD_STR=docker-compose exec laravel /root/init_laravel.sh
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO [31m�G���[�����������̂ŏ������I�����܂��B[0m
    GOTO BAT_END
)

:BAT_END
