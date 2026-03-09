@echo off
setlocal
set "LUAROCKS_SYSCONFDIR=C:\Program Files\luarocks"
"C:\Program Files (x86)\lwa\bin\lua54.exe" -e "package.path=\"C:\\Program Files (x86)\\lwa\\share\\lua\\5.4\\?.lua;C:C:\\Program Files (x86)\\lwa\\share\\lua\\5.4\\?\\init.lua;\"..package.path;package.cpath=\"C:\\Program Files (x86)\\lwa\\lib\\lua\\5.4\\?.dll;\"..package.cpath;local k,l,_=pcall(require,'luarocks.loader') _=k and l.add_context('luastatic','0.0.12-1')" "C:\Program Files\lwa\lib\luarocks\rocks-5.4\luastatic\0.0.12-1\bin\luastatic" %*
exit /b %ERRORLEVEL%
