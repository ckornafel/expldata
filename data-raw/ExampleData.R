set.seed(100)
example_df <- data.frame(replicate(5,sample(0:10, 10, replace = TRUE)))
example_df$X10 <- as.factor(c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE))
example_df$X11 <- c("a","b","c","d","a","b","c","d","a","b")
colnames(example_df)<- c("Num1","Num2","Num3","Num4","Num5","Fact1","Char1",)
str(example_df)
ExampleData <- example_df

usethis::use_data(ExampleData, compress = "xz")
