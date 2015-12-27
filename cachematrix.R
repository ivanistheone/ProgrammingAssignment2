## Assignment2 solution
## Compute inverse using memoization so work of finding the inverse will be done only once


## Creates a `CacheMatrix` closure with getters and setters
##     x = accessed using get set
##  xInv = accessed using getInv setInv

makeCacheMatrix <- function(x = matrix()) {
    xInv <- NULL
    set <- function(y) {
        x <<- y
        xInv <<- NULL
    }
    get <- function() x
    setInv <- function(inv) xInv <<- inv
    getInv <- function() xInv
    list(set = set, 
         get = get,
         setInv = setInv,
         getInv = getInv)
}


## Compute the inverse of a `CacheMatrix` object

cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    inv <- x$getInv()
    if(!is.null(inv)) {
        message("getting inverse from cache")
        return(inv)
    }
    inv <- solve( x$get() ) # compute inverse matrix
    x$setInv(inv)
    inv
}


# usage:
#
# > cmat = makeCacheMatrix( matrix( c(1,2,3,4), nrow=2, ncol=2) )
# > cacheSolve(cmat)
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > cacheSolve(cmat)
#      [,1] [,2]
# getting inverse from cache
# [1,]   -2  1.5
# [2,]    1 -0.5

