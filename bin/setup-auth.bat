@ECHO off

SET CMD_STR=docker-compose exec laravel composer require laravel/ui
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO [31mƒGƒ‰[‚ª”­¶‚µ‚½‚Ì‚Åˆ—‚ğI—¹‚µ‚Ü‚·B[0m
    GOTO BAT_END
)

SET CMD_STR=docker-compose exec laravel php artisan ui vue --auth
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO [31mƒGƒ‰[‚ª”­¶‚µ‚½‚Ì‚Åˆ—‚ğI—¹‚µ‚Ü‚·B[0m
    GOTO BAT_END
)

SET CMD_STR=docker-compose exec laravel php artisan migrate
ECHO [32m%CMD_STR%[0m
%CMD_STR%
IF not "%ERRORLEVEL%"  == "0" (
    ECHO [31mƒGƒ‰[‚ª”­¶‚µ‚½‚Ì‚Åˆ—‚ğI—¹‚µ‚Ü‚·B[0m
    GOTO BAT_END
)

:BAT_END
