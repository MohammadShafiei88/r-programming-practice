# The data can be imported from file s4-BasketballData.R
# Create a Matrix with matrix method
A <- matrix(rnorm(20),4,5)
A
B <- matrix(1:20,4,5)
B

# create a Matrix with rbind or cbind
r1 <- c ('AA', 'BB', 'CC', 'DD')
r2 <- c (11, 12, 13, 14)
r3 <- c ('A1', 'A2', 'A3', 'A4')

C <- rbind (r1, r2, r3)
C

D <- cbind (r1, r2, r3)
D


# Naming dimensions
mat1 <- matrix(1:30, 6, 5)
mat1
colnames(mat1)
colnames(mat1) <- c('col1', 'col2', 'col3', 'col4', 'col5')
mat1

rownames(mat1) <- c('row1', 'row2', 'row3', 'row4', 'row5', 'row6')
rownames(mat1)

mat1

rownames(mat1) <- NULL
mat1

rownames(mat1) <- c('row1', 'row2', 'row3', 'row4', 'row5', 'row6')
mat1

mat1['row2', 'col3'] <- 0
mat1


mat2 <- matrix(0, 5, 5)
mat2

mat2[2,3] <- 10
mat2

#plotting a matrix with matplot
mat3 <- matrix(rnorm(30,10,5),3,10)
mat3

matplot(t(mat3), type = 'b', pch = 15:18, col = c (1:3,5))
legend("bottomright", inset = 0.01, legend = c("A1", "A2", "A3"),pch = 15:18, col = c (1:3,5) )

       