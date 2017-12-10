#df is the dataframe. This plots the variable distribution as histogram and density.
par(mfrow=c(3,3))
for (i in 1:ncol(df)){
    hist(df[,i],xlab=names(df)[i],main=names(df)[i],col="blue",prob=T
    lines(density(df[,i],col="red", lwd =2)
}
