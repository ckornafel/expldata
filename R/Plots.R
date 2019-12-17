#' Creates a List of ggplots: density or boxplot
#'
#' @description Function to generate ggplot objects using lapply
#' @description If the data frame contains a single factor column
#' the plot will assume it as the dependent variable
#' @description If ptype = 1, density plots will be produced
#' @description If ptype = 2, box plots will be produced
#'
#' @param x A matrix-like R structure
#' @param column chr of column name
#' @param colorData dataframe column to designate target
#' @param ptype int of plot type
#'
#' @return ggplot object
#' @export
#'
#' @import ggplot2
#'
#' @examples \dontrun{
#' #EXAMPLE
#' }
#' x <- data.frame("X1" = c(1,2,3,1,2,3),
#'                 "X2" = 1:6,
#'                 "F3"= c("male","female","male","female","male","male"))
#'
#' plot_density <- lapply(colnames(x), Plots, x = x, colorData = x$F3, ptype = 1 )
Plots <- function(x, column, colorData=NULL, ptype = 1){
  if(ptype == 1){
    ggplot(x, aes_string(x=column, color=colorData)) +
      geom_density() +
      xlab(column) +
      theme_minimal()
  }else{
    if(is.null(colorData)){
      ggplot(x, aes_string(x=1, y=column)) +
        geom_boxplot()+
        xlab(column) +
        theme_minimal()
    }else{
      ggplot(x, aes_string(x=colorData, y=column, color=colorData)) +
        geom_boxplot()+
        xlab(column) +
        theme_minimal()
    }
  }
}


