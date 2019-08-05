## Put comments here that give an overall description of what your
## functions do

## generates a matrix that can be inversed
## It returns a list containing functions to
##              1. set the matrix
##              2. get the matrix
##              3. set the inverse
##              4. get the inverse
## this list is used as the input to cacheSolve()


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y){
    x<<-y #value of the object in an environment different from Current evironment
    inv<<- NULL
}
get <- function() x
setinv <- function(invrs) inv <<- invrs 
getinv <- function() inv
list(set=set, get=get, setinv = setinv, getinv=getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinv()
  
  # check if the inverse is calculated
  if (is.null(inv)){
  
    #if not then calculate the inverse 
    mat.data = x$get()
    inv = solve(mat.data, ...)
    
    # sets the value of the inverse in the cache via the setinv function.
    x$setinv(inv)
    
    return(inv)
     
  }
  
  # else get it from the cache and skips the computation. 
  message("getting cached data")
  
  return(inv)
}
