
<!-- README.md is generated from README.Rmd. Please edit that file -->
paretopractice
==============

The goal of paretopractice is to practice builing R package with a set of probability distribution calculation functions.

Installation
------------

You can install paretopractice from github with:

``` r
# install.packages("devtools")
devtools::install_github("petershan1119/paretopractice")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(paretopractice)
my_sample <- rgamma(100, shape=2, scale=4)
mom_gamma(my_sample)
#> $k_hat
#> [1] 2.020066
#> 
#> $theta_hat
#> [1] 3.766173
```
