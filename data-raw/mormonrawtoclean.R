# Source: http://scriptures.nephi.org/
library(dplyr)
library(readr)

scripture_dat <- read_csv("./data-raw/mormon.csv")

book_of_mormon <- scripture_dat %>% 
  filter(volume_title == "Book of Mormon")

doctrine_and_covenants <- scripture_dat %>% 
  filter(volume_title == "Doctrine and Covenants")

pearl_of_great_price <- scripture_dat %>% 
  filter(volume_title == "Pearl of Great Price")

devtools::use_data(book_of_mormon,
                   doctrine_and_covenants, 
                   pearl_of_great_price,
                   overwrite = TRUE)

