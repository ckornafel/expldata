Plots <- function(x, column, color.data=NULL) {

  ggplot(x, aes_string(x=column, color=color.data)) +
    #    geom_histogram(alpha = 0.6, position="dodge", stat = "count") +
    geom_density()+
    #geom_text(stat = "count", aes(label=..count..), position = position_dodge(1))+
    xlab(column) +
    theme_minimal()

}



abalone.plots <- lapply(colnames(x[,]), Plots, x = x, color.data =x[,1])

y<- abalone[,2:9]

z<- x
z$fact2 <- as.factor(1:4177)
multiplot(plotlist = abalone.plots[1:4])

ggplot(x, aes(x = x$Length))+
  geom_density()

fact_pos<-NULL
for(c  in 1:ncol(z)){
  if(is.factor(z[,c])){
    fact_pos <- c(fact_pos,c)
  }
}
fact_pos
length(fact_pos)
