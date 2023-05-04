library('tidyverse')
Cost <- read.csv("datasets/media prediction and its cost.csv")
Cost %>% glimpse()

CostC <- Cost[-sample(1:nrow(Cost), 55428), ]
CostClean<- CostC %>% mutate(food_category = fct_lump_min(food_category,125),
                             food_department= fct_lump_min(food_department,175),
                             promotion_name = fct_lump_min(promotion_name,125),
                             brand_name = fct_lump_min(brand_name,85),
                             store_city = fct_lump_min(store_city,100))

CostClean<- CostClean %>% mutate(food_category = as.factor(food_category),
                             food_department= as.factor(food_department),
                             food_family = as.factor(food_family),
                             promotion_name = as.factor(promotion_name),
                             sales_country = as.factor(sales_country),
                             marital_status = as.factor(marital_status),
                             education = as.factor(education),
                             member_card = as.factor(member_card),
                             occupation = as.factor(occupation),
                             houseowner = as.factor(houseowner),
                             brand_name = as.factor(brand_name),
                             recyclable_package = as.factor(recyclable_package),
                             low_fat = as.factor(low_fat),
                             store_type = as.factor(store_type),
                             store_city = as.factor(store_city),
                             store_state = as.factor(store_state),
                             coffee_bar = as.factor(coffee_bar),
                             video_store = as.factor(video_store),
                             salad_bar = as.factor(salad_bar),
                             prepared_food = as.factor(prepared_food),
                             florist = as.factor(florist),
                             media_type = as.factor(media_type))

#Summary Stats
CostClean %>%  glimpse()
summary(CostClean)
view(CostClean)
                               





### This code is used for administrative work: do not touch ###
# the factor vector
#freq <- table(CostClean$food_category)
#print ("Frequency DataFrame")
# converting the table into data frame to check frequency
#freq_df <- as.data.frame(freq)
#print (freq_df)
