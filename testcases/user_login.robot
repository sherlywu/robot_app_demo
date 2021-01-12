*** Settings ***
Documentation    用户登录
Resource        ../common/common.robot
Resource        ../common/useraction.robot
Resource        ../common/pages/loginpage.robot
Suite Setup     打开浏览器到网站首页
Suite Teardown  关闭浏览器
Test Setup      首页导航_用户导航到  登录
Test Teardown   清除用户登录状态并跳转至首页

*** Test Cases ***
使用正确的用户名和密码成功登录系统
    输入用户名密码并点击登录按钮  fanmao1     123456
    用户应该登录成功并跳转到首页


使用错误的用户名和密码登录失败验证错误提示信息
    输入用户名密码并点击登录按钮  ${EMPTY}    123456
    用户应该登录失败并且提示错误信息    信息不完整。

使用错误的用户名和密码登录失败验证错误提示信息
    输入用户名密码并点击登录按钮  ${EMPTY}    ${EMPTY}
    用户应该登录失败并且提示错误信息    信息不完整。


使用错误的用户名和密码登录失败验证错误提示信息
    输入用户名密码并点击登录按钮  helloworld    123456
    用户应该登录失败并且提示错误信息    用户名或密码错误


