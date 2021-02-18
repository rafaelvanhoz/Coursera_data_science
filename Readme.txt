Diamond price prediction

Rafael Vanhoz

Overview
This presentation contains documentation for the Diamond price prediction application. The application can be found here

This application it is building linear regression model using diamonds data set and is predicting the price of a diamond depending of its properties.The application allows the user to select:

Carat
Cut
Color
Clarity
Builds a plot and gives predicted price of the diamond.

Data used
The data used for this application is diamonds data set, which is part of ggplot2 package. This data set contains the information about 53940 diamonds with 10 variables:

Shiny files
The application is build using Shiny package and the source code is in 2 files:

ui.R
server.R

Application functionality
The application is drawing plot of diamonds in the diamonds data set distributed by their size (carat) and price ($). The regression line is shown on the plot as well.

By selecting specific features of the diamond (carat, cut, clarity, color) the user is able to sub select the data set and the regression is recalculated based only on the diamonds in the data set that share the same features. If no features are selected the regression model is using all diamonds in the data set.

Below the graph the predicted price is shown.
