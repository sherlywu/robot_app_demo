*** Settings ***
Documentation    用户登录
Library         SeleniumLibrary



*** Keywords ***
首页导航_用户导航到
    [Arguments]     ${page_name}
    ${pages}=       Get WebElements     xpath://ul[@class="nav pull-right"]/li
    FOR     ${page}     IN      @{pages}
        ${text}=    Get Text    ${page}
        Run Keyword If  '${text}'=='${page_name}'   click element   ${page}
        Run Keyword if  '${text}'=='${page_name}'   Exit For Loop
    END

