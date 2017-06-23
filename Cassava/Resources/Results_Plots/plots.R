setwd("C:/Users/amram/Desktop/TF_cassava")

library(ggplot2)
library(viridis)

df <- read.csv("results_5112017.csv")


# Set color by cond
ggplot(df, aes(x=Model, y=Accuracy,color=training.test.split)) + geom_point(aes(shape=Dataset), size =3) + ylab("% Overall Accruacy") + xlab("") + theme_pub() + scale_color_viridis(discrete=TRUE, name = "Training test data split")
