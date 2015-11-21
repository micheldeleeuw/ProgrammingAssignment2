## The makeCacheMatrix and cacheSolve functions create a caching meganisme for matrix inverses.
## It automatically computes the inverse matrix at first need and caches it for future use.
## When the original matrix is renewed (with the set function) the cache is cleared so it the
## reverse is recalculated at next use.

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  # Initialize s as a empty matrix
  s <- matrix(,0,0)
  set <- function(y) {
    x <<- y
    s <<- matrix(,0,0)
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  ## When s is not empty, then it contains the inverse matrix
  if (length(s)>0) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
