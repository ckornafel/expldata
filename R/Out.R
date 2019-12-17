#' Determines Inner and Outer IQR Fence Outlier Counts
#'
#' @description Determines number of values by column that fall between
#' the inner and outer IQR Range Fences. The inner fence is 1.5 times the
#' 1st and 3rd quartile and the outer fence is 3 times the distance.
#' @description If verbose = TRUE, displays results to console
#' @description If Verbose = FALSE, returns dataframe of results
#'
#' @param x A matrix-like R object
#' @param verbose Logical operator
#'
#' @return A dataframe of results
#'
#' @export
#' @import huxtable
#'
#' @examples \dontrun{
#' x <- data.frame("X1" = c(71,70,73,70,70,69,70,72,71,300,71,69),
#'                 "X2" = c(71,70,73,70,70,66,70,72,71,300,71,301),
#'                 "X3" = c(71,70,73,70,70,69,70,72,71,71,71,69))
#'
#' Out(x)
#'
#' value <- Out(x, verbose = FALSE)
#' }
Out <- function(x, verbose = TRUE){

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

  #Calculating Number of Outliers at Each Fence
  outer_outliers <-sapply(num_df, IQRange, fence = 1)
  inner_outliers <-sapply(num_df, IQRange, fence = 2)

  #Correcting for Overlap in Outliers
  inner_outliers <- inner_outliers - outer_outliers

  #Creating Dataframe to Return/Print to Console
  temp_df <- data.frame("Column" = colnames(num_df),
                        "Inner_Outliers" = inner_outliers,
                        "Outer_Outliers" = outer_outliers)


  #Recombing Values with Original DataFrame
  out_df <- merge(t_df, temp_df, by.x = c("Column"), by.y =c("Column"), all.x = TRUE)

  #Determining to Print to Console
  if(!verbose){
    return(out_df)

  }else{
    #Creating Huxtable Object
    ht_o <- as_huxtable(out_df, add_colnames = TRUE)
    caption(ht_o)<- "Inner and Outer Fence Outlier Counts"
    caption_pos(ht_o)<- "topleft"
    right_padding(ht_o) <- 10
    left_padding(ht_o) <- 10
    bold(ht_o)[1,] <- TRUE
    bottom_border(ht_o)[1,]<-1

    print_screen(ht_o, colnames = FALSE)
  }
}

#
#
# df_o<- data.frame("X1" = c(71,70,73,70,70,69,70,72,71,300,71,69),
#                   "X2" = c(71,70,73,70,70,66,70,72,71,300,71,301),
#                   "X3" = c(71,70,73,70,70,69,70,72,71,71,71,69))
#
#
# #Creating a temp copy of object
# temp <- df_o
#
# #Adding Column Names if Missing
# if(is.null(colnames(temp))){
#   colnames(temp) <- 1:ncol(temp)
# }
#
# #Creating Full Column Data Frame
# t_df <- data.frame("Column" = colnames(temp))
#
# #Identifying numeric columns
# num_col <- unlist(lapply(df_o, is.numeric))
#
# #Subsetting original columns
# num_df <- df_o[,num_col]
#
# #Calculating Number of Outliers at Each Fence
# outer_outliers <-sapply(num_df, IQR, fence = 1)
# inner_outliers <- sapply(num_df,IQR,fence = 2)
#
# #Correcting for Overlap in Outliers
# inner_outliers <- inner_outliers - outer_outliers
#
# #Creating Dataframe to Return/Print to Console
# temp_df <- data.frame("Column" = colnames(num_df),
#                       "Out-Inner" = inner_outliers,
#                       "Out-Outer" = outer_ouliers)
#
# #Recombing Values with Original DataFrame
# out_df <- merge(t_df, temp_df, by.x = c("Column"), by.y =c("Column"), all.x = TRUE)
#
# #Determining to Print to Console
# if(!verbose){
#   return(out_df)
#
# }else{
#   #Creating Huxtable Object
#   ht_o <- as_huxtable(out_df, add_colnames = TRUE)
#   caption(ht_o)<- "Inner and Outer Fence Outlier Counts"
#   caption_pos(ht_o)<- "topleft"
#   right_padding(ht_o) <- 10
#   left_padding(ht_o) <- 10
#   bold(ht_o)[1,] <- TRUE
#   bottom_border(ht_o)[1,]<-1
#
#   print_screen(ht_o, colnames = FALSE)
# }







