if you want to shar code, please upload rmd file here

*The kaggle data set is uploaded here; you can download the file here insted*
* project code is to be done in Rmarkdon*

*Here is the new clean data set. It doesn;t remove all of the NA's, but it removes most of it*
CostC <- Cost[-sample(1:nrow(Cost), 55428), ]
CostClean<- CostC %>% mutate(food_category = fct_lump_min(food_category,125),
                             food_department= fct_lump_min(food_department,175),
                             promotion_name = fct_lump_min(promotion_name,125),
                             brand_name = fct_lump_min(brand_name,85),
                             store_city = fct_lump_min(store_city,100),
                             store_type = fct_lump_min(store_type, 550),
                             store_state = fct_lump_min(store_state, 700))

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
                                 media_type = as.factor(media_type),
                                 avg..yearly_income = as.factor(avg..yearly_income))
CostClean<- CostClean[,-30:-38]
