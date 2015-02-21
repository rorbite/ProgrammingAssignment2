##
## Library that expose functions to calculate a matrix 
##   with caching hability
##

## Transforme a pure matrix in a list with 
##   functions to support getting and setting 
##   its value and its inverse
makeCacheMatrix <- function(x = matrix()) {
  
  ## declares a variable to hold the inverse value
  inv <- NULL
  
  ## function to set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  ## function to get the matrix 
  get <- function() {
    x
  }
  
  ## function to set the matrix's inverse
  setinverse <- function(inverse) {
    inv <<- inverse
  }
  
  ## function to get the matrix's inverse
  getinverse <- function() {
    inv
  }
  
  ## returns a list with the functions to manipulate the
  ##   values of the matrix and the inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}

## With a list created by the function makeCacheMatrix, 
##   applies the logic to calcule the Inverse only one 
##   time caching its results.
##   Subsequent calls to calculate the Inverse of the 
##   same matrix will return the cached value
cacheSolve <- function(x, ...) {
  
  ## try to get the stored inverse of the matrix
  inv <- x$getinverse()
  
  ## if there is a value for the inverse, return that value 
  ##   and displays a message
  if(!is.null(inv)) {
    message("getting the cached inverse matrix")
    return(inv)
  }
  
  ## otherwise, get the matrix data
  data <- x$get()
  
  ## calculates the inverse
  inv <- solve(data, ...)
  
  ## stores the calculated inverse in the matrix structure
  x$setinverse(inv)
  
  ## returns the calculated inverse
  inv
}
