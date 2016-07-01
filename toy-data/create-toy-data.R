######## Creating toy data: Part of plotting-coupled-data.r ########
#
# This file creates toy data for those who want to try the code.
# This does not have to be run again, as data are provided in separate
# files. This data simulates data from a dyadic conversation, with 
# binary codes for speech state (0 = not speaking, 1 = speaking) and
# continuous codes for normalized movement score.
#
# Written by: A. Paxton (University of California, Berkeley)
# Date last modified: 30 June 2016
####################################################################

# clear our workspace and set working directory
rm(list=ls())

# create some toy speech data
p0.speech = sample(0:1,100,replace = TRUE)
p1.speech = sample(0:1,100,replace = TRUE)

# create some toy movement data
p0.mov = scale(rnorm(100) * 2)
p1.mov = scale(rnorm(100) * 2)

# create a long-form dataframe, with each row as a single time slice
toy.convo = data.frame(dyad = 1,
                t = 1:100,
                p0mov = p0.mov,
                p1mov = p1.mov,
                p0sp = p0.speech,
                p1sp = p1.speech)

# save it to file
write.table(toy.convo,'./toy-data/toy-data.csv',sep=',',row.names = FALSE, col.names = TRUE)