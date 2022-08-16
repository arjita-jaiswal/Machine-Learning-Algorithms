clc();
clear;
train_data = table2cell(readtable('breast-cancer_train.txt'));
[n,m] = size(train_data);
class1 = [];
class2 = [];
for i=1:n
    if strcmp( train_data(i,1),'no-recurrence-events' ) == 0
        class1 = [class1;train_data(i,1:end)];
    else
        class2 = [class2;train_data(i,1:end)];
    end
end
[class1n,class1m] = size(class1);
[class2n,class2m] = size(class2);
class1;
class2;
test_train_data=table2cell(readtable('breast-cancer_test_train_data.txt'));
[z,w] = size(test_train_data);
y1 = class1n/n;
y2 = class2n/n;

counter = 0;
for i=1:z
    row = test_train_data(i,:);
    prob1 = 1;
    prob2 = 1;
    for j=2:10
        class1p =0;
        class2p =0;
        
        for k=1:class1n
            if strcmp(row(j), class1(k,j)) == 0
                class1p = class1p+1;
            end
        end
        
        for k=1:class2n
            if strcmp(row(j), class2(k,j)) == 0
                class2p = class2p+1;
            end
        end
        
        class1p = class1p/class1n;
        class2p = class2p/class2n;
        prob1 = prob1*class1p;
        prob2 = prob2*class2p;
    end
    prob1 = prob1*y1;
    prob2 = prob2*y2;
    %if in rec event and class 1 is greater then countr increase that it is in class 1
    %if in non rec event and class 2 is greater then counter increase it is in class 2
    %if same probablity 1 and probablity 2 then it can be in any so increase counter that it is correct
    if prob1 > prob2 && strcmp(row(1), 'recurrence-events') == 0
        counter = counter+1;
    elseif prob2 > prob1 && strcmp(row(1),'no-recurrence-events')==0
        counter = counter+1;
    elseif prob1 == prob2
        counter = counter + 1;
    end
         
end
disp(100*counter/z)

                
                    
    