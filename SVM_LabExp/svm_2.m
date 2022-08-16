
%%%% SVM Implementation: Question 2 %%%%
clc();
%% Train SVM
data=csvread('Training data.csv',1,0);
data(:,1:end-1)=zscore(data(:,1:end-1));
% [n m] = size(data);

x = data(:,1:end-1);
y = data(:,end);

%% obtaining support vectors and corresponding alpha and y values using SMO
[alpha,x,y] = smo(x,y);
    
%% Calculate weight vector W and bias
W = sum(transpose(dot(alpha,y))*x)
B = y-transpose(W*transpose(x));
b = 1/n*sum(B)
% Support Vectors
fprintf('Number of support Vectors : %d',length(alpha))



%% Test the SVM and display Accuracy and F1 Score
data=csvread('Testing data.csv',1,0);
data(:,1:end-1)=zscore(data(:,1:end-1));
% [tn tm] = size(data)
% fprintf("\nTestSize: ",tn,tm);

x = data(:,1:end-1);
y = data(:,end);
[n m] = size(x);
y_p=  W*transpose(x) + b; % y_p contains predicted values of output
for i=1:n
    if( y_p(1,i)>0 )
        y_p(1,i) = 1;
    else
        y_p(1,i) = -1;
    end
end
y_p = transpose(y_p);

% Accuracy and F-measure
[cm, Accuracy, F1_score ] = confusionMatrix( y,y_p )



%% combine train and test data
train = csvread('Training data.csv',1,0);
train(:,1:end-1) = zscore(train(:,1:end-1));
test = csvread('Testing data.csv',1,0);
test(:,1:end-1) = zscore(test(:,1:end-1));
data = [train;test];
[n m] = size(data);

% 80% in train and 20% in test
P = 0.80;
idx = randperm(n);
t_idx = idx(1:round(P*n));
t_idx2 = idx(round(P*n)+1:end);
train = data(t_idx,:);
test = data(t_idx2,:);

train_x = train(:,1:end-1);
train_y = train(:,end);
test_x = test(:,1:end-1);
test_y = test(:,end);
% get alpha
[alpha,x,y] = smo(train_x,train_y);

W = sum(transpose(dot(alpha,y))*x)
B = y-transpose(W*transpose(x));
b = 1/n*sum(B)
% Support Vectors
fprintf('Number of support Vectors : %d',length(alpha))

x = test_x;
y = test_y;
[n m] = size(test);
y_p=  W*transpose(x) + b; % y_p contains predicted values of output
for i=1:n
    if( y_p(1,i)>0 )
        y_p(1,i) = 1;
    else
        y_p(1,i) = -1;
    end
end
y_p = transpose(y_p);

% Accuracy and F-measure
[cm, Accuracy, F1_score ] = confusionMatrix( y,y_p )

