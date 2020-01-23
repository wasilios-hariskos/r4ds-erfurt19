library(tidyverse)
install.packages("moderndive")
library(moderndive)
library(skimr)
library(gapminder)

evals_ch5 <- evals %>%
  select(ID, score, bty_avg, age)

glimpse(evals_ch5)

evals_ch5 %>%
  sample_n(size = 5)

evals_ch5 %>%
  summarize(mean_bty_avg = mean(bty_avg), 
            mean_score = mean(score),
            median_bty_avg = median(bty_avg), 
            median_score = median(score))

evals_ch5 %>% 
  select(score, 
         bty_avg) %>% 
  skim()


evals_ch5 %>% 
  get_correlation(formula = score ~ bty_avg)

get_correlation(data = evals_ch5,
                formula = score ~ bty_avg)

b <- evals_ch5 %>% 
  summarize(correlation = cor(score, bty_avg))


a <- cor(evals_ch5$score, evals_ch5$bty_avg)

a*2

b * 2

ggplot(evals_ch5, aes(x = bty_avg, y = score)) +
  geom_point() +
  labs(x = "Beauty Score", 
       y = "Teaching Score",
       title = "Scatterplot of relationship of teaching and beauty scores") +
  geom_smooth(method = "lm")

# Fit regression model:

evals_ch5 %>% 
  lm(formula = score ~ bty_avg)

score_model <- lm(formula = score ~ bty_avg, 
                  data = evals_ch5)

summary(score_model)

# Get regression table:
get_regression_table(score_model)

regression_points <- get_regression_points(score_model)
regression_points

library(gapminder)
gapminder2007 <- gapminder %>%
  filter(year == 2007) %>%
  select(country, lifeExp, continent, gdpPercap)


gapminder2007 %>%
  select(lifeExp, continent) %>%
  skim()
