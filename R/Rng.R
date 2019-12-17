#' Identifies Max, Min, and Spread of Numeric Columns
#'
#' @description Determines maximum value and minimum value for each numeric column
#' as well as calculates the total range (spread) of the values. If multiple
#' @description If verbose = TRUE, displays results to console
#' @description If Verbose = FALSE, returns dataframe of results
#'
#' @param x A matrix-like R object
#' @param verbose Logical operator
#'
#' @seealso \code{\link{summary}}
#'
#' @return A dataframe of results
#' @export
#'
#' @rawNamespace import(huxtable, except = theme_grey)
#'
#' @examples \dontrun{
#' x <- data.frame("X1" = c(1,2,3,1,2,3),
#'                 "X2" = 1:6,
#'                 "X3"= c("a","b","c","a","b","c"))
#'
#' Rng(x)
#'
#' value <- Rng(x, verbose = FALSE)
#' }
Rng <- function(x, verbose = TRUE){

  ########### Error Checks ####################################

  ## Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!is.logical(verbose)){
    stop("verbose must be of type: logical")
  }

  ########### Function #######################################

  #Creating a temp copy of object
  temp <- x

  #Adding Column Names if Missing
  if(is.null(colnames(temp))){
    colnames(temp) <- 1:ncol(temp)
  }

  #Creating Full Column Data Frame
  t_df <- data.frame("Column" = colnames(temp))

  #Identifying numeric columns
  num_col <- unlist(lapply(x, is.numeric))

  #Subsetting original columns
  num_df <- x[,num_col]

  #Determining Min and Max Values of Each Numeric Column
  min_df <- data.frame("Column" = colnames(num_df), "Min_Value" = sapply(num_df, min,na.rm = TRUE))
  max_df <- data.frame("Column" = colnames(num_df), "Max_Value" = sapply(num_df, max,na.rm = TRUE))

  #Merging Min and Max together
  temp_df <- merge(min_df,max_df, by.x = c("Column"), by.y = c("Column"))

  #Calculating Spread of Range
  temp_df$Spread <- temp_df$Max_Value - temp_df$Min_Value

  #Recombing Values with Original DataFrame
  range_df <- merge(t_df, temp_df, by.x = c("Column"), by.y =c("Column"), all.x = TRUE)

  #Determining to Print to Console
  if(!verbose){
    return(range_df)

  }else{
    #Creating Huxtable Object
    ht_mm <- as_huxtable(range_df, add_colnames = TRUE)
    caption(ht_mm)<- "Range of Numeric Columns"
    caption_pos(ht_mm)<- "topleft"
    right_padding(ht_mm) <- 10
    left_padding(ht_mm) <- 10
    bold(ht_mm)[1,] <- TRUE
    bottom_border(ht_mm)[1,]<-1

    print_screen(ht_mm, colnames = FALSE)
  }
}

# num_col <- unlist(lapply(df_type, is.numeric))
#
# num_id <- df_type[,num_col]
#
# t_df <- data.frame("Column" = colnames(df_type))

# min_df <- data.frame("Column" = colnames(num_id), "Min_Value" = sapply(num_id, min,na.rm = TRUE))
# max_df <- data.frame("Column" = colnames(num_id), "Max_Value" = sapply(num_id, max,na.rm = TRUE))
# temp_df <- merge(min_df,max_df, by.x = c("Column"), by.y = c("Column"))
# temp_df$Spread <- temp_df$Max_Value - temp_df$Min_Value
#
# return_df <- merge(t_df, temp_df, by.x = c("Column"), by.y =c("Column"), all.x = TRUE)

