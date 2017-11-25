clear all;

BG=csvread('color/test/BG.csv');
CG=csvread('color/test/CG.csv');
TG=csvread('color/test/TG.csv');
Canny=csvread('color/test/Canny.csv');
MM2=csvread('color/test/2MM2.csv');
MM=csvread('color/test/2MM.csv');
Human_test=csvread('color/test/Human.csv');
X_test=cat(2,BG,CG,TG);
%clear BG;clear CG;clear TG;
Y_test=kmeans(X_test,2);
Y_test=Y_test-1;
csvwrite(strcat('output/kmeans_us.csv'),Y_test);

for i=1:3
    Y_p=Y_test((i-1)*(321*481)+1:i*(321*481));
    Y_p=reshape(Y_p,321,481);
    H=Human_test((i-1)*(321*481)+1:i*(321*481));
    Y_BG=BG((i-1)*(321*481)+1:i*(321*481));
    Y_CG=CG((i-1)*(321*481)+1:i*(321*481));
    Y_TG=TG((i-1)*(321*481)+1:i*(321*481));
    H=reshape(H,321,481);
    %Y_p=Y_p-1;
    %Y_p(find(Y_p<0.5))=0;
    %Y_p(find(Y_p>=0.5))=1;
    Y_CG=reshape(Y_CG,321,481);
    Y_BG=reshape(Y_BG,321,481);
    Y_TG=reshape(Y_TG,321,481);
    figure
    subplot(2,2,1)
    imshow(1.-Y_p);
    title('Y predicted')
    
    subplot(2,2,2)
    imshow(1.-Y_CG);
    title('CG')
    
    subplot(2,2,3)
    imshow(1.-Y_BG);
    title('BG')
    
    subplot(2,2,4)
    imshow(1.-H);
    title('Human')
end;

