####-------------------------------------------------------------------------------------------------------####
#### Software Carpentry 2019
####-------------------------------------------------------------------------------------------------------####

# Data Structures

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

cats
write.csv(cats, "data/feline_data.csv")
cats <- read.csv("data/feline_data.csv")

cats$weight
cats$coat
cats$weight <- cats$weight*2.2
cats$weight

cats$weight + cats$coat

class(cats$weight)
class(cats$coat)

class(cats)
str(cats)

num_vector <- c(1, 3, 5)
chr_vector <- c("a", "b", "c")
chr_vector2 <- c("d", "e", "f")
comb_vector <- c(chr_vector, chr_vector2)
comb_vector

num_vector2 <- c(100, 10, 20)

num_vector + num_vector2

my_series <- 1:10
my_series

seq(10)
seq(from = 1, to = 10, by = 0.1)

my_example <- 5:8
names(my_example) <- c("a", "b", "c", "d")
my_example
names(my_example)

?LETTERS

num_vector3 <- 1:26
num_vector3 <- num_vector3*2
names(num_vector3) <- LETTERS
num_vector3

# Reading real data
gapminder <- read.csv("data/gapminder_data.csv")

str(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)

colnames(gapminder)

# Subsetting data (old way)

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x

x[1]
x[3]
x[c(1, 3)]
x[1:4]
x[6]
x[-2]
x[-(2:4)]

head(gapminder)
head(gapminder["pop"])
head(gapminder[,5])

gapminder[3, ]
gapminder[1:10, 5]
gapminder[138,]
gapminder[1:6, c("pop", "lifeExp", "year", "gdpPercap")]

albania <- gapminder[13:24, 1:6]
albania

afganistan <- gapminder[1:12, 1:6]
afganistan
afganistan$gdp <- afganistan[,3]*afganistan[,6]
afganistan
write.csv(afganistan, file = "results/afganistan_plus_gdp.csv", row.names = FALSE)

library("gapminder")

# ggplot basics

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             color = continent)) +
  geom_point(size = 2, aes(shape = continent)) +
  scale_x_log10() +
  geom_smooth(method = "lm") +
  scale_y_continuous(limits = c(0,100), breaks = seq(0,100, by = 10)) +
  theme_bw() +
  ggtitle("Effects of per-capita gDP on Life Expenctancy") +
  xlab("GDP per Capita ($)") +
  ylab("Life Expectancy (yrs)")
ggsave(file = "results/life_expectancy.png")
ggsave(file = "results/life_expectancy.pdf")

# Basic programming in R

number <- 37
if (number > 100) {
  print("Greater than 100")
} else {
    print("less than or equal to 100")
}
# Less than <
# Equal to ==
# Not equal to !=

number <- -3

if (number > 0) {
  print(1)
} else if (number < 0) {
  print(-1)
} else {
  print(0)
}

number1 <- -15
number2 <- 40
if (number1 >= 0 & number2 >= 0) {
  print("both numbers are positive")
} else {
  print("at least one number was negative")
}

# Loops

numbers <- 1:10
numbers

for (number in numbers) {
  print(number)
}

for (i in 1:10) {
  print(i)
}

letter <- "z"
print(letter)
for (letter in c("a", "b", "c")) {
  print(letter)
}

sum <- 0
for (number in c(4, 8, 15, 16, 23, 42)) {
  sum <- sum + number
}
print(sum)


# Functions

fahrToKelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}

fahrToKelvin(32)
fahrToKelvin(212)

kelvinToCelsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

kelvinToCelsius(0)

# Function to convert fahrenheit to kelvin
fahr_to_kelvin <- function(temp) {
  
  temp <- ((temp - 32) * (5 / 9)) + 273.15
  return(temp)
}

# Store the current temperature in F
temp <- 73


# Get the temperature in kelvin
kelvin_temp <- fahr_to_kelvin(temp)


# Print the temperature
print(temp)

celsiusToFahrenheit <- function(temp) {
  temp <- (temp*(9/5)) + 32
  return(temp)
}

celsiusToFahrenheit(0)
celsiusToFahrenheit(100)

# Reproducible Research in R
install.packages(c("rmarkdown", "formatR"))
