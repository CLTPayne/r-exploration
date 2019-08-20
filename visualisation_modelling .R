library(tidyverse)
library(gapminder)

# VISUALISATION STEP IN DATA SCIENCE WORKFLOW

# plot a specific type of graph with built in dataset mpg - car data
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y = hwy, x = trans))

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y = hwy, x = class))

# filter out the data by class - output rows in the console
mpg[mpg$class == 'compact',]

# jitter adds the same amount of random noise to spread the points out a little bit, 
# so that they are not overlapping and to try to give more of a sense of number of repeated results
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), position = 'jitter')

# add some colour to the different data 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

# alternative data set:
gapminder.subset <- gapminder[gapminder$year == '1977',]
gapminder.subset

ggplot(data = gapminder.subset) +
  geom_point(mapping = aes(x = gdpPercap, y = lifeExp, size = pop))

ggplot(data = gapminder.subset) +
  geom_point(mapping = aes(x = log10(pop), y = lifeExp))

# MODEL STEP IN DATA SCIENCE WORKFLOW

# Here lm is us trying to fit a linear model, but the data is not perhaps a great fit for a linear model
model.1 <- lm(lifeExp ~ gdpPercap, data = gapminder)
model.1$coefficients

# model describes a line through the data
# residual is the difference between what your model predicts and the actual observation
# can use the residuals to get a rough measure of how accurate the model is

# Summary of the model outputs a bunch of valuable properties for the model
# e.g. Adjusted R-squared:  0.3403 
summary(model.1) 

# the higher the r-squared the better, but the above gives us a measure to bench mark a model against
# now we can try and make a better model by adding a feature (another data point)

model.2 <- lm(lifeExp ~ gdpPercap + pop, data = gapminder)
# Adjusted R-squared:  0.3463 - tiny improvement
summary(model.2) 

model.3 <- lm(lifeExp ~ log10(gdpPercap), data = gapminder)
# Adjusted R-squared:  0.652 - much closer to 1
summary(model.3)