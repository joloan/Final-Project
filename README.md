# Final-Project
Here is to make the data set 5000 rows
library('tidyverse')
Cost <- read.csv("datasets/media prediction and its cost.csv")
Cost %>% glimpse()

Cost <- Cost[-sample(1:nrow(Cost), 55428), ]
