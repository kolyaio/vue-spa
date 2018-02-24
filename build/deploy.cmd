call npm install
call npm run build

call cd %DEPLOYMENT_TARGET%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

xcopy /d %DEPLOYMENT_TARGET%\dist\* %DEPLOYMENT_TARGET%\dist /s /i
xcopy /d %DEPLOYMENT_TARGET%\index.html %DEPLOYMENT_TARGET%\index.html*
xcopy /d %DEPLOYMENT_TARGET%\server.js %DEPLOYMENT_TARGET%\server.js*
xcopy /d %DEPLOYMENT_TARGET%\package.json %DEPLOYMENT_TARGET%\package.json*
xcopy /d %DEPLOYMENT_TARGET%\build\web.config %DEPLOYMENT_TARGET%\web.config*

call npm install --only=production
echo Deployed.
