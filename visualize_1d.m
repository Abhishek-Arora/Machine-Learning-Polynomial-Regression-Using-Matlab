% X is 1-d
% X_train, X_test, t_train, t_test should all be 1-d, and need to be defined as well.
% You should modify y_ev

[Countries, Features, Data] = loadUnicefData();

% Split into training and testing data
t = Data(:,2);
X = Data(:,11);

ntrain = 100;
X_train = X(1:ntrain);
X_test = X(ntrain+1:end);
t_train = t(1:ntrain);
t_test = t(ntrain+1:end);

PhiTraining = designMatrix(X_train,'polynomial',3);
weights = pinv(PhiTraining'*PhiTraining)*PhiTraining'*t_train;

% Plot a curve showing learned function.
%x_ev = (min(X):0.1:max(X))';
%x_ev = X_train;
% TO DO:: Put your regression estimate here.
%y_ev = 100*sin(x_ev);
%y_ev = 0.000064*x_ev.^3;
x_ev = X_train;
y_ev = PhiTraining*weights;
figure;
plot(x_ev,y_ev,'ro');  
hold on;
%legend('Fit');hold on;
plot(X_train,t_train,'g.');hold on;
%legend('Training Data'); hold on;
plot(X_test,t_test,'bo'); hold on;
legend('Curve Fit', 'Training Data', 'Test Data'); hold on;
hold off;
title(sprintf('Fit with degree %d polynomial',3));
% Make the fonts larger, good for reports.
set(findall(gcf,'type','text'),'FontSize',20)
set(findall(gcf,'type','axes'),'FontSize',20)
