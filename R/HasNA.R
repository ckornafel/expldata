#' Checks for Missing Values in Dataframe
#'
#' @description Validates if entire object has missing values
#' @param x a matrix-like R object
#'
#' @return missing_values Logical indicator if NA exist in object
#' @return TRUE if  object contains any NA value
#' @return FALSE if object does not contain an NA value
#' @export
#' @seealso \code{\link{is.na}}
#' @examples
#' m1 = matrix(rnorm(100), ncol = 10)
#'
#' HasNA(m1)
#'
HasNA <- function(x){
  ########### Error Checks ####################################

  ##Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }

  ########### Function #######################################

  #Local Variables
  missing_values <- FALSE #Logical if object contains NA

  if(sum(is.na(x))>0){
    missing_values <- TRUE
  }else{
    missing_values<-FALSE
  }

  return(missing_values)
}
