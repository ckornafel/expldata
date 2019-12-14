
<!-- README.md is generated from README.Rmd. Please edit that file -->

# expldata

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/ckornafel/expldata.svg?branch=master)](https://travis-ci.com/ckornafel/expldata)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/ckornafel/expldata?branch=master&svg=true)](https://ci.appveyor.com/project/ckornafel/expldata)
<<<<<<< HEAD
[![Codecov test
coverage](https://codecov.io/gh/ckornafel/expldata/branch/master/graph/badge.svg)](https://codecov.io/gh/ckornafel/expldata?branch=master)
=======
>>>>>>> 193a19d7a05c69148142d703da7f819e0eaa1584
<!-- badges: end -->

This package provides easy to use functions that can be used to perform
initial exploratory data analysis. Instead of using multiple functions
from multiple packages, this package allows a single command to perform
and display beneficial data information, allowing the user to plan any
necessary transformations and corrections prior to selecting the most
appropriate model and or technique. .

## Installation

You can install the released version of expldata from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("expldata")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ckornafel/MSDS696-EDAPackage")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(expldata)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
