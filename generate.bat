@echo off

set /p ProjectName= Proeject name: 

echo Cartella principale creata

echo Creating SRC folder...
mkdir "%CD%\%ProjectName%\src"
echo completed
echo -----------------------------------

echo Creating public folder...
mkdir "%CD%\%ProjectName%\public"
echo completed
echo -----------------------------------

call :generatePackage
echo file package.json created
echo -----------------------------------

call :generateIndexHTML
echo file index.html created
echo -----------------------------------

call :generateIndexJS
echo file index.js created
echo -----------------------------------

call :generateAppJS
echo file App.js created
echo -----------------------------------

call :generateGitIgnore
echo file .gitignore created
echo -----------------------------------

echo Creation of project completed. Wait to exit...

CD %CD%\%ProjectName%
set /p answer=Do you want to install npm? (y/n) :
if %answer% equ y call npm install
echo node installato
echo -----------------------------------

set /p answer=Open VS Code? (y/n)
if %answer% equ y call code . 
pause > nul

call exit

::#region generate package.json
:generatePackage
set FilePath= "%CD%\%ProjectName%\package.json"
echo {  >> %FilePath%
echo    "name": "%ProjectName%",  >> %FilePath%
echo    "version": "0.1.0",  >> %FilePath%
echo    "private": true,  >> %FilePath%
echo    "dependencies": {  >> %FilePath%
echo        "@testing-library/jest-dom": "^5.13.0",  >> %FilePath%
echo        "@testing-library/react": "^11.2.7",   >> %FilePath%
echo        "@testing-library/user-event": "^12.8.3",  >> %FilePath%
echo        "react": "^17.0.2",  >> %FilePath%
echo        "react-dom": "^17.0.2",  >> %FilePath%
echo        "react-scripts": "4.0.3",  >> %FilePath%
echo        "web-vitals": "^1.1.2"  >> %FilePath%
echo    },  >> %FilePath%
echo    "scripts": {  >> %FilePath%
echo        "start": "react-scripts start",  >> %FilePath%
echo        "build": "react-scripts build",  >> %FilePath%
echo        "test": "react-scripts test",  >> %FilePath%
echo        "eject": "react-scripts eject"  >> %FilePath%
echo     },  >> %FilePath%
echo    "eslintConfig": {  >> %FilePath%
echo        "extends": [  >> %FilePath%
echo            "react-app",  >> %FilePath%
echo            "react-app/jest"  >> %FilePath%
echo        ]    >> %FilePath% 
echo     },  >> %FilePath% 
echo    "browserslist": {  >> %FilePath%
echo        "production": [  >> %FilePath%
echo            " >>0.2%%",  >> %FilePath%
echo            "not dead",  >> %FilePath%
echo            "not op_mini all"  >> %FilePath%
echo        ],  >> %FilePath%
echo        "development": [  >> %FilePath%
echo            "last 1 chrome version",  >> %FilePath%
echo            "last 1 firefox version",  >> %FilePath%
echo            "last 1 safari version"  >> %FilePath%
echo        ]  >> %FilePath%
echo     }  >> %FilePath%
echo }  >> %FilePath%
goto :eof
::#endregion

::#region generate index.html
:generateIndexHTML
set FilePath= "%CD%\%ProjectName%\public\index.html"
echo ^<!DOCTYPE html^>  >> %FilePath%
echo ^<html lang="en"^>  >> %FilePath%
echo     ^<head^>  >> %FilePath%
echo        ^<meta charset="utf-8" /^>  >> %FilePath%
echo        ^<meta name="viewport" content="width=device-width, initial-scale=1" /^>  >> %FilePath%
echo        ^<meta name="theme-color" content="#000000" /^>  >> %FilePath%
echo        ^<meta name="description" content="Web site created using create-react-app" /^>   >> %FilePath%
echo        ^<link rel="manifest" href="%%PUBLIC_URL%%/manifest.json" /^>  >> %FilePath%
echo        ^<title^>%ProjectName%^</title^>  >> %FilePath%
echo    ^</head^>  >> %FilePath%
echo    ^<body^>  >> %FilePath%
echo        ^<noscript^>You need to enable JavaScript to run this app.^</noscript^>  >> %FilePath%
echo        ^<div id="root"^>^</div^>  >> %FilePath%
echo    ^</body^>  >> %FilePath%
echo ^</html^>  >> %FilePath%
goto :eof
::#endregion

::#region generate index.js
:generateIndexJS
set FilePath= "%CD%\%ProjectName%\src\index.js"
echo import React from 'react';  >> %FilePath%
echo import ReactDOM from 'react-dom';  >> %FilePath%
echo import App from './App';  >> %FilePath%
echo. >> %FilePath%
echo ReactDOM.render^(  >> %FilePath%
echo    ^<React.StrictMode^>  >> %FilePath%
echo        ^<App /^>  >> %FilePath%
echo    ^</React.StrictMode^>,  >> %FilePath%
echo    document.getElementById('root')  >> %FilePath%
echo );  >> %FilePath%
goto :eof
::#endregion

::#region App.js
:generateAppJS
set FilePath= "%CD%\%ProjectName%\src\App.js"
echo import React from 'react';  >> %FilePath%
echo. >> %FilePath%
echo function App() {  >> %FilePath%
echo    return ( >> %FilePath%
echo        ^<div^>  >> %FilePath%
echo        ^</div^>  >> %FilePath%
echo    );  >> %FilePath%
echo }  >> %FilePath%
echo. >> %FilePath%
echo export default App;  >> %FilePath%
goto :eof
::#endregion

::#region gitignore
:generateGitIgnore
set FilePath= "%CD%\%ProjectName%\.gitignore"
echo # See https://help.github.com/articles/ignoring-files/ for more about ignoring files. >> %FilePath%
echo. >> %FilePath%
echo # dependencies >> %FilePath%
echo /node_modules >> %FilePath%
echo /.pnp  >> %FilePath%
echo .pnp.js  >> %FilePath%
echo. >> %FilePath%
echo # testing >> %FilePath%
echo /coverage >> %FilePath%
echo. >> %FilePath%
echo # production >> %FilePath%
echo /build >> %FilePath%
echo. >> %FilePath%
echo # misc  >> %FilePath%
echo .DS_Store >> %FilePath%
echo .env.local >> %FilePath%
echo .env.development.local >> %FilePath%
echo .env.test.local >> %FilePath%
echo .env.production.local >> %FilePath%
echo . >> %FilePath%
echo npm-debug.log* >> %FilePath%
echo yarn-debug.log* >> %FilePath%
echo yarn-error.log* >> %FilePath%
goto :eof
::#endregion