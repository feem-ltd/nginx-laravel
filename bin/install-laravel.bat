@ECHO off

SET filename="volumes\laravel\.env"
IF EXIST %filename% (
    ECHO Šù‚É laravel ‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚Ü‚·B
    GOTO BAT_END
)

SET CMD_STR=docker-compose build
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO ƒGƒ‰[‚ª”­¶‚µ‚½‚Ì‚Åˆ—‚ğI—¹‚µ‚Ü‚·B
    GOTO BAT_END
)

IF NOT EXIST volumes (
    MD volumes
)

IF NOT EXIST volumes\laravel (
    MD volumes\laravel
)

REM IF NOT EXIST etc\logrotate.d\laravel (
REM MD etc\logrotate.d\laravel
REM )

SET CMD_STR=docker-compose up -d
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO ƒGƒ‰[‚ª”­¶‚µ‚½‚Ì‚Åˆ—‚ğI—¹‚µ‚Ü‚·B
    GOTO BAT_END
)

CALL bin\setup-laravel.bat

:BAT_END
