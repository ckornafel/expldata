set.seed(100)
library(tibble)

x = rnorm(100)
y = x*2 + rnorm(100)
sampleData = data_frame(x = x, y = y)

usethis::use_data(sampleData, compress = "xz")

