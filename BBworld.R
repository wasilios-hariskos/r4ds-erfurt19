# Load packages
library(ggplot2)
library(dplyr)
library(gapminder)
library(ggrepel)

# Plot at country level ----
my_data <- gapminder %>% filter(year == 1982)

# lifeExp: Individual level
medianObs <- sum(my_data$pop)/2
hl <- my_data %>% 
  arrange(lifeExp) %>%
  mutate(cumsumPop = cumsum(as.numeric(pop))) %>% 
  filter(cumsumPop >= medianObs) %>% 
  summarize(median_lifeExp_pop = min(lifeExp))

# gdpPercap: Individual level
medianObs <- sum(my_data$pop)/2
vl <- my_data %>% 
  arrange(gdpPercap) %>%
  mutate(cumsumPop = cumsum(as.numeric(pop))) %>% 
  filter(cumsumPop >= medianObs) %>% 
  summarize(median_gdpPercap_pop = min(gdpPercap))

# Plot at population level ----
p <- ggplot(data = my_data) +
  geom_point(mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           color = continent,
                           size = pop)) +
  scale_x_log10() + 
  geom_hline(yintercept = as.numeric(hl),
             linetype="dotted") +
  geom_vline(xintercept = as.numeric(vl),
             linetype="dotted") +
  ggtitle(label = "Happy birthday BB!",
          subtitle = "The world when BB was born on November 18, 1982") +
  ylab("Life expectancy at birth, in years") + 
  xlab("GDP per capita (US$, inflation-adjusted)") +
  labs(color = "Continent", 
       size = "Population",
       caption = "Dotted line: Median at population level")


p
#theme_set(theme_grey()) # loading cowplot changes the theme, we go back to grey
theme_set(theme_bw())
#theme_set(theme_minimal())
# Add text annotations ----
friends <- c("Austria",                 
             "Bosnia and Herzegovina",  
             "France", 
             "Germany",
             "Greece", 
             "India",  
             "Portugal",
             "Romania",
             "Serbia", 
             "Singapore")

p + 
  geom_text_repel(mapping = aes(x = gdpPercap,
                                y = lifeExp,
                                label = country),
                  data = filter(my_data,
                                country %in% friends))