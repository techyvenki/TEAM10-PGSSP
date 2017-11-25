clear all;
load('PR_com.mat');
load('F1_com.mat');
load('PRF_com_2.mat');

BG=csvread('compressed/color/test/BG.csv');BG=reshape(BG',100*17120,1);
CG=csvread('compressed/color/test/CG.csv');CG=reshape(CG',100*17120,1);
TG=csvread('compressed/color/test/TG.csv');TG=reshape(TG',100*17120,1);
Canny=csvread('compressed/color/test/Canny.csv');Canny=reshape(Canny',100*17120,1);
MM2=csvread('compressed/color/test/2MM2.csv');MM2=reshape(MM2',100*17120,1);
MM=csvread('compressed/color/test/2MM.csv');MM=reshape(MM',100*17120,1);
Human_test=csvread('compressed/color/test/Human.csv');Human_test=reshape(Human_test',100*17120,1);
%X_test=cat(2,BG,CG,TG);
Y_test_LR1=csvread('output/LR_com_1.csv');
Y_test_LR=csvread('output/LR_com.csv');
Y_test_ct=csvread('output/ctree_com.csv');
Y_test_K16=csvread('output/kmeans_s_16com.csv');
Y_test_K64=csvread('output/kmeans_s_64com.csv');
Y_test_K128=csvread('output/kmeans_s_128com.csv');




Y_test_nb=csvread('output/nb_com.csv');
%%Calculate Precision Recall
    H=Human_test;
    H(H~=0)=1;H(H==0)=0;
    i=1;
for c=0.05:0.01:0.95
   
    Y_p_LR=Y_test_nb;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_nb(i)=C(2,2)/(C(1,2)+C(2,2));
    re_nb(i)=C(2,2)/(C(2,1)+C(2,2));
    F_nb(i) = 2*pr_nb(i)*re_nb(i)/(pr_nb(i)+re_nb(i));
    
   
    
    i=i+1
    
  
end;
colormap jet;
cmap=colormap;
figure;plot(re_LR1,pr_LR1,'Color',cmap(1,:),'LineWidth',1);hold on;
plot(re_K16,pr_K16,'Color',cmap(54,:),'LineWidth',1);
plot(re_K64,pr_K64,'Color',cmap(54,:),'LineWidth',2);
plot(re_K128,pr_K128,'Color',cmap(54,:),'LineWidth',3);
plot(re_ct,pr_ct,'Color',cmap(10,:),'LineWidth',1);
plot(re_nb,pr_nb,'Color',cmap(18,:),'LineWidth',2);
plot(re_BG,pr_BG,'Color',cmap(23,:),'LineWidth',1);
plot(re_CG,pr_CG,'Color',cmap(26,:),'LineWidth',1);
plot(re_TG,pr_TG,'Color',cmap(32,:),'LineWidth',1);
plot(re_ca,pr_ca,'Color',cmap(38,:),'LineWidth',1);
plot(re_MM,pr_MM,'Color',cmap(44,:),'LineWidth',1);
plot(re_MM2,pr_MM2,'Color',cmap(50,:),'LineWidth',1);
grid on;
title('Precision recall curve')
xlabel('Recall','FontSize',18);
ylabel('Precision','FontSize',18);
legend('LR','KM16','KM64','KM128','CT','NB','BG','CG','TG','Canny','2MM','2MM2');

%save('PRF_com_2.mat','re_ct','pr_ct','F_ct','re_K16','pr_K16','F_K16','re_K64','pr_K64','F_K64','re_K128','pr_K128','F_K128');
c=0.05:0.01:0.95;
figure;plot(c,F_LR1,'Color',cmap(1,:),'LineWidth',1);hold on;
plot(c,F_K16,'Color',cmap(54,:),'LineWidth',1);
plot(c,F_K64,'Color',cmap(54,:),'LineWidth',2);
plot(c,F_K128,'Color',cmap(54,:),'LineWidth',3);
plot(c,F_ct,'Color',cmap(10,:),'LineWidth',1);
plot(c,F_nb,'Color',cmap(18,:),'LineWidth',2);
plot(c,F_BG,'Color',cmap(23,:),'LineWidth',1);
plot(c,F_CG,'Color',cmap(26,:),'LineWidth',1);
plot(c,F_TG,'Color',cmap(32,:),'LineWidth',1);
plot(c,F_ca,'Color',cmap(38,:),'LineWidth',1);
plot(c,F_MM,'Color',cmap(44,:),'LineWidth',1);
plot(c,F_MM2,'Color',cmap(50,:),'LineWidth',1);
grid on;
title('F-Measure')
xlabel('Threshold Value','FontSize',18);
ylabel('F-Measure','FontSize',18);
legend('LR','KM16','KM64','KM128','CT','NB','BG','CG','TG','Canny','2MM','2MM2');


for i=1:3

        
    Y_p_LR1=Y_test_LR1((i-1)*(107*160)+1:i*(107*160));
    Y_p_LR1=reshape(Y_p_LR1,107,160);
    %Y_p_LR=(Y_p_LR-min(min(Y_p_LR)))/(max(max(Y_p_LR))-min(min(Y_p_LR)));
    
    Y_p_ct=Y_test_ct((i-1)*(107*160)+1:i*(107*160));
    Y_p_ct=reshape(Y_p_ct,107,160);
    
    Y_p_nb=Y_test_nb((i-1)*(107*160)+1:i*(107*160));
    Y_p_nb=reshape(Y_p_nb,107,160);
    
    Y_p_K16=Y_test_K16((i-1)*(107*160)+1:i*(107*160));
    Y_p_K16=reshape(Y_p_K16,107,160);
    
    Y_p_K64=Y_test_K64((i-1)*(107*160)+1:i*(107*160));
    Y_p_K64=reshape(Y_p_K64,107,160);
    
    Y_p_K128=Y_test_K128((i-1)*(107*160)+1:i*(107*160));
    Y_p_K128=reshape(Y_p_K128,107,160);
    
    H=Human_test((i-1)*(107*160)+1:i*(107*160));
    Y_BG=BG((i-1)*(107*160)+1:i*(107*160));
    Y_CG=CG((i-1)*(107*160)+1:i*(107*160));
    Y_TG=TG((i-1)*(107*160)+1:i*(107*160));
    Y_Canny=Canny((i-1)*(107*160)+1:i*(107*160));
    Y_MM=MM((i-1)*(107*160)+1:i*(107*160));
    Y_MM2=MM2((i-1)*(107*160)+1:i*(107*160));
    H=reshape(H,107,160);

    %Y_p(find(Y_p<0.5))=0;
    %Y_p(find(Y_p>=0.5))=1;
    Y_CG=reshape(Y_CG,107,160);
    Y_BG=reshape(Y_BG,107,160);
    Y_TG=reshape(Y_TG,107,160);
    Y_Canny=reshape(Y_Canny,107,160);
    Y_MM=reshape(Y_MM,107,160);
    Y_MM2=reshape(Y_MM2,107,160);
    figure
    subplot(2,2,1)
    imshow(1.-Y_TG);
    title('TG')
    
    subplot(2,2,2)
    imshow(1.-Y_CG);
    title('CG')
    
    subplot(2,2,3)
    imshow(1.-Y_BG);
    title('BG')
    
    subplot(2,2,4)
    imshow(1.-H);
    title('Human')
    
    figure
    subplot(2,2,1)
    imshow(1.-Y_Canny);
    title('Canny')
    
    subplot(2,2,2)
    imshow(1.-Y_MM);
    title('MM')
    
    subplot(2,2,3)
    imshow(1.-Y_MM2);
    title('MM2')
    
    subplot(2,2,4)
    imshow(1.-H);
    title('Human')
    
    figure
    subplot(2,2,1)
    imshow(1.-Y_p_K16);
    title('Kmeans-16bins')
    
    subplot(2,2,2)
    imshow(1.-Y_p_K64);
    title('Kmeans-64bins')
    
    subplot(2,2,3)
    imshow(1.-Y_p_K128);
    title('Kmeans-128bins')
    
    subplot(2,2,4)
    imshow(1.-H);
    title('Human')

    figure
    subplot(2,2,1)
    imshow(1.-Y_p_LR1);
    title('Linear Regression')
    
    subplot(2,2,2)
    imshow(1.-Y_p_ct);
    title('Classification Tree')
    
    subplot(2,2,3)
    imshow(1.-Y_p_nb);
    title('NB')
    
    subplot(2,2,4)
    imshow(1.-H);
    title('Human')
    
end;
