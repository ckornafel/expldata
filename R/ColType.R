#' Determining Class Types of Each Column in an Object
#'
#' @description Displays the class of each column in a matrix
#' @description or dataframe
#' @description If Verbose = F, returns dataframe col names and class types
#'
#' @param x A matrix-like R object
#' @param verbose Logical value to print results to console
#'
#' @seealso \code{\link{typeof,class}}
#' @return If verbose = FALSE, a dataframe of column object types
#' @export
#'
#' @examples \dontrun{
#' #EXAMPLE
#' }
#' df_type <- data.frame(num1 = rnorm(5),
#'            int2= c(1:5),
#'            log3 = c(TRUE, TRUE, FALSE, FALSE, TRUE),
#'            fac4 = letters[1:5])
#' ColType(x)
ColType <- function(x, verbose = TRUE){

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

  #Adding Col Names if None Exist
  if(is.null(colnames(x))){
    col_names <- 1:ncol(x)
  }else{
    col_names <- colnames(x)
  }

  types<- sapply(x,class) #Determining Col Types

  col_types <- data.frame("Column" = col_names, "Col_Types" = types)

  if(verbose){

    #Creating Huxtable Object
    ht_t <- as_huxtable(col_types, add_colnames = TRUE)
    caption(ht_t)<- "Column Object Types"
    caption_pos(ht_t)<- "topleft"
    right_padding(ht_t) <- 10
    left_padding(ht_t) <- 10
    bold(ht_t)[1,] <- TRUE
    bottom_border(ht_t)[1,]<-1

    print_screen(ht_t, colnames = FALSE)

  }else{
    return(col_types)
  }


}


# df_type <- data.frame(num1 = rnorm(5),
#                       int2= c(1:5),
#                       log3 = c(TRUE, TRUE, FALSE, FALSE, TRUE),
#                       fac4 = letters[1:5])
# typ<-sapply(df_type,class)
#
#
# if(is.null(colnames(df_type))){
#   col_names1 <- 1:ncol(df_type)
# }else{
#   col_names1 <- colnames(df_type)
# }
#
# col_types1 <- data.frame("Column" = col_names1, "Col_Types" = typ)
#
# ht_t1 <- as_huxtable(col_types1, add_colnames = TRUE)
# caption(ht_t1)<- "Column Object Types"
# caption_pos(ht_t1)<- "topleft"
# right_padding(ht_t1) <- 10
# left_padding(ht_t1) <- 10
# bold(ht_t1)[1,] <- TRUE
# bottom_border(ht_t1)[1,]<-1
#
# print_screen(ht_t1, colnames = FALSE)
#
# levels_of_factors<-nlevels(x)

