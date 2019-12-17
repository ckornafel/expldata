context("functional validation")

#Creating different structures for test
df <- data.frame(replicate(10,sample(0:10, 10, replace = TRUE)))
df.na <- df
df.na[2,2]<- NA


test_that("ColValid returns correct statements - VERBOSE = T",{

  expect_output(ColValid(df,10), "MATCH: The number of columns: 10 matches the expected count")
  expect_output(ColValid(df,5), "WARNING: The number of columns: 10 does not match the expected count of 5")
  expect_output(ColValid(df), "The number of columns is: 10")
})

test_that("ColType returns correct dataframe - VERBOSE = F",{
  dfct_true <- data.frame("Column" = c("X1","X2","X3","X4","X5","X6","X7","X8","X9","X10"),
                          "Col_Types"= c("integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"))
  rownames(dfct_true)<-c("X1","X2","X3","X4","X5","X6","X7","X8","X9","X10")
  expect_equal(ColType(df,verbose = FALSE), dfct_true)

})

test_that("Out returns correct dataframe - VERBOSE = F",{
  dfo<-data.frame("X1" = c(1,1,1,1),
                  "X2" = c(1,1,1,1),
                  "X3" = c(1,1,1,1),
                  "X4" = c(1,1,1,1))
  dfo_true <- data.frame("Column" = c("X1","X2","X3","X4"),
                         "Inner_Outliers" = c(0,0,0,0),
                         "Outer_Outliers" = c(0,0,0,0))

  expect_equal(Out(dfo,verbose = FALSE), dfo_true)

})

test_that("FindRowNA displays correct message with no NAs",{
  expect_output(FindRowNA(df), "Object does not have any missing values")
})

test_that("FindRowNA returns correct dataframe - Verbose = F",{

  dfrna_true <- data.frame("Row" = as.factor(2),
                           "NA_Count" = 1,
                           "Percent_of_Row" = "10.000 %",
                           stringsAsFactors = FALSE)

  expect_equivalent(FindRowNA(df.na, verbose = FALSE), dfrna_true)
})

test_that("FindColNA returns correct dataframe - Verbose = F",{
  dfcna_true <- data.frame("Column" = as.factor(c("X1",  "X2","X3","X4","X5","X6","X7","X8","X9","X10")),
                           "NA_Count" = c(0,1,0,0,0,0,0,0,0,0),
                           "NA_Percent" = c("0.00 %","10.00 %","0.00 %","0.00 %","0.00 %","0.00 %","0.00 %","0.00 %","0.00 %","0.00 %"),
                           stringsAsFactors = FALSE)

  expect_equivalent(FindColNA(df.na, verbose = FALSE), dfcna_true)
})

test_that("SWNormality returns a dataframe with expected rows - Verbose = F",{

  expect_equal(nrow(SWNormality(df, verbose = FALSE)), 10)

})

test_that("RowDup returns a dataframe with expected rows - Verbose = F",{

  expect_equal(nrow(RowDup(df, verbose = FALSE)), 1)

})

test_that("Rng returns a dataframe with expected values - Verbose = F",{
  x<-c(5,5)
  y<-c(1,2)
  d_rng <- data.frame(x,y)

  rng_result <- data.frame("Column" = c("x","y"),
                           "Min_Value" = c(5,1),
                           "Max_Value" = c(5,2),
                           "Spread" = c(0,1))

  expect_equal(Rng(d_rng, verbose = FALSE), rng_result)

})

test_that("CountVal returns a dataframe with expected values - Verbose = F",{
  x<-c(5,5)
  y<-c(1,2)
  d_cv <- data.frame(x,y)

  cv_result <- data.frame("Column" = c("x","y"),
                           "Unique_Values" = c(1,2),
                           "Duplicated_Values" = c(1,0))


  expect_equivalent(CountVal(d_cv, verbose = FALSE), cv_result)

})

test_that("OutsideRange returns the correct value",{

  expect_equal(OutsideRange(5, lower = 2, upper =3), 5)

})












