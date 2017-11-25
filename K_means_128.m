clear all;
nbins=64;

BG=csvread('color/train/BG.csv');
CG=csvread('color/train/CG.csv');
TG=csvread('color/train/TG.csv');
X_test=cat(2,BG,CG,TG);
%clear BG;clear CG;clear TG;
Y_test=kmeans(X_test,nbins,'Options','TolFun');
Y_test=(Y_test-1)/(nbins-1);
csvwrite(strcat('output/kmeans_us_',nbins,'.csv'),Y_test);
