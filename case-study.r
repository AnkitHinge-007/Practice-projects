
# Implementation of previous python project in R.
# A simple project to learn about ggplot in R. 
# It is a data visualisation project of the suicide cases in india.

# Link for the project - https://rstudio.cloud/project/2700664
# login to rstudio cloud to view the project

# code

install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

india <- read.csv("Suicides_in_India_2001-2012.csv")
View(india)

allindia <- read.csv("Suicides_All_India.csv")
View(allindia)

maha <- india %>% 
  filter(State == "Maharashtra" , Type_code == "Professional_Profile")
View(maha)

full <- allindia %>% 
  filter(State == "Total (All India)" , Type_code == "Social_Status")
View(full)

ggplot(data = maha)+
  geom_smooth(mapping = aes(x=Year, y=Total, fill=Type))+
  scale_x_continuous(limits=c(2000, 2013), breaks = seq(2000,2013,1))+
  theme(axis.text.x = element_text(angle =45))+
  labs(title = "Suicides in Maharashtra by Occupation 2001-2012")

ggplot(data = india)+
  geom_col(mapping = aes(x=Year, y=Total, fill=State))+
  scale_x_continuous(limits=c(2000, 2013), breaks = seq(2000,2013,1))+
  theme(axis.text.x = element_text(angle =45))+
  labs(title = "Suicides in Different States of India 2001-2012")

ggplot(data = maha)+
  geom_col(mapping = aes(x=Year, y=Total, fill=Type))+
  scale_x_continuous(limits=c(2000, 2013), breaks = seq(2000,2013,1))+
  theme(axis.text.x = element_text(angle =45))+
  labs(title = "Suicides in Maharashtra by Occupation 2001-2012")

ggplot(data = full)+
  geom_col(mapping = aes(x=Year, y=Total, fill=Type))+
  scale_x_continuous(limits=c(2000, 2013), breaks = seq(2000,2013,1))+
  theme(axis.text.x = element_text(angle =45))+
  labs(title = "Suicides in All India by Social Status 2001-2012")

ggplot(data = india)+
  geom_col(mapping = aes(x=Year, y=mean(Total), fill=Year))+
  scale_x_continuous(limits=c(2000, 2013), breaks = seq(2000,2013,1))+
  theme(axis.text.x = element_text(angle =45))+
  labs(title = "Suicides in Different States of India 2001-2012")


ggplot(data = allindia)+
  geom_smooth(mapping = aes(x=Year, y=Total))+
  labs(title = "Suicides in Different States of India 2001-2012")

mean(allindia$Total)
mean(india$Total)
