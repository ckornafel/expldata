#' Performs Multiple EDA Analyis Functions
#'
#' @description Performs multiple exploratory functions on dataframe
#' @description Provides:
#' @description For Object - name, object class, and random sample of values
#' @description For Rows - missing values, percent of total row, and duplicate rows
#' @description For Columns - value type, missing values (count & percent),
#' @description range (min, max, & spread), Shapiro-Wilk Normality (p-value and 95% determination),
#' @description and count any outliers (inner and outer)
#'
#' @param x A matrix-like R Object
#' @param expR Interger of expected row number
#' @param expC Integer of expected column number
#'
#' @return
#' @export
#' @import huxtable
#'
#' @examples \dontrun{
#' x <- data.frame("X1" = c(1,2,3,1,2,3),
#'                 "X2" = 1:6,
#'                 "X3"= c("a","b","c","a","b","c"))
#'
#' EDA(x)
#' }
EDA <- function(x, expR = NULL, expC = NULL){

  ########### Error Checks ####################################

  ## Check for supported input types and values
  if (!(is.data.frame(x) || is.matrix(x) || is.double(x))) {
    stop("object must be of type: dataframe, matrix")
  }
  if(!(is.integer(expR)||is.double(expR) || is.null(expR))){
    stop("expR must be of type: integer")
  }
  if(!(is.integer(expC)||is.double(expC) || is.null(expC))){
    stop("expC must be of type: integer")
  }

  ########### Obtaining Values ##################################

  #File Load Verification
     #RowValid <- function(x, n = NULL, verbose = TRUE)
     #ColValid <- function(x, n = NULL, verbose = TRUE)
  load_valid <- cbind(RowValid(x,expR,verbose = FALSE),
                      ColValid(x,expC,verbose = FALSE))


  #Sample
  samp <- RowSample(x)
  ht_samp <- CreateHux(samp, "Sample")

  #Row -Missing Values
  ht_rowNA <- CreateHux(FindRowNA(x,verbose = FALSE),"Rows with Missing Values")
  #Row - Duplicates
  ht_rowDup <- CreateHux(RowDup(x,verbose = FALSE),"Rows with Duplicate Values")

  text_color(ht_rowNA)<-"red"
  text_color(ht_rowDup)<-"red"


  #Column Information

  #ColType <- function(x, verbose = TRUE)
  c_type <- ColType(x, verbose = FALSE)
  #FindColNA <- function(x, verbose = TRUE)
  c_NA <- FindColNA(x,verbose = FALSE)
  #Rng <- function(x, verbose = TRUE)
  c_rng <- Rng(x, verbose = FALSE)
  #SWNormality <- function(x, verbose = TRUE)
  c_nor <- SWNormality(x, verbose = FALSE)
  #Out <- function(x, verbose = TRUE)
  c_out <- Out(x,verbose = FALSE)

  #Combining All Column Results
  c_total <- Reduce(function(...) merge(..., all=TRUE),
                    list(c_type,c_NA, c_rng, c_nor, c_out))


  ht_col <-CreateHux(c_total, "Column Details")
  ht_col <- ht_col[order(ht_col$Col_Types),]

  ################ Print Statements ######################################

  cat(paste("Name of Object:", deparse(substitute(x)), "\n"))
  cat(paste("Class of Object:", class(x),"\n\n"))

  #RowSample RowSample <- function(x, n = 5)
  cat(" \n" )
  print_screen(ht_samp, colnames = FALSE)

  cat("\n\n")

  print_screen(ht_rowNA, colnames = FALSE)
  cat("\n\n")
  print_screen(ht_rowDup, colnames = FALSE)
  cat("\n\n\n")

  #right_padding(ht_col) <- 100
  #left_padding(ht_col) <- 10
  text_color(ht_col)<-"blue"
  align(ht_col) <- "right"
  font_size(ht_col) <- 0.1
  width(ht_col) <-0.2
  #col_width(ht_col) <- c(1,.5,.5,.75,.75,.75,.75,.5,.75,.75,.75)
  ht_col1 <- ht_col[,1:6]
  ht_col2 <- ht_col[, c(1,7:11)]
  caption(ht_col2) <-NA
  print_screen(ht_col1, colnames = FALSE)
  cat("\n\n\n")
  print_screen(ht_col2, colnames = FALSE)

}
