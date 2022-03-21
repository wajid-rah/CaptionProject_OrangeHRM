*** Settings ***
Documentation   This suite handles test case related to My Info Immigration
Library   DataDriver    file=../test_data/orange_data.xlsx      sheet_name=AddImmigration
Resource   ../resource/base/common_functionality.resource


Test Setup  Launch Browser
Test Teardown  Close Browser
Test Template       Verify Add Immigration Templ


*** Test Cases ***
TC1

*** Keywords ***
Verify Add Immigration Templ
    [Arguments]     ${sel}      ${number}   ${issue_date}   ${expire_date}      ${issue_by}
    Click Element    id=menu_pim_viewMyDetails
    Click Element    xpath=//a[contains(text(),'Immigration')]
    Press Keys    id=btnAdd     ENTER

    IF    '${sel}' == 'passport'
        Click Element    id=immigration_type_flag_1
    ELSE
         Click Element    id=immigration_type_flag_2
    END


    Input Text    id=immigration_number    ${number}
    Input Text     id=immigration_passport_issue_date      ${issue_date}
    Input Text      id=immigration_passport_expire_date     ${expire_date}
    Select From List By Label    id=immigration_country     ${issue_by}
    Press Keys      id=btnSave      ENTER

    Element Should Contain    //table[@class="table hover"]   ${number}
    Element Should Contain    //table[@class="table hover"]   ${issue_date}
    Element Should Contain    //table[@class="table hover"]   ${expire_date}
    Element Should Contain    //table[@class="table hover"]   ${issue_by}






