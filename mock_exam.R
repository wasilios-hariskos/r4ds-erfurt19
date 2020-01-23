# Pers?nliche Daten

Matrikelnummer <- 
Vorname <- ""
Name <- ""

# Required data and packages
load("outputs.RData")
# install.packages(c("dplyr", "gapminder", "ggplot2", "moderndive", "skimr", "png"))
library(dplyr)
library(gapminder)
library(ggplot2)
library(moderndive)
library(skimr)
library(png)



#06----
## Run the code below and look at the output in the console 
cat("\014") 
print(output05)
print(output06)
## Create "output06" by taking the column means of matrix "output05" and assign it to "answer06"

####################ONLY CHANGE THIS PART#########################

answer06 <- ??

##################################################################

# Clear console and compare answer with desired output
cat("\014") 
print(answer06)
print(output06)
# Save script with "Strg + S"

#12----
## Run the code below and look at the output in the console and in plots
cat("\014")
ggplot(data = output12) + 
  geom_point(mapping = aes(x = year, 
                          y = median_life_expectancy))
head(output12) # head of data used for the plot

glimpse(gapminder) # original dataset

## Prepare the data for the plot (and assign them to answer12):
####################ONLY CHANGE THIS PART#########################

answer12 <- gapminder %>% 
  group_by(?) %>% 
  ?(median_life_expectancy = median(?))

##################################################################

# Clear console and compare answer with desired output
cat("\014") 
print(answer12)
print(output12)
# Save script with "Strg + S"

#15----
## Get the average population in 2007
cat("\014") 
print(output15)
glimpse(gapminder)
####################ONLY CHANGE THIS PART#########################

answer15 <- gapminder %>%
  ?(year == 2007) %>%
  ?(average_population = ?(pop))
  
##################################################################

# Clear console and compare answer with desired output
cat("\014") 
print(answer15)
print(output15)
# Save script with "Strg + S"


#2324---- (6 points)
## Use the "lm()" function to fit the regression model displayed "output2324"
## Assign the model to "answer2324"
cat("\014") 
print(output2324)

####################ONLY CHANGE THIS PART#########################

answer2324 <- lm(score ~ bty_avg, 
                 data = evals_ch6)

##################################################################

print(answer2324)

#2728---- (6 points)
## Use functions from the dplyr and skimr packages to create the "output2728"
## Assign the code to variable "answer2728"
cat("\014") 
print(output2728)

glimpse(gapminder)

####################ONLY CHANGE THIS PART#########################

answer2728 <- gapminder %>% 
  filter(year == 2007) %>% 
  select(?, ?) %>% 
  ?()

##################################################################

print(answer2728)