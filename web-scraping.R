library(httr)
library(dplyr)
library(rvest)
library(stringr)

website_url <- "https://www.moh.gov.sg/"
#response <- GET(website_url)
#html <- content(response)
#status_code(response)

html <- read_html(website_url)

# get the element with text = 'Total Deaths',
# then get its parent,
# then get the text
total_deaths_text <-
    html %>% 
    html_nodes(xpath = "//p[@class='info' and text()='Total Deaths']") %>%
    html_nodes(xpath = "..") %>%
    html_text()

total_deaths_text2 <- str_extract(total_deaths_text, "[0-9]+(,[0-9]+)*")

total_deaths <- as.numeric(gsub(",", "", total_deaths_text2))
