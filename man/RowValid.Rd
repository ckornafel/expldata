% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RowValid.R
\name{RowValid}
\alias{RowValid}
\title{Validation of the Number of Rows}
\usage{
RowValid(x, n = NULL, verbose = TRUE)
}
\arguments{
\item{x}{a matrix-like R object}

\item{n}{number of expected rows}

\item{verbose}{displays print statements if TRUE}
}
\value{
The number of rows in object if no expected no is sent

TRUE if number of rows matches expected

FALSE if number of rows does not match expected
}
\description{
Validates the number of rows of an object

Returns number of rows if no parameter is used

If Verbose = F, returns dataframe of rows and bool if match
}
\examples{
\dontrun{
#EXAMPLE
}
x = matrix(rnorm(100), ncol = 10)
RowValid(x, 10)
}
\seealso{
\code{\link{nrow}}
}
