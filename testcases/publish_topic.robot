*** Settings ***
Documentation    用户发帖
Resource        ../common/common.robot
Resource        ../common/useraction.robot
Resource        ../common/pages/loginpage.robot
Suite Setup     打开浏览器到网站首页
Suite Teardown  关闭浏览器
Default Tags    用户发帖测试


*** Test Cases ***
用户登录
    首页导航_用户导航到              登录
    输入用户名密码并点击登录按钮      fanmao1     123456

用户发帖
    发布话题    分享      测试技术学习的方法       测试技术学习的方法就是不停的练习，保持肌肉手感，每天坚持一练，一定会有成效的！

退出登录
    清除用户登录状态并跳转至首页