makeSolve <- function(x = data.matrix()) {
        mt <-NULL
        set <- function(y) {
               x <<- y

              mt <<- NULL
        }
        get <- function() x
        setInv <- function(inv) mt <<- inv
        getInv <- function() mt
        list(set = set,
		 get = get,
             setInv = setInv,
             getInv = getInv)

}
cachSolve <- function(x, ...) {
        mt <- x$getInv()
        ms <-x$set(y)
	  mg <-x$get()
		if(!is.null(mt)) {
		if(identical(mg,ms)){
                message("getting cached data")
                return(mt)
       }
    }
        data <- x$get()
       mt <- solve(data)
        x$setInv(mt)
        mt
}