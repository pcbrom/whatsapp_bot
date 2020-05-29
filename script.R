library(rvest)
library(dplyr)
library(XML)
library(RSelenium)

rD = rsDriver(browser = "firefox", check = F, verbose = F) #, extraCapabilities = list("moz:firefoxOptions" = list(args = list('--headless')))
remDr = rD[["client"]]
remDr$navigate("https://web.whatsapp.com/")
Sys.sleep(30)
webElem = remDr$findElement(using = 'xpath', "//div[@title='Nova conversa']")$clickElement()
webElem = remDr$findElement(using = 'xpath', "//div[@contenteditable='true']")
webElem$sendKeysToElement(list("blackbeltR.com.br"))
Sys.sleep(3)
webElem$sendKeysToElement(list(key = "enter"))
for (i in 1:length(txt.zap)) {
  webElem = remDr$findElement(using = 'xpath', "//div[@spellcheck='true']")
  webElem$sendKeysToElement(list(txt.zap[i]))
  Sys.sleep(5)
  webElem$sendKeysToElement(list(key = "enter"))
}
remDr$close()
rD[["server"]]$stop()
