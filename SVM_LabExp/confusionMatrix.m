function [cm, acc, f1 ] = confusionMatrix( y_actual,y_predicted )
%%% input arguments are actual output (y_actual) and predicted output (y_predicted)
%%% This function returns confusion matrix (cm), accuracy (acc), and F1 score (f1)
[n m] = size(y_actual);
conf_matrix = zeros(2,2);
for i=1:n
    label = y_actual(i);
    if label==-1
        label = 1;
    else
        label = 2;
    end
    
    if y_predicted(i) == 1
        conf_matrix(1,label) = conf_matrix(1,label) +1;
    else
        conf_matrix(2,label) = conf_matrix(2,label) +1;
    end
end
conf_matrix;
%calculate Accuracy
tp = max(conf_matrix(1,:));
tn = max(conf_matrix(2,:));
fp = min(conf_matrix(1,:));
fn = min(conf_matrix(2,:));
acc =100*( tp+tn )/sum(conf_matrix(:));
cm = conf_matrix;
recall = tp/(tp+fn);
prec = tp/(tp+fp);
f1 = 1/((1/recall + 1/prec)/2);

end

