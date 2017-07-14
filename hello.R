a <- rbind(c(2,0),c(1,-1))
b <- solve(a)
write(b,stdout())
rbind(c(0,-2),c(5,-3)) %*% b
