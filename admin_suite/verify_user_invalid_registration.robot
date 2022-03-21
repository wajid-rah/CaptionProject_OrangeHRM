*** Settings ***
Documentation   This suite handles test case related to Admin

Resource   ../resource/base/common_functionality.resource

Test Setup  Launch Browser
Test Teardown  Close Browser
Test Template       Verify Add System User Templ


*** Test Cases ***
TC1     Admin  zzz     jadine_jackie5333    Enabled     abcd@1234   abcd@1234       Employee does not exist
TC2     ESS    Joe Root    joe_     Disabled    defgd@1234   defgd@1234     Should have at least 5 characters
TC3     Admin    Jadine Jackie      jadine_jakie6667     Enabled     abcd@12343     abcd@1234     Passwords do not match
TC4     Admin    Jadine Jackie      jadine_jakie6667     Enabled     abcd@12343     ${EMPTY}     Required



*** Keywords ***
Verify Add System User Templ
    [Arguments]     ${user_role}    ${emp_name}     ${user_name}    ${status}   ${password}     ${confirm_password}     ${error}
    Click Element    id=menu_admin_viewAdminModule
    Mouse Over      id=menu_admin_UserManagement
    Click Element   id=menu_admin_viewSystemUsers
    Click Element   id=btnAdd

    Select From List By Label    xpath=//select[@id="systemUser_userType"]      ${user_role}
    Input Text     id=systemUser_employeeName_empName    	${emp_name}
    Input Text    name=systemUser[userName]    ${user_name}
    Select From List By Label    id=systemUser_status    ${status}
    Input Password      id=systemUser_password      ${password}
    Input Password    id=systemUser_confirmPassword    ${confirm_password}
    Press Keys    id=btnSave     Enter

    Element Should Contain    id=frmSystemUser    ${error}






