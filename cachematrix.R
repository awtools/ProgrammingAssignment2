## Caching the Inverser of a Matrix with two functions
## makeCacheMatrix for init some matrix with functions
## cacheSolve for caching or use cache if exist of the inverse of the matrix

## The "makeCacheMatrix" funtion creates a special matrix object an makes it possible to use functions on it
## returns a named list with functions and a matrix 
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    ## Define set funktion for setting the Matrix
    set <- function(y){
        x <<- y       ## use <<- to set x because it is outside of the function
        inv <<- NULL  ## set inv = NULL to clear cache after the Matrix has changed
    }
    
    ## Define get function for getting the Matrix
    get <- function() {
        x
    }
    
    ## Define setInverse function
    setInverse <- function(inverse) {
        inv <<- inverse
    }
    
    ## Define getInverse function including the use of a cache if available
    getInverse <- function (){
        inv
    }
    list( set = set,
          get = get,
          setInverse = setInverse,
          getInverse = getInverse)
}


## The "cacheSolve" function computes the inverse of the special "matrix".
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
## returns the inverse Matrix (computed or from cache if available)
cacheSolve <- function(x, ...) {
    
    if(!is.null(x$getInverse())){
        print("Use cached inverse value") ##Info for testing if the cached value is used
        return(x$getInverse())
    }
    
    matrix <- x$get()
    inv <- solve(matrix, ...)
    x$setInverse(inv)
    inv
}
