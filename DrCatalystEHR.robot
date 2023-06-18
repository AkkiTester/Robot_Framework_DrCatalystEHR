
*** Settings ***
Library    Selenium2Library
Test Setup     Open Browser   ${appurl}   ${browser}
Test Teardown   Close Browser

*** Variables ***
${appurl}   https://iemodemoindia.meditab.com/#/login
${browser}     chrome

*** Test Cases ***
LoginTest With Valid Credentials
    [Tags]    Smoke
    Maximize Browser Window
    Enter Clinic
    Sleep    1s
    Enter Username
    Sleep    1s
    Enter Password
    Sleep    1s
    Click Demo Login
    Sleep    5s
    Verify Login
    Sleep    3s

LoginTest With inValid Credentials
    [Tags]    Regression
    Maximize Browser Window
    Enter Clinic
    Sleep    1s
    Enter Username
    Sleep    1s
    Enter Password
    Sleep    1s
    Click on Login
    Sleep    10s
    ${url}  Get Location
    Log To Console    $(url)
    Should Contain    ${url}    login




*** Keywords ***
 Enter Clinic
    Input Text    xpath://mtab-input-text[@id='clinic']//input[@type='TEXT']     Dilwale

Enter Username
    Input Text    //mtab-input-text[@id='username']//input[@type='TEXT']     Akash

Enter Password
    Input Text    //input[@type='PASSWORD']     Dil

Click Demo Login
    Click Element        xpath://label[normalize-space()='Demo Login']

Click on Login
    Click Element    xpath://span[normalize-space()='Login']


Verify Login
    ${url}  Get Location
    Log To Console    $(url)
    Should Contain    ${url}    dashboard
