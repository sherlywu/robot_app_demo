*** Settings ***
Documentation    用户注册
Resource        ../common/common.robot
Resource        ../common/useraction.robot
Resource        ../common/pages/registerpage.robot
Suite Setup     打开浏览器到网站首页
Suite Teardown  关闭浏览器
Test Setup      首页导航_用户导航到  注册
Test Teardown   清除用户登录状态并跳转至首页
Default Tags    用户注册测试


*** Test Cases ***
用户名不填密码确认密码和邮箱填注册失败验证错误提示信息
    输入用户名密码确认密码电子邮箱点击注册按钮   ${EMPTY}    123456  123456  202001021@qq.com
    用户应该注册失败并且提示错误信息    信息不完整。

密码不填用户名确认密码和邮箱填注册失败验证错误提示信息
    输入用户名密码确认密码电子邮箱点击注册按钮   sherly1991  ${EMPTY}  123456  202001021@qq.com
    用户应该注册失败并且提示错误信息    信息不完整。

确认密码填写错误用户名密码和邮箱填注册失败验证错误提示信息
    输入用户名密码确认密码电子邮箱点击注册按钮   sherly1992  123456  345678  sherly1992@qq.com
    用户应该注册失败并且提示错误信息    两次密码输入不一致。

输入注册过的用户名或邮箱注册失败验证错误提示信息
    输入用户名密码确认密码电子邮箱点击注册按钮   sherlywu  123456  123456  798721213@qq.com
    用户应该注册失败并且提示错误信息    用户名或邮箱已被使用。

输入未注册过的用户名或邮箱注册成功验证成功提示信息
    输入用户名密码确认密码电子邮箱点击注册按钮   sherly1980  123456  123456  sherly1980@qq.com
    用户应该注册成功并跳转到激活页    欢迎加入 Nodeclub！我们已给您的注册邮箱发送了一封邮件，请点击里面的链接来激活您的帐号。