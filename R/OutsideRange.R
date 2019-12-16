#' Determines if a Value is Outside Range
#'
#' @details Internal Help Function for Outlier and IQR
#'
#' @param x A vector
#' @param upper Numeric top bound
#' @param lower Numeric bottom bound
#'
#' @return Numeric
#' @export
#'
OutsideRange<-function(x, upper, lower){

  #Local variable to hold value if outside bounds
  outside <- NA

  if(x > upper || x < lower){
    outside <- x
  }
  return(outside)
}
