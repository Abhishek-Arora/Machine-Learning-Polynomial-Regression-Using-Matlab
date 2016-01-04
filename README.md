# Machine-Learning-Polynomial-Regression-Using-Matlab
In this Machine Learning assignment for CMPT 726 ML course at SFU, trained model for regression and analyzed a dataset.


##Data
The dataset is created from data provided by UNICEF’s State of the World’s Children 2013 report:
(http://www.unicef.org/sowc2013/statistics.html)


##Implementation


Implemented linear basis function regression with polynomial basis functions. Used only monomials of a single variable and no cross-terms.


The following experiments were performed:

* Created a MATLAB script polynomial regression.m for the following:


Fit a polynomial basis function regression (unregularized) for degree 1 to degree 6 polynomials.
Plot training error and test error (in RMS error) versus polynomial degree.

* Created a MATLAB script polynomial regression 1d.m for the following:


Perform regression using just a single input feature.
Try features 8-15 (Total population - Low birthweight). For each (un-normalized) feature fit
a degree 3 polynomial (unregularized).
Plot training error and test error (in RMS error) for each of the 8 features.

###Sigmoid Basis Function

*  Created a MATLAB script sigmoid regression.m for the following:


Implement regression using sigmoid basis functions for a single input feature. Use two
sigmoid basis functions, with µ = 100, 10000 and s = 2000. Include a bias term. Use
un-normalized features.
Fit this regression model using feature 11 (GNI per capita).

###Regularized Polynomial Regression

* Create a MATLAB script polynomial regression reg.m for the following:


Implement L2-regularized regression. Fit a degree 2 polynomial using λ = {0, .01, .1, 1, 10, 102, 103, 104}.
Use normalized features as input. Use 10-fold cross-validation to decide on the best value
for λ. Produce a plot of average validation set error versus λ. Use a semilogx plot, putting
λ on a log scale.
