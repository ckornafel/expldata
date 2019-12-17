#' Validation of the Number of Rows
#'
#' @description Validates the number of rows of an object
#' @description Returns number of rows if no parameter is used
#' @description If Verbose = F, returns dataframe of rows and bool if match
#' @param x a matrix-like R object
#' @param n number of expected rows
#' @param verbose displays print statements if TRUE
#' @seealso \code{\link{nrow}}
#' @return The number of rows in object if no expected no is sent
#' @return TRUE if number of rows matches expected
#' @return FALSE if number of rows does not match expected
#' @export
#' @importFrom stats na.omit
#' @examples \dontrun{
#' #EXAMPLE
#' }
#' x = matrix(rnorm(100), ncol = 10)
#' RowValid(x, 10)
RowValid <- function(x, n = NULL, verbose = TRUE) {

   ########### Global Variable Binding #########################
   cols <- NULL

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
   rows <- dim(x)[1]  #The number of rows in object
   matches <- FALSE  #Condition if rows match expected

   # For print statements to console
   if (verbose) {
      if (is.null(n)) {
         print(paste("The number of rows is:", rows))
      } else if (rows == n) {
         print(paste("MATCH: The number of rows:", rows, "matches the expected count"))
      } else {
         print(paste("WARNING: the number of rows:", rows, "does not match the expected count of",
                     n))
      }
   } else {
      if (!is.null(n) && rows == n) {
         matches <- TRUE
      }else if (is.null(n)){
         matches <- NA
      }

   return(data.frame("rows" = rows, "row_match" = matches))

}

}
