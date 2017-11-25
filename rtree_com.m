clear all;
BG=csvread('compressed/color/train/BG.csv');BG=reshape(BG',200*17120,1);
CG=csvread('compressed/color/train/CG.csv');CG=reshape(CG',200*17120,1);
TG=csvread('compressed/color/train/TG.csv');TG=reshape(TG',200*17120,1);
Human=csvread('compressed/color/train/Human.csv');Human=reshape(Human',200*17120,1);
Human(Human~=0)=1;Human(Human==0)=0;
X=cat(2,BG,CG,TG);
clear BG;clear CG;clear TG;
B = fitctree(X,Human);
%view(B,'mode','graph');
m = max(B.PruneList);
B1=prune(B,'Level',m/2);


BG=csvread('compressed/color/test/BG.csv');BG=reshape(BG',100*17120,1);
CG=csvread('compressed/color/test/CG.csv');CG=reshape(CG',100*17120,1);
TG=csvread('compressed/color/test/TG.csv');TG=reshape(TG',100*17120,1);

X_test=cat(2,BG,CG,TG);
Y_test=predict(B1,X_test);
csvwrite('output/ctree_com.csv',Y_test);
%view(B1,'mode','graph')

