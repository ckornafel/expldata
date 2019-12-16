context("functional validation")


test_that("Functions return expected output", {
  #Creating expected output for tests

  set.seed(1)

  #Variables for RowValid, ColValid, RowSample, HasNA, FindColNA, FindRowNA
  df <- data.frame(replicate(10,sample(0:10, 10, replace = TRUE)))
  return_dfr_true <- data.frame("rows" = 10, "row_match" = TRUE)
  return_dfr_false <- data.frame("rows" = 10, "row_match" = FALSE)
  return_dfc_true <- data.frame("cols" = 10, "row_match" = TRUE)
  return_dfc_false <- data.frame("cols" = 10, "row_match" = FALSE)

  #Variables for HasNA, FindColNA, FindRowNA
  df_na <- df
  df_na[2,2] <-NA #Missing Value Data Frame

  per_col <- c("0.00 %",  "10.00 %", "0.00 %",  "0.00 %",  "0.00 %",  "0.00 %",  "0.00 %",  "0.00 %",  "0.00 %",  "0.00 %")
  return_HasColNA_true <- data.frame("Column" = as.factor(colnames(df_na)),
                                     "NA_Count" = c(0,1,0,0,0,0,0,0,0,0),
                                     "Percent_of_Column" = per_col,
                                     stringsAsFactors = FALSE)

  rownames(return_HasColNA_true)<-c()


  return_FindRowNA_true <- data.frame("Row" = as.factor("2"),
                                     "NA_Count" = 1,
                                     "Percent_of_Row" = "10.000 %",
                                     stringsAsFactors = FALSE)



  #Variables for ColType
  df_type <- data.frame(num1 = rnorm(5),
                        int2= c(1:5),
                        log3 = c(TRUE, TRUE, FALSE, FALSE, TRUE),
                        fac4 = letters[1:5])
  return_ColType_true <- data.frame("Column" = as.factor(colnames(df_type)), "Col_Types" = as.factor(c("numeric",
                                                                                  "integer",
                                                                                  "logical",
                                                                                  "factor")))

  #Variables for CountVal
  df_cval <- data.frame(int2= c(1:5),
                        log3 = c(TRUE, TRUE, FALSE, FALSE, TRUE),
                        chr4 = c("a", "a", "b","b", "c"),
                        fac5 = letters[1:5])
  return_CountVal_true <- data.frame("Column" = c("int2", "log3", "chr4", "fac5"),
                                     "Unique_Values" = c(5,2,3,5),
                                     "Duplicated_Values" = c(0,3,2,0))

  ################################### TESTS #######################################################
  #RowValid - Default Verbose
  expect_output(RowValid(df,10), "MATCH: The number of rows: 10 matches the expected count")
  expect_output(RowValid(df,5), "WARNING: the number of rows: 10 does not match the expected count of 5", )
  expect_output(RowValid(df), "The number of rows is: 10")

  #RowValid - FALSE Verbose
  expect_equal(RowValid(df,10, verbose = FALSE), return_dfr_true)
  expect_equal(RowValid(df,5,verbose = FALSE), return_dfr_false)


  #ColValid - Default Verbose
  expect_output(ColValid(df,10), "MATCH: The number of columns: 10 matches the expected count")
  expect_output(ColValid(df,5), "WARNING: The number of columns: 10 does not match the expected count of 5")
  expect_output(ColValid(df), "The number of columns is: 10")

  #ColValid - FALSE Verbose
  expect_equal(RowValid(df,10, verbose = FALSE), return_dfr_true)
  expect_equal(RowValid(df,5,verbose = FALSE), return_dfr_false)

  #RowSample - Returns expected number of rows
  expect_equal(nrow(RowSample(df,5)),5)

  #HasNA
  expect_equal(HasNA(df), FALSE)
  expect_equal(HasNA(df_na), TRUE)

  #FindColNA
  expect_equivalent(FindColNA(df_na, verbose = FALSE), return_HasColNA_true)

  #FindRowNA
  expect_output(FindRowNA(df), "Object does not have any missing values")
  expect_equivalent(FindRowNA(df_na, verbose = FALSE), return_FindRowNA_true)

  #ColType
  expect_equivalent(ColType(df_type, verbose = FALSE), return_ColType_true)

  #CountVal
  expect_equivalent(CountVal(df_cval, verbose = FALSE), return_CountVal_true)
})




