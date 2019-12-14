#' Identifies Duplicate Rows in Object
#'
#' @param x A matrix-like R object
#' @param verbose Logical operator
#'
#' @return If verbose = FALSE, a dataframe of results
#' @export
#'
#' @importFrom huxtable as_huxtable caption caption_pos
#' @importFrom huxtable right_padding left_padding bold
#' @importFrom huxtable bottom_border print_screen
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
  dup_rows <- data.frame(duplicated(x[,1:ncol(x)]))

  #Calculating Duplicated Row Percentage
  dup_row_percent <- dup_rows/nrow(x)

  #Calculating Unique Row Count
  unique_rows <- nrow(x)-dup_rows

  r_freq <- data.frame("Row" = row_names,
                       "Duplicate_Rows" = dup_rows,
                       "Percent_Duplicate" = dup_row_percent,
                       "Unique_Rows" = unique_rows)

  #Subsetting to only Duplicate Values
  r_freq <- subset(r_freq, Duplicate_Rows >0, select = c(Row, Duplicate_Rows, Percent_Duplicate, Unique_Rows))

  if(verbose){
    #Formating % to String
    r_freq$Percent_Duplicate <- sprintf("%.1f %%", 100*r_freq$Percent_Duplicate)

    #Creating Huxtable Object
    ht_rf <- as_huxtable(r_freq, add_colnames = TRUE)
    caption(ht_r)<- "Rows with Missing Values"
    caption_pos(ht_r)<- "topleft"
    right_padding(ht_r) <- 10
    left_padding(ht_r) <- 10
    bold(ht_r)[1,] <- TRUE
    bottom_border(ht_r)[1,]<-1

    print_screen(ht_r, colnames = FALSE)
  }else{
    return(r_freq) #Returning results
  }
}







