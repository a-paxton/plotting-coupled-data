######## Plot coupled categorical and continuous data ########
#
# This code plots coupled categorical and continuous time series
# in a single, elegant plot. It was originally created to
# visualize speech (categorical; speaking or silent) and movement
# (continuous; see Paxton & Dale, 2013, Behavior Research Methods) 
# between two people engaged in conversation.
#
# If you use or adapt this code, please cite our paper:
# Tollefsen, D., Dale, R., & Paxton, A. (2013). Alignment,
#             transactive memory, and collective cognitive systems.
#             Review of Philosophy and Psychology, 4(1), 49-64.
#
# Written by: R. Dale (Univ. of California, Merced) and 
#             A. Paxton (University of California, Berkeley)
# Date last modified: 1 July 2016
####################################################################

# clear workspace and load necessary libraries
rm(list=ls())
library(dplyr)

# load in toy data created in supplementary file
toy.convo = read.table('./toy-data/toy-data.csv', header=TRUE, sep=',')

# create variables for quick-and-easy code changes
dyad = unique(dyad)
start.frame = 1
end.frame = 100

# identify p0's turns
p0turns = data.frame(unclass(rle(toy.convo$p0sp)))
p0turns = p0turns %>%
  mutate(end = cumsum(lengths)) %>%
  mutate(start = (end+1)-lengths)
p0turns = p0turns[p0turns$values == 1,]

# identify p1's turns
p1turns = data.frame(unclass(rle(toy.convo$p1sp)))
p1turns = p1turns %>%
  mutate(end = cumsum(lengths)) %>%
  mutate(start = (end+1)-lengths)
p1turns = p1turns[p1turns$values == 1,]

# for graphing purposes, if turn lasts only a single sample, increase to 1.5
p0turns$end[p0turns$lengths==1] = p0turns$end[p0turns$lengths==1] + .1
p1turns$end[p1turns$lengths==1] = p1turns$end[p1turns$lengths==1] + .1

#############################################################################
############################# GREYSCALE FIGURES #############################
#############################################################################

# initialize plot
dev.new(width=4, height=2)
plot(NULL, 
     xlim=c(start.frame,end.frame),
     ylim=c(-2,2),
     cex=1,cex.axis=1,
     ylab="Movement", 
     xlab="Time (in frames)")

# speech (categorical): add p0 as cross-hatching and semi-opaque grey rectangles
for (turn in 1:dim(p0turns)[1]) {
  
  # plot speech as cross-hatching
  rect(xleft = p0turns$start[turn],
       xright = p0turns$end[turn],
       ytop = 5,
       ybottom = -5,
       col=rgb(.5,.5,.5,1),
       lwd = .5,
       density=20,
       angle=45,
       border=FALSE)
  
  # plot some greyscale shading over it
  rect(xleft = p0turns$start[turn],
       xright = p0turns$end[turn],
       ytop = 5,
       ybottom = -5,
       col=rgb(.5,.5,.5,.1),
       border=FALSE)
}

# speech (categorical): add p1 as cross-hatching and semi-opaque grey rectangles
for (turn in 1:dim(p1turns)[1]) {
  
  # plot speech as cross-hatching
  rect(xleft = p1turns$start[turn],
       xright = p1turns$end[turn],
       ytop = 5,
       ybottom = -5,
       col=rgb(.5,.5,.5,1),
       density=20,
       lwd = .5,
       angle=325,border=FALSE)
  
  # plot some greyscale shading over it
  rect(xleft = p1turns$start[turn],
       xright = p1turns$end[turn],
       ytop = 5,
       ybottom = -5,
       col=rgb(.25,.25,.3,.2),
       border=FALSE)
}

# movement (continuous): plot p0 as a line
points(x = 1:length(toy.convo$t),
     y = toy.convo$p0mov,
     col=rgb(.5,.5,.5),
     type='l', lwd=2
)

# movement (continuous): add p1 as a line
points(x = 1:length(toy.convo$t),
       y = toy.convo$p1mov,
       col=rgb(.25,.25,.3),
       type='l',lwd=2)

# save the plot
dev.copy(png,'greyscale-figure.png')
dev.off()

#########################################################################
############################# COLOR FIGURES #############################
#########################################################################

# initialize plot
dev.new(width=4, height=2)
plot(NULL, 
     xlim=c(start.frame,end.frame),
     ylim=c(-2,2),
     cex=1, cex.axis=1,
     ylab="Movement", 
     xlab="Time (in frames)")

# speech (categorical): add p0 as semi-opaque colored rectangles
for (turn in 1:dim(p0turns)[1]) {
  rect(xleft = p0turns$start[turn],
       xright = p0turns$end[turn],
       ytop = 5,
       ybottom = -5,
       col=rgb(0,0,1,.3),
       border=FALSE)
}

# speech (categorical): add p1 as semi-opaque colored rectangles
for (turn in 1:dim(p1turns)[1]) {
  rect(xleft = p1turns$start[turn],
       xright = p1turns$end[turn],
       ytop = 5,
       ybottom = -5,
       col=rgb(1,0,0,.15),
       border=FALSE)
}

# movement (continuous): add p0 as a line
points(x = 1:length(toy.convo$t),
       y = toy.convo$p0mov,
       col=rgb(0,0,1),
       type='l', lwd=1.5
)

# movement (continuous): add p1 as a line
points(x = 1:length(toy.convo$t),
       y = toy.convo$p1mov,
       col=rgb(1,0,0),
       type='l',lwd=1.5
)

# save the plot
dev.copy(png,'color-figure.png')
dev.off()