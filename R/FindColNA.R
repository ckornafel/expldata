#' Identifies Number and Percentage of NAs By Column
#'
#' @description  The NA column details including the column name, the count
#' of NA's for each column, and the percentage of each column those NA's
#' represent
#'
#' @param x A matrix-like R object
#' @param verbose Logical value to print results to console
#'
#' @return A dataframe of results
#' @export
#'
#' @rawNamespace import(huxtable, except = theme_grey)
#'
#' @examples \dontrun{
#' #EXAMPLE
#' }
#' x = matrix(rnorm(100), ncol = 10)
#' FindColNA(x)
FindColNA <- function(x, verbose = TRUE){

  ########### Error Checks ####################################

  ##Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!is.logical(verbose)){
    stop("verbose must be of type: logical")
  }
  ########### Function #######################################

  #Local Variables
  missing_values = sum(is.na(x)) #Total NAs in object

  if(is.null(colnames(x))){
    col_names <- 1:ncol(x)
  }else{
    col_names <- colnames(x)
  }

  #Counting NA's by Column
  cs<-colSums(is.na(x))

  #Calculating % if NA's by Column
  cp<-colMeans(is.na(x))

  c_na <- data.frame("Column" = col_names, "NA_Count" =cs,"NA_Percent" =cp)


  #Formating % to String
  c_na$NA_Percent <- sprintf("%.2f %%", 100*c_na$NA_Percent)

  #Determining to Print to Console
  if(!verbose){
      return(c_na)

  }else{

      #Creating Huxtable Object
      ht_c <- as_huxtable(c_na, add_colnames = TRUE)
      caption(ht_c)<- "Missing Values by Column"
      caption_pos(ht_c)<- "topleft"
      right_padding(ht_c) <- 10
      left_padding(ht_c) <- 10
      bold(ht_c)[1,] <- TRUE
      bottom_border(ht_c)[1,]<-1

      print_screen(ht_c, colnames = FALSE)
    }



}


