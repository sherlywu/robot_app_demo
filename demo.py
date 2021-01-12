from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome(executable_path='./drivers/chromedriver')
# 最大化窗口
driver.maximize_window()

driver.get("http://49.233.108.117:3000/signin")

driver.find_element_by_xpath('//*[@id="name"]').send_keys('test30')
driver.find_element_by_xpath('//*[@id="pass"]').send_keys('123456')
driver.find_element_by_xpath('//input[@value="登录"]').click()

driver.find_element_by_xpath('//*[@id="create_topic_btn"]').click()


driver.find_element_by_xpath('//*[@id="tab-value"]').click()
driver.find_element_by_xpath('//*[@value="ask"]').click()

driver.find_element_by_xpath('//*[@id="title"]').send_keys('123456789')

content = driver.find_element_by_xpath('//div[@class="CodeMirror-scroll"]')
content.click()

ac = ActionChains(driver)
ac.move_to_element(content)\
    .send_keys('helloworld')\
    .double_click(content)\
    .key_down(Keys.CONTROL)\
    .send_keys('a')\
    .key_up(Keys.CONTROL)\
    .pause(1)\
    .key_down(Keys.CONTROL)\
    .send_keys('b')\
    .key_up(Keys.CONTROL)\
    .perform()

driver.find_element_by_xpath('//*[@value="提交"]').click()

# driver.find_element_by_xpath('//div[@class="CodeMirror-scroll"]').send_keys('1234567')