##################################################
## Project: industry
## Script purpose: recap section 1 and 2
## Date: 10-03-2020
## Author: David JP O'Sullivan
##################################################

rm(list = ls()) # tidy work space
gc()

# libraries, source files and data ---------------

install.packages('tidyverse')
library(tidyverse)

# basics of r -------------------------------------------------------------

# assignment of vars

# combining vectors

# indexing and sequences

# getting help on functions

# logcial operations

## data frames 

# create a data frame
your_first_df <- data.frame(
  ID = 1:4, # create a varaible (column) called ID
  name = c("Stephen","Aoife","Pete","Sarah"), 
  female = c(F,T,F,T), # add logical for 'female' varaible
  age=c(22,33,44,55), # create a age varaible
  stringsAsFactors = FALSE # other wise all 'strings' will be treated as factors
)

# subsetting - rows 1 and 2 with cols female and age


# tidyverse - dplyr -------------------------------------------------------


# piping
x = seq(from = -5, to = 5, by = 1)

abs(x)
sum(abs(x))
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

# rearrange the rows in decreasing order

# pull all cols between year and day

# create new vars using mutate
flights_sml <- select(flights, year:day, ends_with("delay"), 
                      distance, air_time)

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

# add a trend line

# other types of plot (boxplots)




