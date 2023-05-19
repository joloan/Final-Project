if you want to shar code, please upload rmd file here

*The kaggle data set is uploaded here; you can download the file here insted*
* project code is to be done in Rmarkdon*

*The new clean data set is in my updated r file, it is the first chunk*

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


This is may help with the interpretation for the coefficients:
Both dependent/response variable and independent/predictor variable(s) are log-transformed. Interpret the coefficient as the percent increase in the dependent variable for every 1% increase in the independent variable. Example: the coefficient is 0.198. For every 1% increase in the independent variable, our dependent variable increases by about 0.20%. For x percent increase, calculate 1.x to the power of the coefficient, subtract 1, and multiply by 100. Example: For every 20% increase in the independent variable, our dependent variable increases by about (1.20 0.198 – 1) * 100 = 3.7 percent. (https://data.library.virginia.edu/interpreting-log-transformations-in-a-linear-model/#:~:text=Interpret%20the%20coefficient%20as%20the,variable%20increases%20by%20about%200.20%25.)
