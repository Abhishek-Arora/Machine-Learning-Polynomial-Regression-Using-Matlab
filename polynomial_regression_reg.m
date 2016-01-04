% polynomial_regression_reg.m
%
% Solution to Question 4.4.1
%
[Countries, Features, Data] = loadUnicefData();

% Split into training and testing data
UnnormalizedData = Data(1:100,8:end);
Data = normalizeData(Data);






% TO DO:: Fill in

%weights = zeros(33,1);
%learning_rate = 0.01;
%iterations = 2000;



rmsTrainingError = zeros(10,8);
rmsTestError = zeros(10,8);
lambda = [0, .01, .1, 1, 10, 100, 1000, 10000];

% X = Data(10:100, 8:end);
% testX = Data(1:10, 8:end);
% t = UnnormalizedData(10:100, 2);
% testT = UnnormalizedData(1:10, 2);

for j=1:10

	if j==1
		X = Data(10:100, 8:end);
		testX = Data(1:10, 8:end);
		t = UnnormalizedData(10:100, 2);
		testT = UnnormalizedData(1:10, 2);
		
	elseif j==10
		X = Data(1:90, 8:end);
		testX = Data(91:100, 8:end);
		t = UnnormalizedData(1:90, 2);
		testT = UnnormalizedData(91:100, 2);
		
	elseif j==9
		X = vertcat(Data(1:80, 8:end), Data(90:100, 8:end)); 
		testX = Data(81:90, 8:end);
		t = vertcat(UnnormalizedData(1:80, 2), UnnormalizedData(90:100, 2)); 
		testT = UnnormalizedData(81:90, 2);
		
	else
		X = vertcat(Data(1:j*10, 8:end), Data(j*10+1:100, 8:end)); 
		testX = Data(j*10+1:j*10+10, 8:end);
		t = vertcat(UnnormalizedData(1:j*10, 2), UnnormalizedData(j*10+1:100, 2)); 
		testT = UnnormalizedData(j*10+1:j*10+10, 2);
		
		
	
	end

    

	PhiTraining = designMatrix(X,'polynomial',2);
	PhiTest = designMatrix(testX,'polynomial',2);
	identityMatrix = eye(size(PhiTraining'*PhiTraining));
	
	for i = 1:length(lambda)
    
		weights = pinv(PhiTraining'*PhiTraining + lambda(i)*identityMatrix)*PhiTraining'*t  ;
        weights = pinv(PhiTraining'*PhiTraining + lambda(i)*identityMatrix)*PhiTraining'*t  ;
		rmsTrainingError(j,i) = sqrt(sum((PhiTraining * weights - t).^2) / length(t));
		rmsTestError(j,i) =  sqrt(sum((PhiTest * weights - testT).^2) / length(testT));
    

	end
end


TrainingErrorAverage= mean(rmsTrainingError);
ValidationErrorAverage= mean(rmsTestError);

semilogx(ValidationErrorAverage);
legend('Average Validation Error');
%semilogx(TrainingErrorAverage);
