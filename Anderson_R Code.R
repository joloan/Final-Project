### This is the code I have created. Although he amount of variables is killing me.###
###Ill see if lasso regression is a more efficient approach than linear regression###


library('tidyverse')
library('tidyverse')
library('rsample')
library('ggridges')
library('ggplot2')
library('tree')
library('caret')
library('glmnet')
library('glmnetUtils')
library('forcats')

Cost <- read.csv("datasets/media prediction and its cost.csv")
Cost %>% glimpse()

set.seed(765)

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
                                 media_type = as.factor(media_type),
                                 avg..yearly_income = as.factor(avg..yearly_income))

#Summary Stats
CostClean %>%  glimpse()
summary(CostClean)
view(CostClean)

#Splitting Data
CostSplit <- initial_split(CostClean, prop=0.8)
CostTrain <- training(CostSplit)
CostTest <- testing(CostSplit)
dim(CostSplit)

#Model for linear regression
CostModel <- lm(cost ~., data = CostTrain)

#Predictions train and test
predCostTrain <-  predict(CostModel, newdata = CostTrain)
predCostTrain


summary(CostModel)
#prediction of model out of sample
predCostTest <- predict(CostModel, newdata = CostTest)
predCostTest

#RMSE calculation
RMSE(predCostTrain, CostTrain$cost)
RMSE(predCostTest, CostTest$cost)


#Model for Decision Tree
CostTModel <- tree(cost~., data = CostTrain)

#Predicting traina and test
predCostTTrain <- predict(CostTModel, newdata = CostTrain)

predCostTTest <- predict(CostTModel, newdata = CostTest)

#RMSE Calculation
RMSE(predCostTTrain, CostTrain$cost)
RMSE(predCostTTest, CostTest$cost)



