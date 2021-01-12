*** Settings ***
Documentation    登录页面主要操作
Library         SeleniumLibrary

*** Keywords ***
输入用户名密码并点击登录按钮
    [Arguments]     ${username}     ${passwd}
    Input Text      xpath://*[@id="name"]   ${username}
    Input Password  xpath://*[@id="pass"]   ${passwd}
    Click element   xpath://*[@type="submit"]


用户应该登录成功并跳转到首页
    Location Should Be  http://49.233.108.117:3000/

用户应该登录失败并且提示错误信息
    [Arguments]         ${error_msg}
    ${text}=            Get Text    xpath://div[@class="alert alert-error"]/strong
    Should Be Equal     ${text}     ${error_msg}