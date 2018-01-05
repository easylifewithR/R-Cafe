# Prepared by: Akash Gupta, member of R Café


library(ggplot2)
library(dplyr)
#Setting up the directory
#setwd("path to your directory where you save your data")

##   Upload the data
housing = read.csv("landdata-states.csv")
head(housing)


##   Now that we know about geometric objects and aesthetic mapping, we can
##   make a ggplot. `geom_point' requires mappings for x and y, all others
##   are optional.

hp2001Q1 = housing %>% filter(Date == 2001.25) 
ggplot(hp2001Q1,
       aes(y = Structure.Cost, x = Land.Value)) +
  geom_point()

p1 = ggplot(hp2001Q1,
       aes(y = Structure.Cost, x = log(Land.Value))) +
  geom_point()
p1

## Smoothers
## ~~~~~~~~~
##   Not all geometric objects are simple shapes--the smooth geom includes
##   a line and a ribbon.

p1 +
  geom_point(aes(color = Home.Value)) +
  geom_smooth()

## Text (Label Points)
## ~~~~~~~~~~~~~~~~~~~
##   Each `geom' accepts a particualar set of mappings--for example
##   `geom_text()' accepts a `labels' mapping.

p1 + 
  geom_point() + 
  geom_text(aes(label=State), size = 3)

## install.packages("ggrepel") 
library(ggrepel)
p1 + 
  geom_point() + 
  geom_text_repel(aes(label=State), size = 3)

## Aesthetic Mapping VS Assignment
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##   Note that variables are mapped to aesthetics with the `aes()'
##   function, while fixed aesthetics are set outside the `aes()' call.
##   This sometimes leads to confusion, as in this example:

p1 +
  geom_point(color="red")
          

## Mapping Variables To Other Aesthetics
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##   Other aesthetics are mapped in the same way as x and y in the previous
##   example.

p1 +
  geom_point(aes(color=Home.Value, shape = region)) 
# Changing new theme and adding labels on x and y axis
p1 +
  geom_point(aes(color=Home.Value)) +
  theme_bw() +
  theme(legend.position="right",
        axis.text=element_text(size = 6, family = "Times New Roman")) +
  xlab("Log(Land cost)") + 
  ylab("Structure cost")

# Removing grid
p1 +
  geom_point(aes(color=Home.Value)) +
  theme_bw() +
  theme(legend.position="right",
        axis.text=element_text(size = 6, family = "Times New Roman"),
        panel.grid = element_blank()) +
  xlab("Log(Land cost)") + 
  ylab("Structure cost")

# Changin the scales of aesthetic (x, y, color, shape etc) 
p1 +
  geom_point(aes(color=Home.Value)) +
  theme_bw() +
  theme(legend.position="right",
        axis.text=element_text(size = 6,family = "Times New Roman"),
        panel.grid = element_blank()) +
  scale_x_continuous(name = "Log(Land cost)") + 
  scale_y_continuous(name = "Structure cost") +
  scale_color_continuous(name = "Home cost",
                         low = "blue", 
                         high = "red")

# Reference: http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html
