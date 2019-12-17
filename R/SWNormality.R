#' Performing Shapiro-Wilk Normality Test
#'
#' @description SWNormality applies the Shapiro-Wilk Normality test and
#' returns the resulting p-values as well as an "english" translation
#' if the null hypothesis can be rejected or not: TRUE/FALSE at the 95%
#' confidence level.
#'
#' @param x A matrix-like R object
#' @param verbose A logical indicator
#'
#' @return A dataframe of results
#' @export
#' @seealso \code{\link{shapiro.test}}
#'
#' @importFrom stats shapiro.test
#' @examples \dontrun{
#' x <- data.frame("Norm1" = c(11.2,8.2,10.0,27.3,14.5,26.4,4.2,15.2,14.5,26.7))
#'
#' SWNormality(x)
#'
#' value <- SWNormality(x, verbose = FALSE)
#' }
SWNormality <- function(x, verbose = TRUE){

  ########### Error Checks ####################################

  ##Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!is.logical(verbose)){
    stop("verbose must be of type: logical")
  }
  ########### Function #######################################

  #Identifying numeric columns
  num_col <- unlist(lapply(x, is.numeric))

  #Applying the Shapiro-Wilk Normality Test
  sw <- (lapply(x[,num_col], stats::shapiro.test))

  #Obtaining P-Values
  pVal <-c()
  for(i in sw){
    pVal <- c(pVal, (i[[2]]))
  }

  #Determining if p-value rejects the null hypothesis
  nor <- sapply(pVal, function(z){ifelse(z >= 0.05, "TRUE", "FALSE")})

  #Building the Return dataframe
  df_norm <- data.frame ("Column" = colnames(x[,num_col]), "SW_PVal" = pVal, "Normal_Dist" = nor)

  #Printing Results Table if verbose else returning results dataframe
  if(verbose){
    ht_norm <- CreateHux(df_norm, "Normality of Numeric Columns")
    print_screen(ht_norm, colnames = FALSE)
  }else{
    return(df_norm)
  }

}


