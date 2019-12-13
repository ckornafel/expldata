# out <- function(mat){
#
# }
#
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


