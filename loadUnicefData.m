function [Countries, Features, Data] = loadUnicefData()
% Load child mortality data.
% Original source http://www.unicef.org/sowc2013/statistics.html
% Reads csv version of data.
% First row of csv data is feature names
% Each subsequent row is country name followed by values.
%
% Output:
%  Countries: K-by-1 cell array of country names
%  Features: D-by-1 cell array of names of features
%  Data: K-by-D matrix of values for each feature for each country

FNAME = 'SOWC_combined_simple.csv';
NCOLUMNS = 41;

% Open and read the file as cell array of strings.
fp = fopen(FNAME);
C = textscan(fp, '%s','Delimiter',',');
fclose(fp);

% Extract feature names and rest of data.
Features = C{1}(2:NCOLUMNS);
Data = C{1}(NCOLUMNS+1:end);
D = reshape(Data,NCOLUMNS,[]);

Countries = D(1,:)';
Xcell = D(2:end,:);
Data = str2double(Xcell);

% Note that str2double returns NaN if the input was not a valid scalar.
% E.g., some values in original data are '_', unknown.
% Handle this by replacing all NaN values with the median of valid entries.
for f_i=1:size(Data,1)
  nans = find(isnan(Data(f_i,:)));
  not_nans = setdiff(1:size(Data,2),nans);

  med_value = median(Data(f_i,not_nans));

  Data(f_i,nans) = med_value;
end
Data = Data';
