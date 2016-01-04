 function Phi = designMatrix(X,basis,varargin)
% Phi = designMatrix(X,basis)
% Phi = designMatrix(X,'polynomial',degree)
% Phi = designMatrix(X,'sigmoid',Mu,s)
%
% Compute the design matrix for input data X
% X is n-by-d
% Mu is k-by-1

if strcmp(basis,'polynomial')
  k = varargin{1};
  % TO DO:: Fill in
  %Phi = X.^k;
  printX = X;
  
  bias = ones(size(X,1), 1);
  
  
   if k==1
      Phi = [bias X];
   else
       Phi = [bias X];       
       for i = 2:k
           Phi = horzcat(Phi, X.^i);     %Creating the Phi depending on the
                                         %the value of k(=degree).
       end
       
   end
  
elseif strcmp(basis,'sigmoid')
  Mu1 = varargin{1};
  Mu2 = varargin{2};
  s = varargin{3};
  % TO DO:: Fill in
  %Phi = 1 ./ (1 + exp((Mu-X)./s));
  %Phi = sigmf(X,[Mu s]);
  % Phi updated as per Prof Mori's comments. Both the sigmoid functions
  % should be used to create the Phi.
  bias = ones(length(X), 1);
  Phi = [bias 1 ./ (1 + exp((Mu1-X)./s)) 1 ./ (1 + exp((Mu2-X)./s))];
else
  error('Unknown basis type');
end
