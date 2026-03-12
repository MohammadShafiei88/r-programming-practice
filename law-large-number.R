#Law of Large Number (LLM)
#Coin (head and tail)
N1 <- 1000
sum_head <- 0
sum_tail <- 0
for (i in rnorm(N1)){
  if(i<0){
    sum_tail <- sum_tail + 1
  }
  else{
    sum_head <- sum_head + 1
  }
}
mean_head <- round(sum_head/N,3)
mean_tail <- round(sum_tail/N,3)

#Normal distribution
N2 <- 1000
prob <- 0
sum <-0
for (i in rnorm(N2)){
  if (i<= 1 & i>= -1){
    sum <- sum + 1
  }
}
first_dev <- sum/N2 # It should be 68.2 for normal distribution
