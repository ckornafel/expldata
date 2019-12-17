#' Identifies Duplicate Rows in Object
#'
#' @description Identifiction of duplicated rows contained in the
#' data set. Displaying a table of the count of duplicate rows, the
#' percent of duplicated rows compared with the total rows, as well as
#' the count of unique rows.
#'
#' @seealso \code{\link{unique}}
#' @seealso \code{\link{duplicated}}
#'
#' @param x A matrix-like R object
#' @param verbose Logical operator
#'
#' @return A dataframe of results
#' @export
#'
#' @rawNamespace import(huxtable, except = theme_grey)
#'
#' @examples \dontrun{
#' x <- data.frame("X1" = c(1,2,3,1,2,3),
#'                 "X2" = c(TRUE,FALSE,TRUE,TRUE,TRUE,FALSE),
#'                 "X3"= c("a","b","c","a","b","c"))
#'
#' RowDup(x)
#'
#' value <- RowDup(x, verbose = FALSE)
#' }
RowDup<-function(x, verbose = TRUE){

  ########### Global Variable Binding #########################
  Duplicate_Rows <- Percent_Duplicate <- Unique_Rows <- NULL

   ########### Error Checks ####################################

  ##Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!is.logical(verbose)){
    stop("verbose must be of type: logical")
  }
  ########### Function #######################################

  #Obtaining Row Names or Numbering if None
  if(is.null(rownames(x))){
    row_names <- 1:nrow(x)
  }else{
    row_names <- rownames(x)
  }

  #Identifying Duplicated Rows in Object
  dup_rows <- sum(duplicated(x))


  #Calculating Duplicated Row Percentage
  dup_row_percent <- dup_rows/nrow(x)


  #Calculating Unique Row Count
  unique_rows <- nrow(unique(x))


  r_freq <- data.frame("Duplicate_Rows" = dup_rows,
                       "Percent_Duplicate" = dup_row_percent,
                       "Unique_Rows" = unique_rows)

  #Subsetting to only Duplicate Values
  r_freq <- subset(r_freq, Duplicate_Rows >0, select = c(Duplicate_Rows, Percent_Duplicate, Unique_Rows))

  if(dim(r_freq)[1] == 0){
    r_freq <- data.frame("Duplicate_Rows" = 0,
                         "Percent_Duplicate" = 0,
                         "Unique_Rows" = nrow(x))
  }



  if(verbose){
    #Formating % to String
    r_freq$Percent_Duplicate <- sprintf("%.1f %%", 100*r_freq$Percent_Duplicate)

    #Creating Huxtable Object
    ht_rf <- as_huxtable(r_freq, add_colnames = TRUE)
    caption(ht_rf)<- "Rows with Missing Values"
    caption_pos(ht_rf)<- "topleft"
    right_padding(ht_rf) <- 10
    left_padding(ht_rf) <- 10
    bold(ht_rf)[1,] <- TRUE
    bottom_border(ht_rf)[1,]<-1

    print_screen(ht_rf, colnames = FALSE)
  }else{
    return(r_freq) #Returning results
  }
}







