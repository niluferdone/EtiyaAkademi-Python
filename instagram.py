from selenium import webdriver
from selenium.webdriver.common.by import By
from time import sleep

driver=webdriver.Chrome()
driver.get("https://www.instagram.com/")
driver.maximize_window()
sleep(2)

input = driver.find_element(By.NAME,"username") 
input.send_keys("niluferdone")
input = driver.find_element(By.NAME,"password")
input.send_keys("xxxxx")


loginBtn = driver.find_element(By.XPATH,"/html/body/div[2]/div/div/div/div[1]/div/div/div/div[1]/section/main/article/div[2]/div[1]/div[2]/form/div[1]/div[3]/button/div")
loginBtnText=loginBtn.text
loginBtn.click()
sleep(2)

loginTitle = driver.title

if  loginTitle == "Instagram":
    print("Test Başarılı 😎")
else:
    print("Test Başarısız!  ❌") 

sleep(5)

input()