## This is a pair of functions that cache the inverse of a matrix.It made as 
## Coursera home task R-programming week3.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = data.matrix()) {
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
##This function computes the inverse of the special "matrix" returned by 
##makeCacheMatrix above. If the inverse has already been calculated (and the 
##matrix has not changed), then the cachesolve should retrieve the inverse 
##from the cache

cacheSolve <- function(x, ...) {
        mt <- x$getInv()
       mg <-x$get()
        if(!is.null(mt)) {

                        message("getting cached data")
                        return(mt) ## Return solved a matrix that is the inverse of 'x'
                }
   mt <- solve(mg)
        x$setInv(mt)
       mt ## Return a matrix that is the inverse of 'x'
}
