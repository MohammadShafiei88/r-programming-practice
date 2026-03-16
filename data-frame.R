# In this project one needs to read the data from the Demographic-Data.csv file.
df <- read.csv("Demographic-Data.csv")

#---------- Exploring data --------------
# the number of rows & coloumns
nrow(df)
ncol(df)

# head/tail of the data -> showing the top/ bottom rows
head(df, n=3)
tail(df, n=4)

# structure & summary of the data
str(df)
summary(df)

# ---------- $ sign -------------
df[,4]
df$Internet.users
df$Internet.users[3:5]

levels(df$Income.Group)

is.data.frame(df[1,]) 
is.data.frame(df[,1]). # is nor a data frame
#solution:
is.data.frame(df[,1, drop=F])
df$mycalc <- df$Internet.users * df$Birth.rate
head(df, n=3)

# Remove a column
df$mycalc <- NULL
head(df, n=3)

# ---------- Filtering data frame  --------------
df[df$Internet.users < 2 , c('Birth.rate', 'Country.Name')]

df[df$Birth.rate >40, ]

df[df$Internet.users<2 & df$Birth.rate >40, ]

df[df$Income.Group == 'High income',]

df[df$Country.Name == 'Malta',]
