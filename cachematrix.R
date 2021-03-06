## Prepared by: George Vyshnya
## Date: Apr 13, 2016

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
    invertedMatrix <- x$getInverse()
    if (!is.null(invertedMatrix)) {
      message("Returning cached data")
      return(invertedMatrix)
    }
    m <- x$get()
    invertedMatrix <- solve(m, ...)
    x$setInverse(invertedMatrix)
    invertedMatrix
  
}
