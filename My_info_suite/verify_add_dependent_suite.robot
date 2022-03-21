*** Settings ***
Documentation   This suite handles test case related to My Info Add Dependent
Library   DataDriver    file=../test_data/orange_data.xlsx      sheet_name=AddDependent
Resource   ../resource/base/common_functionality.resource


Test Setup  Launch Browser
Test Teardown  Close Browser
Test Template       Verify Add Dependent Templ


*** Test Cases ***
TC1

*** Keywords ***
Verify Add Dependent Templ
    [Arguments]     ${name}     ${relationship_type}  ${specify}    ${date_of_birth}
    Click Element    id=menu_pim_viewMyDetails
    Click Element    partial link=Dependents
    Press Keys  id=btnAddDependent      ENTER

    Input Text    id=dependent_name     ${name}
    Select From List By value    id=dependent_relationshipType      ${relationship_type}

    Run Keyword And Ignore Error    Input Text      id=dependent_relationship   ${specify}

    Input Text    id=dependent_dateOfBirth    ${date_of_birth}
    Click Element    id=btnSaveDependent

    Table Should Contain    id=dependent_list    ${name}
    Table Should Contain    id=dependent_list    ${date_of_birth}




