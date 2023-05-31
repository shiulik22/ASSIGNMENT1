library(tidyverse)
library(rvest)

#ques1
html <- read_html(" https://www.moneyworks4me.com/best-index/nse-stocks/top-nifty50-companies-list/")
company_names <- html %>% html_elements(".company-ellipses a") %>% html_text()
CMP <- html %>% html_elements(".stick+ td span") %>% html_text()
price_change <- html %>% html_elements("td:nth-child(4) span") %>% html_text()
market_cap <- html %>% html_elements("td:nth-child(5)") %>% html_text()
week_high <- html %>% html_elements("td:nth-child(6) span") %>% html_text()
week_low <- html %>% html_elements("td:nth-child(7)") %>% html_text()
ROE <- html %>% html_elements("td:nth-child(8)") %>% html_text()
P_E <- html %>% html_elements("td:nth-child(9)") %>% html_text()
P_BV <- html %>% html_elements("td:nth-child(10)") %>% html_text()
EV_EBITDA <- html %>% html_elements("td:nth-child(11)") %>% html_text()
sales_Gr <- html %>% html_elements("td:nth-child(12)") %>% html_text()
profit_Gr <- html %>% html_elements("td:nth-child(13)") %>% html_text()
dataset <- data.frame("Company Name(M.Cap)"= company_names, "CMP"= CMP , "Price Change"= price_change, "Market Cap(Cr)"= market_cap, "52 week High"= week_high, "52 Week Low"= week_low, "ROE"= ROE , "P/E"= P_E, "P/BV"= P_BV, "EV/EBITDA"= EV_EBITDA, "5YSales Gr(%)"= sales_Gr, "5YProfit Gr(%)"= profit_Gr , nrow=50 , ncol=12)

#ques2
html <- read_html(" https://www.moneyworks4me.com/best-index/nse-stocks/top-nifty50-companies-list/")
table <- html %>% html_table(fill= TRUE)
