SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell.exe -noninteractive -command git config --get user.name`) DO (
  SET gitUserName=%%F
)

FOR /F "tokens=* USEBACKQ" %%F IN (`git config --get user.email`) DO (
  SET gitUserEmail=%%F
)

 

docker build -t foo .
docker run ^
  -v ~/.ssh:/ssh ^
  -v %cd%:/app ^
  -e GIT_AUHOR_NAME="%gitUserName%" ^
  -e EMAIL="%gitUserEmail%" ^
  -it foo %*

ENDLOCAL
@echo on
:: docker run -e EMAIL="%gitUserEmail%" -e GIT_AUHOR_NAME="%gitUserName%" -it foo %*
:: docker run -it foo bash

:: docker run ^
::   -e EMAIL="$(git config --get user.email)" ^
::   -e GIT_AUHOR_NAME="$(git config --get uer.name)" ^
::   -it foo bash