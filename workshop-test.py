from selenium import webdriver
from selenium.webdriver.common.by import By
from time import sleep
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from datetime import date

driver = webdriver.Chrome()
driver.get("https://www.kodlama.io/")

driver.maximize_window() 
course = driver.find_elements(By.XPATH,'//*[@class="course-box-image-container"]') 
courseCount = len(course)

if courseCount == 6:
    print("Kurs sayısı başarılı!😎", "Kurs Sayısı:" + str(courseCount))
else:
    print("Kurs sayısı başarısız!❌")
driver.save_screenshot(str(date.today()) + '(1).png')

sleep(2)

search = driver.find_element(By.ID,"search-courses")
search.send_keys("senior")
sleep(2)

title = driver.find_element(By.XPATH,'//*[@title="Senior Yazılım Geliştirici Yetiştirme Kampı (.NET)"]')
titleTest = title.text
sleep(2)
if titleTest == "Senior Yazılım Geliştirici Yetiştirme Kampı (.NET)":
    print("Arama başarılı!😎")
else:
    print("Arama başarısız!❌")
driver.save_screenshot(str(date.today()) + '(2).png')
input()
