title Nom_appli
@echo off

set cwd=%~dp0

echo %date%%time% : Lancement de %cwd%
"C:\Program Files\R\R-4.0.2\bin\x64\R.exe" CMD BATCH %cwd%\lancement_appli.R
