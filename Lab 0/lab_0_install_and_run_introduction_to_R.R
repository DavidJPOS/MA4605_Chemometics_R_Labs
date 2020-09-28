###############################################################################################
## Project: MA4605 chemometrics R labs
## Script purpose: install and run introduction to R package
## Date: 28-9-2020
## Author: David JP O'Sullivan
###############################################################################################

install.packages('devtools') # install this package

library(devtools)
devtools::install_github('https://github.com/DavidJPOS/IntroductionToR')

# Run this for the introduction to R coding.
learnr::run_tutorial(name = 'section_1_basics_of_R', package = 'IntroductionToR') 

# Run this for the introduction to the 'Tidyverse'.
learnr::run_tutorial(name = 'section_2_basics_of_tidyverse', package = 'IntroductionToR')

# This is a advcanced topic in using R, for this who are iterested.
learnr::run_tutorial(name = 'section_3_credit_default', package = 'IntroductionToR')