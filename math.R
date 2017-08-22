A <- rbind(c(-2,3),c(-1,0))
B <- rbind(c(4,3),c(2,-1))
C <- rbind(c(-1,2),c(3,4))
print(A%*%B-A%*%C)
