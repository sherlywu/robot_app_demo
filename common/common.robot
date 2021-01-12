*** Settings ***
Documentation    定义常用的操作
Library         SeleniumLibrary

*** Variable ***
${indexpage}    http://49.233.108.117:3000/


*** Keywords ***
打开浏览器到网站首页
    Open Browser    url=${indexpage}     browser=chrome  executable_path=./drivers/chromedriver
    Set Selenium Implicit Wait   10
    Maximize Browser Window


发布话题
    [Arguments]     ${tab-selector}     ${title}        ${content}
    Click Element  xpath://span[@class="span-success"]
    ${tags}=    Get WebElements     xpath://select[@name="tab"]/option
    FOR     ${tag}      IN      @{tags}
        ${text}=    Get Text    ${tag}
        Run Keyword If  '${text}'=='${tab-selector}'   click element    ${tag}
        Run Keyword if  '${text}'=='${tab-selector}'   Exit For Loop
    END
    Input Text      xpath://textarea[@name="title"]     ${title}
    Press Keys      xpath://div[@class="CodeMirror-scroll"]      ${content}
    Click Element       xpath://input[@value="提交"]


选中某个话题点击进入详情页
    [Arguments]     ${select_title}
    ${titles}=      Get WebElements     xpath://div[@class="cell"]//a[@class="topic_title"]
    FOR     ${title}    IN      @{titles}
        ${text}=    Get Text    ${title}
        Run Keyword If  '${text}'=='${select_title}'   click element    ${title}
        Run Keyword if  '${text}'=='${select_title}'   Exit For Loop
    END

回帖
    [Arguments]     ${reply_con}
    Press Keys  xpath://div[@class="CodeMirror-scroll"]     ${reply_con}
    Click Element   xpath://input[@value="回复"]


关闭浏览器
    Close All Browsers

清除用户登录状态并跳转至首页
    Delete All Cookies
    Go To   ${indexpage}
