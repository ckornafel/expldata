#' Validation of the Number of Columns
#'
#' @description Validates the number of columns of an object
#' @description Returns number of columns if no parameter is used
#' @description If Verbose = F, returns dataframe of columns and bool if match
#' @param x a matrix-like R object
#' @param n number of expected rows
#' @param verbose displays print statements if TRUE
#' @seealso \code{\link{ncol}}
#' @return The number of columns in object if no expected no is sent
#' @return TRUE if number of columns matches expected
#' @return FALSE if number of columns does not match expected
#' @export
#'
#' @examples /dontrun{
#' m1 = matrix(rnorm(100), ncol = 10)
#' ColValid(m1, 10)
#'
#' d2 <- ColValid(m1, n = 10, verbose = FALSE)
#'}
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
  cols <- dim(x)[2]  #The number of columns in object
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
    }
    return(data.frame("cols" = cols, "col_match" = matches))

  }

}
