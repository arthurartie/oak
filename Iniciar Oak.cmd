@echo off
rem Liga o servidor do Oak por fora do app do Claude, para a previa nao sumir. Rode uma vez depois de ligar o computador.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0.claude\iniciar-oak.ps1"
