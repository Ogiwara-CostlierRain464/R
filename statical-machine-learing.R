dataA <- as.matrix(read.csv(file="./data/Handwritten_6.csv")[,-785])
dataB <- as.matrix(read.csv(file="./data/Handwritten_8.csv")[,-785])

# μa^,μb^
muA <- apply(dataA,2,mean)
muB <- apply(dataB,2,mean)

nA <- dim(dataA)[1]
nB <- dim(dataA)[1]
SigmaA <- var(dataA)
SigmaB <- var(dataB)

Sigma <- (nA-1)*SigmaA+(nB-1)*SigmaB
Sigma <- Sigma/(nA+nB-2)

solve(Sigma)

# U[0,0]回避

apply(dataA,2,var)
varzeroA <- which(apply(dataA,2,var)==0)
varzeroB <- which(apply(dataB,2,var)==0)
varzeroAB <- union(varzeroA,varzeroB)

dataA2  <- dataA[,-varzeroAB]
dataB2  <- dataB[,-varzeroAB]
dim(dataA2)
dim(dataB2)

corA <- cor(dataA2); diag(corA) <- 0
coroneA <- which(apply(corA,2,max)==1)
corB <- cor(dataB2); diag(corB) <- 0
coroneB <- which(apply(corB,2,max)==1)
coroneAB <- union(coroneA,coroneB)

dataA3 <- dataA2[,-coroneAB]
dataB3 <- dataB2[,-coroneAB]

muA <- apply(dataA3,2,mean)
muB <- apply(dataB3,2,mean)
SigmaA <- var(dataA3)
SigmaB <- var(dataB3)
Sigma <- (nA-1)*SigmaA+(nB-1)*SigmaB
Sigma <- Sigma/(nA+nB-2)
Sigma.inv <- solve(Sigma)

beta1 <- Sigma.inv%*%(muA-muB)
beta1 <- as.matrix(beta1,ncol=1)
beta0 <- log(nA/nB) - t(muA)%*%Sigma.inv%*%(muA)/2+t(muB)%*%Sigma.inv%*%(muB)/2
beta0 <- as.numeric(beta0)

scoreA <- beta0 + dataA3%*%beta1
scoreB <- beta0 + dataB3%*%beta1
# 成功率
table(sign(scoreA))
table(sign(scoreB))