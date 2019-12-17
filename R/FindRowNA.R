#' Identifies Number and Percentage of NAs By Row
#'
#' @description Displays the count and % of total of NAs in a dataframe
#' @description If Verbose = F, returns dataframe with Row, NA_Count, Percent_of_Row
#'
#' @param x A matrix-like R object
#' @param verbose Logical value to print results to console
#'
#' @return A dataframe of results
#' @export
#'
#' @import huxtable
#'
#' @examples \dontrun{
#' #EXAMPLE
#' }
#' set.seed(100)
#' x = matrix(rnorm(100), ncol = 10)
#' x[2,3] <-NA #Adding Missing Value
#'
#' FindRowNA(x)
FindRowNA <- function(x, verbose = TRUE){
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

    #Obtaining Row Names or Numbering if None
    if(is.null(rownames(x))){
      row_names <- 1:nrow(x)
    }else{
      row_names <- rownames(x)
    }

    #Counting NA's by Column
    rs<-rowSums(is.na(x))

    #Calculating % if NA's by Column
    rp<- rs / nrow(x)

    #Storing Infor in dataframe
    r_na <- data.frame("Row" = row_names, "NA_Count" =rs,"Percent_of_Row" =rp)

    #Subsetting to non-zero Values
    r_na <- subset(r_na, NA_Count >0, select = c(Row, NA_Count, Percent_of_Row))

    #Formating % to String
    r_na$Percent_of_Row <- sprintf("%.3f %%", 100*r_na$Percent_of_Row)


    #Determining to Print to Console
    if(!verbose){
      return(r_na)

    }else{

      #Creating Huxtable Object
      ht_r <- as_huxtable(r_na, add_colnames = TRUE)
      caption(ht_r)<- "Rows with Missing Values"
      caption_pos(ht_r)<- "topleft"
      right_padding(ht_r) <- 10
      left_padding(ht_r) <- 10
      bold(ht_r)[1,] <- TRUE
      bottom_border(ht_r)[1,]<-1

      print_screen(ht_r, colnames = FALSE)
    }

  }else{
    if(verbose){
      print("Object does not have any missing values")
    }else{
      return(data.frame("Row" = 0, "NA_Count" = 0, "Percent_of_Row" = "0.00%"))
    }


  }


}


