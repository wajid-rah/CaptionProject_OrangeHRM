*** Settings ***
Documentation   This suite handles test case related to valid Admin

Resource   ../resource/base/common_functionality.resource

Test Setup  Launch Browser
Test Teardown  Close Browser
Test Template       Verify Add System User Templ


*** Test Cases ***
TC1     Admin  Jadine Jackie   jadine_jackie5333    Enabled     abcd@1234   abcd@1234
TC2     ESS    Joe Root    joe_root5233     Disabled    defgd@1234   defgd@1234


*** Keywords ***
Verify Add System User Templ
    [Arguments]     ${user_role}    ${emp_name}     ${user_name}    ${status}   ${password}     ${confirm_password}
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

    Element Should Contain    id=resultTable    ${emp_name}
    Element Should Contain    id=resultTable    ${user_role}
    Element Should Contain    id=resultTable    ${user_name}
    Element Should Contain    id=resultTable    ${status}





