@echo off
SETLOCAL ENABLEEXTENSIONS
title Spike Generator
rem This runs the R scripts that launch the Spike Generator webapp

rem for execution of shiny app
set rScript=webapp\run.R

set rExecutablePath=resources\R-4.1.1\bin\RScript.exe

rem passing arguments to R script for host and port
%rExecutablePath% "%rScript%"%
  
  
pause