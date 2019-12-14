context("Input Validation")


test_that("Functions accept only dataframe or matrix", {

  #Creating different structures for test
  set.seed(1)
  df <- data.frame(replicate(10,sample(0:10, 10, replace = TRUE)))
  mat <- matrix(rnorm(100), ncol = 10)
  l <- list(a = 1:10, b = 1:10, c = 1:10)
  i <- 1:10

  #RowValid - Negative
  expect_error(RowValid(l,10), "object must be of type: dataframe, matrix" )
  expect_error(RowValid(i,1), "object must be of type: dataframe, matrix" )

  #ColValid - Negative
  expect_error(ColValid(l,10), "object must be of type: dataframe, matrix" )
  expect_error(ColValid(i,1), "object must be of type: dataframe, matrix" )

  #RowSample - Negative
  expect_error(RowSample(l,10), "object must be of type: dataframe, matrix" )
  expect_error(RowSample(i,1), "object must be of type: dataframe, matrix" )

  #HasNA - Negative
  expect_error(HasNA(l), "object must be of type: dataframe, matrix" )
  expect_error(HasNA(i), "object must be of type: dataframe, matrix" )

  #FindColNA - Negative
  expect_error(FindColNA(l), "object must be of type: dataframe, matrix" )
  expect_error(FindColNA(i), "object must be of type: dataframe, matrix" )

  #FindRowNA - Negative
  expect_error(FindRowNA(l), "object must be of type: dataframe, matrix" )
  expect_error(FindRowNA(i), "object must be of type: dataframe, matrix" )

  #ColType - Negative
  expect_error(ColType(l), "object must be of type: dataframe, matrix" )
  expect_error(ColType(i), "object must be of type: dataframe, matrix" )

  #CountVal - Negative
  expect_error(CountVal(l), "object must be of type: dataframe, matrix" )
  expect_error(CountVal(i), "object must be of type: dataframe, matrix" )

})

test_that("Functions accept only numeric n", {

  #Creating different structures for test
  df <- data.frame(replicate(10,sample(0:10, 10, replace = TRUE)))

  #RowValid - Negative
  expect_error(RowValid(df,"a"), "n must be of type: integer" )
  expect_error(RowValid(df,df), "n must be of type: integer" )

  #ColValid - Negative
  expect_error(ColValid(df,"a"), "n must be of type: integer" )
  expect_error(ColValid(df,df), "n must be of type: integer" )

  #RowSample - Negative
  expect_error(RowSample(df,"a"), "n must be of type: integer" )
  expect_error(RowSample(df,df), "n must be of type: integer" )

})

test_that("Functions accept only logical verbose", {

  #Creating different structures for test
  df <- data.frame(replicate(10,sample(0:10, 10, replace = TRUE)))

  #RowValid - Negative
  expect_error(RowValid(df,10, verbose = "a"), "verbose must be of type: logical")
  expect_error(RowValid(df,10, verbose = 1), "verbose must be of type: logical" )

  #ColValid - Negative
  expect_error(ColValid(df,10, verbose = "a"), "verbose must be of type: logical")
  expect_error(ColValid(df,10, verbose = 1), "verbose must be of type: logical" )

  #FindColNA - Negative
  expect_error(FindColNA(df, verbose = "a"), "verbose must be of type: logical")
  expect_error(FindColNA(df, verbose = 1), "verbose must be of type: logical" )

  #FindRowNA - Negative
  expect_error(FindRowNA(df, verbose = "a"), "verbose must be of type: logical")
  expect_error(FindRowNA(df, verbose = 1), "verbose must be of type: logical" )

  #ColType - Negative
  expect_error(ColType(df, verbose = "a"), "verbose must be of type: logical")
  expect_error(ColType(df, verbose = 1), "verbose must be of type: logical" )

  #CountVal - Negative
  expect_error(CountVal(df, verbose = "a"), "verbose must be of type: logical")
  expect_error(CountVal(df, verbose = 1), "verbose must be of type: logical" )
})








