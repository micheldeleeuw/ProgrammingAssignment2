### Usage example

````
source('cachematrix.R')
myCacheMatrix <- makeCacheMatrix()
myCacheMatrix$set(matrix(1:4 ,2 ,2))
cacheSolve(myCacheMatrix)
````

In the example a 2 by 2 matrix with the numbers 1 to 4 will be have the inverse
```
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
```

When the reserve is needed again it will be returned from cache.
````
cacheSolve(myCacheMatrix)
````
will output
```
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
```

Note the 'getting cached data' note. It wasn't their in the first call of cacheResolve().
