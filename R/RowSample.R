#' Random Row Sample
#'
#' @description Validates that the number of columns is equal to expected count
#' @param x a matrix-like R object
#' @param n the number of random rows to display
#'
#' @return If object row count exceeds supplied parameter or default value,
#'   then the function returns a random sample of "n" rows. If object row
#'   count is less than parameter or default, the function returns all
#'   rows of the object.
#' @export
#' @seealso \code{\link{sample}}
#' @examples \dontrun{
#' #Obtain a Random Sample of Rows
#' }
#' x = matrix(rnorm(100), ncol = 10)
#' RowSample(x)
RowSample <- function(x, n = 5) {

  ########### Error Checks ####################################

   ##Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!(is.integer(n)||is.double(n))){
    stop("n must be of type: integer")
  }

   # Check that n rows specified is greater than data frame rows
  if(n > nrow(x)){
    print("z = object contains less rows than requested: returning 5 rows")
    n <- 5 #Resetting n to 5 rows of object
  }

  ########### Function ####################################

   # Returns random number of rows
    return(x[sample(nrow(x), n), ])
}

