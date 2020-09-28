##################################################
## Project: industry workshop
## Script purpose: recap section 1 and 2
## Date: 10-03-2020
## Author: David JPO'Sullivan
##################################################

rm(list = ls()) # tidy work space
gc()

# libraries, source files and data ---------------

library(tidyverse)

# basics of r -------------------------------------------------------------

# assignment of vars
x <- 3 
x

# combining vectors
v1 <- c(1,2,3)
class(v1)

v2 <- 'This is a string'
class(v2)

v3 <- c(v1 , v2)
class(v3)

# indexing and sequences
v3[1]
v3[2:4]
v3[seq(from = 2, to = 4, by = 1)]
v3[c(T,F,T,F)]

# getting help on functions
?seq()

# logical operations
v4 = c(1,2,3,10,20,30)

v4 > 0
v4 > 20
v4 == 20
v4 != 20

## data frames 

# create a data frame
your_first_df <- data.frame(
  ID = 1:4, # create a varaible (column) called ID
  name = c("Stephen","Aoife","Pete","Sarah"), 
  female = c(F,T,F,T), # add logical for 'female' varaible
  age=c(22,33,44,55), # create a age variable
  stringsAsFactors = FALSE # other wise all 'strings' will be treated as factors
)

# subsetting - rows 1 and 2 with cols female and age
your_first_df[1:2,3:4]
your_first_df[1:2,c('female', 'age')]


# tidyverse - dplyr -------------------------------------------------------


# piping
x = seq(from = -5, to = 5, by = 1)
log(sum(abs(x))) # ugly looking

x %>% # much, much better looking
  abs() %>% 
  sum() %>% 
  log()

# The vast majority of data manipulation can be solved using just five dplyr functions:
#   
# - Pick observations by their values (`filter()`).
# - Reorder the rows (`arrange()`). 
# - Pick variables by their names (`select()`).
# - Create new variables by transforming existing variables (`mutate()`).
# - Collapse many values down to a single summary (`summarise()`).
# 
# The `group_by()` function allows the above operations to be split by a particular categorical/grouping variable. 

# read in flight data
flights <- read_csv('./data/flights.csv')

# have a peek at the first 6 rows of the flight data

flights %>% head

# use filter find all data in Nov, Dec, Jan
filter(flights, month %in% c(12, 11, 1))

# rearrange the rows in decreasing order
flights %>% arrange(desc(dep_delay))

# pull all cols between year and day
flights %>% select(year:day)

# create new vars using mutate
flights_sml <- select(flights, year:day, ends_with("delay"), 
                      distance, air_time)
mutate(flights_sml,
       gain = dep_delay - arr_delay, # add variable for how late the flight was
       hours = air_time / 60, # what was the air time in hours? 
       gain_per_hour = gain / hours 
)

# create summary for the typically delay time by month
flights %>% 
  group_by(month) %>% 
  summarise(
    median_delay = median(dep_delay, na.rm = TRUE),
    mean_delay = mean(dep_delay, na.rm = TRUE)
  )


# tidyverse - ggplot2 ----------------------------------------------------

# print the data to screen
mpg <- mpg %>% as_tibble()
mpg


# plot displ vs hwy coloring point by number of cylinders (cyl)
p <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = factor(cyl)))
p

# add a trend line
p + geom_smooth()

# other types of plot (boxplots)
ggplot(data = mpg) + 
  geom_boxplot(mapping = aes(x = class, y = hwy, fill = class))




