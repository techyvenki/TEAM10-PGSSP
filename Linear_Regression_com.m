% This script predics linear model for the training dataset and predicts
% the output for test data sets. The predicted output is stored in csv file
clear all;
BG=csvread('compressed/color/train/BG.csv');BG=reshape(BG',200*17120,1);
CG=csvread('compressed/color/train/CG.csv');CG=reshape(CG',200*17120,1);
TG=csvread('compressed/color/train/TG.csv');TG=reshape(TG',200*17120,1);
Human=csvread('compressed/color/train/Human.csv');Human=reshape(Human',200*17120,1);
    
Human(Human~=0)=1;Human(Human==0)=0;

X=cat(2,BG,CG,TG);
clear BG;clear CG;clear TG;
B = fitlm(X,Human);


BG=csvread('compressed/color/test/BG.csv');BG=reshape(BG',100*17120,1);
CG=csvread('compressed/color/test/CG.csv');CG=reshape(CG',100*17120,1);
TG=csvread('compressed/color/test/TG.csv');TG=reshape(TG',100*17120,1);

Human_test=csvread('compressed/color/test/Human.csv');Human_test=reshape(Human_test',100*17120,1);

X_test=cat(2,BG,CG,TG);
Y_test=predict(B,X_test);
csvwrite('output/LR_com_1.csv',Y_test);

