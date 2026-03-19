# For this project one needs to use the file movie-ratings.csv
getwd()
setwd('/Users/mohammadshafiei/Desktop/R-coding')
getwd()

movies <- read.csv('movie-ratings.csv')
head(movies, n=3)

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "Budgetmillions", "Year")

head(movies, n=2)
tail(movies, n=2)
str(movies)
nrow(movies)
summary(movies)

# Turning the column Year, Film, and Genre to categorical variables (factor)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

movies$Film <- factor(movies$Film)
movies$Genre <- factor(movies$Genre)
str(movies)

# ----------------- Aesthetic & Geometry --------------
library(ggplot2)

ggplot(data= movies, aes(x= CriticRating, y= AudienceRating)) + geom_point()

# Add colour
ggplot(data= movies, aes(x= CriticRating, y= AudienceRating, 
                         colour = Genre)) + geom_point()

# Add size
ggplot(data= movies, aes(x= CriticRating, y= AudienceRating, 
                         colour = Genre, size = Budgetmillions)) + geom_point()

# ggplot(data= movies, aes(x= CriticRating, y= AudienceRating, 
#                        colour = Genre, size = Budgetmillions)) + geom_point() + 
# geom_line()

# ------------------- Overriding aesthetics ------------------
q <- ggplot(data= movies, aes(x= CriticRating, y= AudienceRating, 
                         colour = Genre, size = Budgetmillions))

q + geom_point(aes(size=CriticRating))
q + geom_point(aes(colour=Budgetmillions))

# x&y labels
q + geom_point() + xlab("CCCCCritical Rating") + ylab("AAAAudience Rating")

# reduce line size:
q + geom_line(size=0.5) + geom_point()


# ----------------- Histogram and Density chart ----------------
s <- ggplot(data = movies, aes(x = Budgetmillions))
s + geom_histogram(binwidth = 10) + xlab("Budget in million dollars")

# add colour
# setting
s + geom_histogram(binwidth = 10, fill='Green')
# mapping
s + geom_histogram(binwidth = 10, aes(fill=Genre))
# border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour = "Black")


s + geom_density()
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = 'stack')


# ------------------ Statistical Transformation -------------
# geom_smooth(): Aids the eye in seeing patterns in the presence of overplotting. 
# geom_smooth() and stat_smooth() are effectively aliases: they both use the same arguments. 

u <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre))
u + geom_point() + geom_smooth()

u + geom_point() + geom_smooth(fill=NA)

# Box plot
u <- ggplot(data = movies, aes(x=Genre, y=AudienceRating, colour = Genre))
u + geom_boxplot()

u + geom_boxplot(size = 1.2)

u + geom_boxplot(size = 1.2) + geom_point()

u + geom_boxplot(size = 1.2) + geom_jitter()

u + geom_jitter() + geom_boxplot(size = 1.2, alpha=0.5) 

# --------------- Using Facet ------------------
v <- ggplot(data = movies, aes(Budgetmillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   colour = 'Black')

# facets
v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   colour = 'Black') + facet_grid(Genre~.)


v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   colour = 'Black') + facet_grid(Genre~.,scales = 'free')


# Scatter plot
w <- ggplot(data = movies, aes(x = CriticRating, y=AudienceRating, colour = Genre))

w + geom_point(size=3)

w + geom_point(size=2) + facet_grid(Genre~.)

w + geom_point(size=2) + facet_grid(.~Year)

w + geom_point(size=2) + facet_grid(Genre~Year)

w + geom_point(size=2) + facet_grid(Genre~Year) +
  geom_smooth()

w + geom_point(aes(size = Budgetmillions)) + facet_grid(Genre~Year) +
  geom_smooth()

# ------------------- Coordinates -------------------
m <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, size = Budgetmillions,
                               colour = Genre))

m + geom_point()

m + geom_point() + xlim(50,100) + ylim(50,100)

w + geom_point(aes(size = Budgetmillions)) + facet_grid(Genre~Year) +
  geom_smooth() + coord_cartesian(ylim = c(0,100) )

# ---------------------- Theme -----------------------
o <- ggplot(data = movies, aes(x=Budgetmillions))
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), colour = 'Black')

# axes labels
h + xlab("money access") + ylab('number of movies')

h + xlab("money access") + ylab('number of movies') + 
  theme(axis.title.x = element_text(colour='DarkGreen', size=30)) 

# Tick mark
h + xlab("money access") + ylab('number of movies')

h + xlab("money access") + ylab('number of movies') + 
  theme(axis.title.x = element_text(colour='DarkGreen', size=30),
        axis.title.y = element_text(colour='DarkGreen', size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

# Legend formatting
h + xlab("money access") + ylab('number of movies') + 
  theme(axis.title.x = element_text(colour='DarkGreen', size=30),
        axis.title.y = element_text(colour='DarkGreen', size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

# Title
h + xlab("money access") + ylab('number of movies') + 
  ggtitle("Movie budget distribution")+
  theme(axis.title.x = element_text(colour='DarkGreen', size=30),
        axis.title.y = element_text(colour='DarkGreen', size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))
        

                                                        
