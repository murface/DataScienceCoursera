## Programming Assignment #2
## by Matthew Murray    
##
## These two functions allow the creation of a matrix, the matrix values can 
## be set, accessed, and the inverse of the matrix can be taken if the matrix
## is square.If the inverse of the matrix has already been found, these 
## functions will access the cached value instead of recalculating it. The 
## function will let the user know when a cached value is being accessed.
##############################################################################

## makeCacheMatrix creates a list of functions that can be 
## accessed through an object assigned to it.
## myObject <- makeCacheMatrix()
## myObject$set(aMatrix) allows the user to set matrix values, 
##      note: only a square matrix can have an inverse
## myObject$get() allows the user to access the matrix created
##############################################################################
makeCacheMatrix <- function(x = matrix()) {
    # a locally scoped inverse variable is initialized
    inverse <- NULL                    
    set <- function(y) {
        x <<- y                        # meta-scoped values for x and inverse
        inverse <<- NULL               # are initialized when myObject$set(x)
                                       # is called
    }
    # myObject$get() returns the value of x initialized above
    get <- function() x                
    # if the inverse already exists, it is pulled from the cached values  
    setinverse <- function(solve) inverse <<- solve 
    getinverse <- function() inverse       
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## cacheSolve() begins by receiving the object you created to contain the
## list of functions -myObject-  
## the function calls myObject$getinverse which in the above function
## returns the cached value if it exists.
## if the cached value exists, which is checked for in the if statement
## then the cached value is returned. If not, the inverse of the matrix
## is computed and saved to the cache.
##############################################################################
cacheSolve <- function(x, ...) {
    ## access cached value
    inverse <- x$getinverse()               
    ## if cahche exists send value
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    ## if cached value doesn't exist, compute inverse 
    data <- x$get()
    inverse <- solve(data, ...)
    ## and save to cache and return the inverse of the matrix
    x$setinverse(inverse)
    inverse
}

