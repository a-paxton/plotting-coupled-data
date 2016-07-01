# Plotting coupled categorical and continuous time series data

This code plots coupled categorical and continuous time series in a single, elegant plot. It was originally created to visualize speech (categorical; speaking or silent) and movement (continuous; see Paxton & Dale, 2013, *Behavior Research Methods*) between two people engaged in conversation. The code includes sections to create color and greyscale plots.

## Color Figure

![alt text](https://github.com/a-paxton/plotting-coupled-data/color-figure.png "Color Figure")

## Greyscale Figure

![alt text](https://github.com/a-paxton/plotting-coupled-data/greyscale-figure.png "Greyscale Figure")


## Adapting this code

The code as written assumes that the data are in long form -- in other words, with a single row per observation. If your data are in wide form, there are many useful R packages and tutorials to help you easily convert from wide to long form, like <a href="http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/", target = "_blank">this</a>, <a href="http://www.ats.ucla.edu/stat/r/faq/reshape.htm", target = "_blank">this</a>, or <a href="http://www.theanalysisfactor.com/wide-and-long-data/", target = "_blank">this</a>.

Note that any runs of the categorical variable that last only 1 sample are -- for graphing purposes *only* -- increased to a length of 1.1 samples in order to allow them to be plotted appropriately. (Without this increase, the start and end points for the categorical variables are identical, which would prevent the appropriate application of the shading.)

## Citations

If you use or adapt this code, please cite our paper:

Tollefsen, D., Dale, R., & Paxton, A. (2013). Alignment, transactive memory, and collective cognitive systems. *Review of Philosophy and Psychology*, *4*(1), 49-64.


