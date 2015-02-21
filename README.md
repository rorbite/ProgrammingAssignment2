### Introduction

Here is the results of my programming assignment to write an R
function that is able to cache potentially time-consuming computations.

The library expose two functions:

  `makeCacheMatrix` ->  wraps a matrix inside an structure to hold the 
                        value of the matrix and its inverse
                      
  `cacheSolve`      ->  solves a matrix inside the structure returned by 
                        the function above using the cached data whenever
                        possible
                      
### Example of utilization

Creating a sample matrix:

<!-- -->

  m <- matrix(c(0, 2, 1, 0), nrow = 2, ncol = 2, byrow = TRUE)
  
  
Wraps the matrix inside the structure:

<!-- -->

  cm <- makeCacheMatrix(m)


Calculates the inverse the first time:

<!-- -->
  
  cacheSolve(cm)


Calculates the inverse the second time:

<!-- -->
  
  cacheSolve(cm)


