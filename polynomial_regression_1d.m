% polynomial_regression_1d.m
%
% Solution to Question 4.2.2

% Load the data
[Countries, Features, Data] = loadUnicefData();


% TO DO:: Fill in

% Split into training and testing data
t = Data(1:100,2);
testT = Data(101:195,2);     % Target values for testing data

%Data = normalizeData(Data);
X = Data(1:100,8:15);
testX = Data(101:195,8:15); %Testing data


%testT = normalizeData(testT);

rmsTrainingError1 = zeros(8,1);
rmsTestError1 = zeros(8,1);

for i = 1:8
    PhiTraining = designMatrix(X(:,i),'polynomial',3);
	PhiTest = designMatrix(testX(:,i),'polynomial',3);
    %weights = pinv(PhiTraining'*PhiTraining)*PhiTraining'*t;
    weights = pinv(PhiTraining)*t;
    %sprintf('%f',weights)
    rmsTrainingError1(i,:) = sqrt(sum((PhiTraining * weights - t).^2) / length(t));
    rmsTestError1(i,:) =  sqrt(sum((PhiTest * weights - testT).^2) / length(testT));
end

%plot(rmsTrainingError1, 'DisplayName','Training Error');hold on; plot(rmsTestError1, 'DisplayName', 'Test Error')
bar([rmsTrainingError1 rmsTestError1]);
ylabel('RMS')
xlabel('Feature')

