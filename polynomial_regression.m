% polynomial_regression.m
%
% Solution to Question 4.2.1

% Load the data
[Countries, Features, Data] = loadUnicefData();

% Split into training and testing data
%Data = normalizeData(Data);
t = Data(1:100,2);
testT = Data(101:195,2);     % Target values for testing data
Data = normalizeData(Data);
X = Data(1:100,8:end);
testX = Data(101:195,8:end);


% TO DO:: Fill in

%weights = zeros(33,1);
%learning_rate = 0.01;
%iterations = 2000;
Degree = (1:6);
rmsTrainingError = zeros(6,1);
rmsTestError = zeros(6,1);

for i = 1:6

    PhiTraining = designMatrix(X,'polynomial',i);
	PhiTest = designMatrix(testX,'polynomial',i);
    %weights = pinv(PhiTraining'*PhiTraining)*PhiTraining'*t;
    weights = pinv(PhiTraining)*t;
    rmsTrainingError(i,:) = sqrt(sum((PhiTraining * weights - t).^2) / length(t));
    rmsTestError(i,:) =  sqrt(sum((PhiTest * weights - testT).^2) / length(testT));
    
end


plot(rmsTrainingError, 'DisplayName','Training Error');hold on; 
plot(rmsTestError, 'DisplayName', 'Test Error')
ylabel('RMS')
xlabel('Degree of Polynomial')
legend('Training Error','Test Error')
