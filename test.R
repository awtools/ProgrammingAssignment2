## For Testing paste this step by step into the R console

##Step1: Source cachematrix.R or copy its content into the R console

##Step2: makeCacheMatrix
##Importan: Matrix must be square to make sure it can be inversed
my_matrix <- makeCacheMatrix(matrix(rnorm(9,sd=1),3))

##Step3: print out matrix
my_matrix$get()

##Step4: print out inverse value (NULL because nothing computed till now)
my_matrix$getInverse()

#Step5: cacheSolve the my_matrix
cacheSolve(my_matrix)

#Step6: Do again to check if cache is used
cacheSolve(my_matrix)

#Step7: Set new Matrix value
my_matrix$set(matrix(1:4,2))

##Step8: Check if value is set to NULL after changeing the matrix
my_matrix$getInverse()


#Step9: cacheSolve the my_matrix
cacheSolve(my_matrix)

#Step10: Do again to check if cache is used
cacheSolve(my_matrix)
