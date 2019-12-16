#' Calculates Quartiles and Outlier Ranges
#'
#' @description Internal Helper Function for Outlier
#' @description Calls OutsideRange
#'
#' @param v Vector
#' @param fence A int of either 1 (outer) or 2 (inner)
#'
#' @return Number of outliers
#' @export
#'
IQRange <-function(v, fence = 1){

  ########### Error Checks ####################################

  #Checking that fence is either i (inner) or o (outer)
  if(!(fence == 1 || fence == 2)){
    stop("fence must be either 1 (outer) or 2 (inner)")
  }


  ################# Local Variables ############################################
  q1 <-0                 #1st Quartile Value
  q2 <-0                 #2nd Quartile Value
  q3 <-0                 #3rd Quartile Value
  n <-0                  #Length of Vector
  qRange <-0             #InnerQuartile Range
  innerFence.high <-0    #InnerFence High Value
  innerFence.low <-0     #InnerFence Low Value
  outerFence.high <-0    #OuterFence High Value
  innerFence.low <- 0    #OuterFence Low Value

  out.fence <- vector(mode = "numeric") #Return Value for OuterFence
  in.fence <- vector(mode = "numeric")  #Return Value for InnerFence

  ################# Main Function   ############################################

  v<- sort(v)  #Sorting Vector
  n <- length(v) #Determining Number of Vector Members

  #Calculating Quartile Ranges
  if (n%%2 == 0){   #if vector contains an even number of items
     q2 = (v[n/2]+v[(n/2)+1])/2
     q1 = (v[(n/2)/2] + v[((n/2)/2)+1]) / 2
     q3 = (v[(n/2)+((n/2)/2)] + v[(n/2)+((n/2)/2)+1])/2
   } else{           #if vector contains an odd number of items
     q2 = v[n/2]
     q1 = v[(n/2)/2]
     q3 = v[(n/2)+((n/2)/2)]
   }

  #Calculating interquartile range
  qRange = q3 - q1

  if(fence == 2){

    #Calculating InnerFences
    innerFence.low = q1 - (qRange*1.5)
    innerFence.high = q3 + (qRange*1.5)

    #Determining members that fall outside inner fence
    in.fence <-length(na.omit(mapply(OutsideRange, v, innerFence.high, innerFence.low)))

    return(in.fence)

  }else {

    #Calculating OuterFences
    outerFence.low = q1 - (qRange * 3)
    outerFence.high = q3 + (qRange * 3)

    #Determining members that fall outside outer fence
    out.fence <- length(na.omit(mapply(OutsideRange, v,outerFence.high, outerFence.low)))

    return(out.fence)
  }



}


# y = c(71,70,73,70,70,69,70,72,71,300,71,69)
# y = sort(y)
# n = length(y)
# if (n%%2 == 0){   #if vector contains an even number of items
#   q2 = (y[n/2]+y[(n/2)+1])/2
#   q1 = (y[(n/2)/2] + y[((n/2)/2)+1]) / 2
#   q3 = (y[(n/2)+((n/2)/2)] + y[(n/2)+((n/2)/2)+1])/2
# } else{           #if vector contains an odd number of items
#   q2 = y[n/2]
#   q1 = y[(n/2)/2]
#   q3 = y[(n/2)+((n/2)/2)]
# }
#
#  qRange = q3 - q1 #Calculating interquartile range
#  innerFence.low = q1 - (qRange*1.5)
#  innerFence.high = q3 + (qRange*1.5)
#  outerFence.low = q1 - (qRange * 3)
#  outerFence.high = q3 + (qRange * 3)
#
# out.fence <- vector(mode = "numeric")
#
# out.fence <- mapply(outsideRange, y,outerFence.high, outerFence.low)
#
# length(na.omit(out.fence))
# which(!is.na(out.fence))[[1]]
#
# outsideRange <- function(x, upperBound, lowerBound){
#   rng <- NA
#   if(x > upperBound || x < lowerBound){
#     rng <- x
#   }
#   return(rng)
# }
#
#
#
#
#
# for(i in 1:length(y)){
#    print(i)
#    print(y[i])
#    if(y[i]>outerFence.high){
#      out.fence <- c(out.fence, y[i])
#    }
# }
#
#
#
# out.fence
