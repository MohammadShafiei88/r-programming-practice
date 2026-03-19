#Import the Data
# For this project one needs to import data from csv file movie-domestic-data.csv


mov <- read.csv("movie-domestic-data.csv")

#Data Exploration
head(mov, n=3) 
summary(mov) 
str(mov) 


library(ggplot2)


ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

#operator to select multiple Genres:
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

#Now let's do the same for the Studio filter:
filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio =="WB") | (mov$Studio == "Fox") | (mov$Studio == "Universal") | (mov$Studio == "Sony") | (mov$Studio == "Paramount Pictures")
  
#Apply the row filters to the dataframe
mov2 <- mov[filt & filt2,]

str(mov2)
colnames(mov2)

p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))

p + 
  geom_jitter()

#Add a boxplot instead of the points
p + 
  geom_jitter(aes(size = Budget...mill., colour = Studio, )) +
  geom_boxplot(alpha=0.5)




#Place boxplot on top of jitter
p + 
  geom_boxplot() + 
  geom_jitter(aes(size = Budget...mill., colour = Studio))

#Add boxplot transparency
p + 
  geom_boxplot() + 
  geom_jitter(aes(size = Budget...mill., colour = Studio), alpha=0.7)


p + 
  geom_jitter(aes(x=Budget...mill., y=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 

#Let's "Save" our progress by placing it into a new object:
q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 
q

#Non-data ink
q <- q +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q

#HINT: for the next part use ?theme if you need to 
#refresh which parameters are responsible for what

#Theme
q <- q + 
  theme(
    text = element_text(family="Comic Sans MS"),

    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),

    axis.text.x= element_text(size=20),
    axis.text.y = element_text(size=20),  

    plot.title = element_text(colour="Black",
                              size=40),

    legend.title = element_text(size=20),

    legend.text = element_text(size=12)
  )
q


q$labels$size = "Budget $M"
q

