% sigmoid_regression.m
%
% Solution to Question 4.3.1

% Load the data
[Countries, Features, Data] = loadUnicefData();

% Split into training and testing data

t = Data(1:100,2);
X = Data(1:100,11);
testX = Data(101:195,11); %Testing data
testT = Data(101:195,2);     % Target values for testing data


PhiTraining = designMatrix(X,'sigmoid',100,10000,2000);
PhiTest = designMatrix(testX,'sigmoid',100,10000,2000);
weights = pinv(PhiTraining'*PhiTraining)*PhiTraining'*t;
rmsTrainingError = sqrt(sum((PhiTraining * weights - t).^2) / length(t));
rmsTestError =  sqrt(sum((PhiTest * weights - testT).^2) / length(testT));

plot(X, t, 'g.');hold on;
scatter(testX, testT, 'b.');

x_ev = X;
y_ev = PhiTraining*weights;
plot(x_ev, y_ev, 'r.');

legend('Training Data','Test Data', 'Curve Fit')