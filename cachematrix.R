## These functions are to cache the inverse of a matrix. When we need it,  
## the inverse of a matrix be looked up.

## The following function creates a special "matrix" object  
## and caches its inverse.The results are a list containing functions to
1.  set the matrix
2.  get the matrix
3.  set the inverse of this matrix
4.  get the inverse of this matrix

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
  }
  get<-function() x
  
  setinverse<-function(solve) m<<- solve
  getinverse<-function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The following function get the inverse of the special "matrix"
## created with the above function. It first checks whether the inverse 
has already been calculated. If so, it `get`s the inverse from the
cache and skips the computation. Otherwise, it calculates the inverse of
matrix and sets the inverse of matrix in the cache via the `setinverse`
function.

cacheSolve <- function(x, ...) {
    m<-x$getinverse()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setinverse(m)
    ## Return a matrix that is the inverse of 'x'
    m       
}

