clear all;
BG=csvread('color/train/BG.csv');
CG=csvread('color/train/CG.csv');
TG=csvread('color/train/TG.csv');
Human=csvread('color/train/Human.csv');
X=cat(2,BG,CG,TG);
clear BG;clear CG;clear TG;
B = fitlm(X,Human);


BG=csvread('color/test/BG.csv');
CG=csvread('color/test/CG.csv');
TG=csvread('color/test/TG.csv');
Canny=csvread('color/test/Canny.csv');
MM2=csvread('color/test/2MM2.csv');
MM=csvread('color/test/2MM.csv');
Human_test=csvread('color/test/Human.csv');
X_test=cat(2,BG,CG,TG);
Y_test=predict(B,X_test);
csvwrite('output/LR_com.csv',Y_test);

