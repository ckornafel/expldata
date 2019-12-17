#' Creates Hux Table Object for Printing
#'
#' @description Internal Helper Function for Outlier
#'
#' @param x A matrix-like R object
#' @param title String containing plot title
#'
#' @return A hux object
#' @export
#' @rawNamespace import(huxtable, except = theme_grey)
#'
CreateHux <- function(x,title){

  ht <- as_huxtable(x, add_colnames = TRUE)
  caption(ht) <- title
  caption_pos(ht)<- "topleft"
  bold(ht)[1,] <- TRUE
  bottom_border(ht)[1,]<-1

  return(ht)
}
