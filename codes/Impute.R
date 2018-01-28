library(Amelia)
library(mice)
library(ggplot2)
library(lattice)

ff="path to cleaned files"
wf="path to save imputed files"
files=list.files(ff)
for(fil in files)
{
  print(fil)
  train_raw=read.csv(paste(ff,fil,sep=""))
  x_train<- mice(train_raw, m=5,maxit=5,seed=50, method='cart', printFlag=TRUE) #change parameters here
  x_tran_final=complete(x_train)
  write.csv(x_tran_final,file = paste(wf,fil,sep=""))
  #break();
  
}