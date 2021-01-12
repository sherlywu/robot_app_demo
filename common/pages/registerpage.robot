*** Settings ***
Documentation    注册页面主要操作
Library         SeleniumLibrary


*** Keywords ***
输入用户名密码确认密码电子邮箱点击注册按钮
    [Arguments]     ${username}  ${passwd}  ${re_pwd}   ${email}
    Input Text      xpath://input[@id="loginname"]  ${username}
    Input Text      xpath://input[@id="pass"]       ${passwd}
    Input Text      xpath://input[@id="re_pass"]    ${re_pwd}
    Input Text      xpath://input[@id="email"]      ${email}
    Click Element   xpath://input[@value="注册"]

用户应该注册成功并跳转到激活页
    [Arguments]     ${success_msg}
    ${text}     Get Text    xpath://div[@class="alert alert-success"]/strong
    Should be Equal     ${text}     ${success_msg}

用户应该注册失败并且提示错误信息
    [Arguments]     ${error_msg}
    ${text}     Get Text    xpath://div[@class="alert alert-error"]/strong
    Should be Equal     ${text}     ${error_msg}