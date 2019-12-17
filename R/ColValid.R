#' Validation of the Number of Columns
#'
#' @description Validates the number of columns of a loaded data object and
#' compares it with the expected number of columns provided by the user. If the
#' user does not provide the expected column parameter, then the function returns the
#' number of columns.
#' @description If Verbose = FALSE, returns dataframe of column count and logical
#'
#' @param x A matrix-like R object
#' @param n An integer representing expected columns
#' @param verbose A logical print statements if TRUE
#'
#' @seealso \code{\link{ncol}}
#'
#' @return The number of columns in object if no expected no is sent
#' @return TRUE if number of columns matches expected
#' @return FALSE if number of columns does not match expected
#'
#' @export
#' @examples
#' df<- data.frame(col1 = c(1,2,3),
#'                col2 = c(1,2,3),
#'                col3 = c(1,2,3))
#'
#' ColValid(df,n = 3)
#' ColValid(df, n = 2)
#' cf <- ColValid(df, n = 3, verbose = FALSE)
ColValid <- function(x, n = NULL, verbose = TRUE) {

  ########### Error Checks ####################################

  ## Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!(is.integer(n)||is.double(n) || is.null(n))){
    stop("n must be of type: integer")
  }
  if(!is.logical(verbose)){
    stop("verbose must be of type: logical")
  }

  ########### Function #######################################

  # Local Variables
  cols <- ifelse(is.null(dim(x)[2]), 0 , dim(x)[2])  #The number of columns in object
  matches <- FALSE  #Condition if columns match expected


  # For print statements to console
  if (verbose) {
    if (is.null(n)) {
      print(paste("The number of columns is:", cols))
    } else if (cols == n) {
      print(paste("MATCH: The number of columns:", cols, "matches the expected count"))
    } else {
      print(paste("WARNING: The number of columns:", cols,
                  "does not match the expected count of", n))
    }
  } else {
    if (!is.null(n) && cols == n) {
      matches <- TRUE
    }else if (is.null(n)){
      matches <- NA
    }

    return(data.frame("cols" = cols, "col_match" = matches))

}

}
