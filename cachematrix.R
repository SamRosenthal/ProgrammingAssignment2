## Put comments here that give an overall description of what your
## functions do

#The first function - makeCacheMatrix - takes the matrix it
#is given and returns a list containing 4 items including
#an inverse for the given matrix if the inverse has already
#been calculated.

#The 2nd function - cacheSolve - takes a vector containing
#the four items in the list generated by makeCacheMatrix and
#spits out the inverse of the matrix either by calculating
#it or by retrieving a cached value



## Write a short comment describing this function

#Takes in a matrix and creates a list that holds four items:
#In set: the matrix and possible inverse value are held - using
#the <<- operator - outside of the current environment
#In get: The matrix's original value
#In setInverse: the function that will be applied to get the
#inverse value
#In getInverse: The value for the inverse.  This can be a NULL
#value

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) m <<- solve
        getInverse <- function() m
        list(set = set, get = get, 
             setInverse = setInverse, getInverse = getInverse)
        

}


## Write a short comment describing this function

#This function takes the list generated by makeCacheMatrix
#and then looks at the inverse part of the list using its
#name: getInverse.
#It then tests if getInverse holds a null value
#If it doesn't, it tells you it is getting this cached data,
#returns the cached value of the inverse, and exits
#If it is null, it calls solve to get the inverse, stores this
#value in 'm' - where cached inverse values are stored, and
#returns the inverse value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <-x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}
