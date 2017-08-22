toyfactorial <- function(n){
    if(n <= 0) return(NA)
    f <- function(i){
        if(i == 1){
            return(1)
        }else{
            return(i * Recall(i - 1))          
        }
    }
    return(f(n))
}

cat(toyfactorial(100))