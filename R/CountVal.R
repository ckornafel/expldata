#' Count of Unique & Duplicated Values of Each Column
#'
#' @description Counts the number of unique and duplicated values by
#' column. Missing values (NA's) are omitted in the counts and TRUE
#' values are counted for Factors.
#' @description If Verbose = T, displays results to console
#' @description If Verbose = F, returns dataframe of counts
#'
#' @param x A matrix-like R object
#' @param verbose Logical value to print results to console
#'
#' @seealso \code{\link{unique, duplicated}}
#'
#' @return If Verbose = TRUE, nothing returned
#' @return If Verbose = FALSE, returns data frame of unique & dup values by column
#'
#' @export
#'
#' @examples \dontrun{
#' #EXAMPLE
#' }
#' df_type <- data.frame(num1 = rnorm(5),
#'            int2= c(1:5),
#'            log3 = c(TRUE, TRUE, FALSE, FALSE, TRUE),
#'            fac4 = letters[1:5])
#' CountVal(df_type)
#' value <- CountVal(df_type, verbose = FALSE)
CountVal <- function(x, verbose = TRUE){
  ########### Error Checks ####################################

  ##Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!is.logical(verbose)){
    stop("verbose must be of type: logical")
  }
  ########### Function #######################################

  #Find Column Names
  if(is.null(colnames(x))){
    col_names <- 1:ncol(x)
  }else{
    col_names <- colnames(x)
  }

  #Calc Number of Unique Values in Each Column
  uniq <- sapply(x, function(u) length(unique(u[!is.na(u)])))


  #Calc Number of Duplicated Values in Each Column
  dup <- sapply(x, function(z) sum(duplicated(z[!is.na(z)])))


  c_freq <- data.frame("Column" = col_names, "Unique_Values" = uniq, "Duplicated_Values" = dup)

  #Determining to Print to Console
  if(!verbose){
    return(c_freq)

  }else{

    #Creating Huxtable Object
    ht_f <- as_huxtable(c_freq, add_colnames = TRUE)
    caption(ht_f)<- "Column Value Occurances"
    caption_pos(ht_f)<- "topleft"
    right_padding(ht_f) <- 10
    left_padding(ht_f) <- 10
    bold(ht_f)[1,] <- TRUE
    bottom_border(ht_f)[1,]<-1

    print_screen(ht_f, colnames = FALSE)
  }
}

