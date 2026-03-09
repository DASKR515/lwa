
$LWA_HOME = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)


$env:LUAROCKS_CONFIG = "$LWA_HOME\etc\luarocks\config-5.4.lua"
$env:LUA_PATH = "$LWA_HOME\share\lua\5.4\?.lua;$LWA_HOME\share\lua\5.4\?\init.lua;;"
$env:LUA_CPATH = "$LWA_HOME\lib\lua\5.4\?.dll;;"
$env:PATH = "$LWA_HOME\bin;" + $env:PATH


Write-Host "LWA Environment Active" -ForegroundColor Green
Write-Host "Lua: $(lua54 -v)" -ForegroundColor Cyan
Write-Host "LuaRocks: $(luarocks --version)" -ForegroundColor Cyan
