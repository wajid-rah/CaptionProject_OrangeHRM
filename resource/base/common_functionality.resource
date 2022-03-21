*** Settings ***
Documentation   This file handles browser configuration reusable scripts.

Library     SeleniumLibrary

*** Variables ***
${BROWSER_NAME}     chrome
${URL}     https://opensource-demo.orangehrmlive.com/
${USER_NAME}    Admin
${PASSWORD}     admin123

*** Keywords ***
Launch Browser
    IF  '${BROWSER_NAME}'=='edge'
        Set Local Variable    ${driver_name}     msedgedriver.exe
    ELSE IF  '${BROWSER_NAME}'== 'ff'
        Set Local Variable    ${driver_name}     geckodriver.exe
    ELSE
        Set Local Variable    ${driver_name}     chromedriver.exe
    END

    Open Browser    browser=${BROWSER_NAME}     executable_path=${EXECDIR}${/}driver${/}${driver_name}
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Set Screenshot Directory    ${EXECDIR}${/}screenshots
    Go To    url=${URL}
    Input Text      id=txtUsername    ${USER_NAME}
    Input Password    id=txtPassword    ${PASSWORD}
    Click Element       id=btnLogin
