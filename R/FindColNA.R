#' Identifies Number and Percentage of NAs By Column
#'
#' @param x A matrix-like R object
#' @param verbose Logical value to print results to console
#'
#' @return The NA column details
#' @return If verbose is TRUE (default) the results are printed to screen
#' @return If verbose is FALSE results are returned via dataframe
#' @export
#'
#' @importFrom huxtable as_huxtable
#' @importFrom huxtable caption
#' @importFrom huxtable caption_pos
#' @importFrom huxtable right_padding
#' @importFrom huxtable left_padding
#' @importFrom huxtable bold
#' @importFrom huxtable bottom_border
#' @importFrom huxtable print_screen
#'
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

  #Check for Any Missing Values
  if(HasNA(x)){

    if(is.null(colnames(x))){
      col_names <- 1:ncol(x)
    }else{
      col_names <- colnames(x)
    }

    #Counting NA's by Column
    cs<-colSums(is.na(x))

    #Calculating % if NA's by Column
    cp<-colMeans(is.na(x))

    c_na <- data.frame("Column" = col_names, "NA_Count" =cs,"Percent_of_Column" =cp)

    #Determining to Print to Console
    if(!verbose){
      return(c_na)

    }else{

      #Formating % to String
      c_na$Percent_of_Column <- sprintf("%.1f %%", 100*c_na$Percent_of_Column)

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

  }else{
    print("Object does not have any missing values")
  }


}


