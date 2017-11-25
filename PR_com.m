clear all;

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

for i=1:2

        
    Y_p_LR=Y_test_LR((i-1)*(107*160)+1:i*(107*160));
    Y_p_LR=reshape(Y_p_LR,107,160);
    Y_p_LR=(Y_p_LR-min(min(Y_p_LR)))/(max(max(Y_p_LR))-min(min(Y_p_LR)));
    
    H=Human_test((i-1)*(107*160)+1:i*(107*160));
    Y_BG=BG((i-1)*(107*160)+1:i*(107*160));
    Y_CG=CG((i-1)*(107*160)+1:i*(107*160));
    Y_TG=TG((i-1)*(107*160)+1:i*(107*160));
    H=reshape(H,107,160);

    %Y_p(find(Y_p<0.5))=0;
    %Y_p(find(Y_p>=0.5))=1;
    Y_CG=reshape(Y_CG,107,160);
    Y_BG=reshape(Y_BG,107,160);
    Y_TG=reshape(Y_TG,107,160);
    figure
    subplot(2,3,1)
    imshow(1.-Y_p_LR);
    title('LR')
    
    subplot(2,3,2)
    imshow(1.-Y_CG);
    title('CG')
    
    subplot(2,3,3)
    imshow(1.-Y_BG);
    title('BG')
    
    subplot(2,3,4)
    imshow(1.-H);
    title('Human')
    

end;


%%Calculate Precision Recall
    H=Human_test;
    H(H~=0)=1;H(H==0)=0;
    i=1;
for c=0.05:0.01:0.95
    Y_p_LR=Y_test_LR;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_LR(i)=C(2,2)/(C(1,2)+C(2,2));
    re_LR(i)=C(2,2)/(C(2,1)+C(2,2));
    F_LR(i) = 2*pr_LR(i)*re_LR(i)/(pr_LR(i)+re_LR(i));
  
    Y_p_LR=Y_test_LR1;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_LR1(i)=C(2,2)/(C(1,2)+C(2,2));
    re_LR1(i)=C(2,2)/(C(2,1)+C(2,2));
    F_LR1(i) = 2*pr_LR1(i)*re_LR1(i)/(pr_LR1(i)+re_LR1(i));

    Y_p_LR=BG;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_BG(i)=C(2,2)/(C(1,2)+C(2,2));
    re_BG(i)=C(2,2)/(C(2,1)+C(2,2));
    F_BG(i) = 2*pr_BG(i)*re_BG(i)/(pr_BG(i)+re_BG(i));
    
    Y_p_LR=CG;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_CG(i)=C(2,2)/(C(1,2)+C(2,2));
    re_CG(i)=C(2,2)/(C(2,1)+C(2,2));
    F_CG(i) = 2*pr_CG(i)*re_CG(i)/(pr_CG(i)+re_CG(i));
    
    Y_p_LR=TG;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_TG(i)=C(2,2)/(C(1,2)+C(2,2));
    re_TG(i)=C(2,2)/(C(2,1)+C(2,2));
    F_TG(i) = 2*pr_TG(i)*re_TG(i)/(pr_TG(i)+re_TG(i));

    Y_p_LR=Canny;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_ca(i)=C(2,2)/(C(1,2)+C(2,2));
    re_ca(i)=C(2,2)/(C(2,1)+C(2,2));
    F_ca(i) = 2*pr_ca(i)*re_ca(i)/(pr_ca(i)+re_ca(i));
    
    Y_p_LR=MM;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_MM(i)=C(2,2)/(C(1,2)+C(2,2));
    re_MM(i)=C(2,2)/(C(2,1)+C(2,2));
    F_MM(i) = 2*pr_MM(i)*re_MM(i)/(pr_MM(i)+re_MM(i));
 
    Y_p_LR=MM2;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_MM2(i)=C(2,2)/(C(1,2)+C(2,2));
    re_MM2(i)=C(2,2)/(C(2,1)+C(2,2));
    F_MM2(i) = 2*pr_MM2(i)*re_MM2(i)/(pr_MM2(i)+re_MM2(i));
    
    
    i=i+1;
    
    
end;
colormap jet;
cmap=colormap;
figure;plot(re_LR,pr_LR,'Color',cmap(1,:),'LineWidth',1);hold on;
%plot(re_KM,pr_KM,'Color',cmap(64,:),'LineWidth',6);
plot(re_LR1,pr_LR1,'Color',cmap(14,:),'LineWidth',2);
plot(re_BG,pr_BG,'Color',cmap(20,:),'LineWidth',1);
plot(re_CG,pr_CG,'Color',cmap(26,:),'LineWidth',1);
plot(re_TG,pr_TG,'Color',cmap(32,:),'LineWidth',1);
plot(re_ca,pr_ca,'Color',cmap(38,:),'LineWidth',1);
plot(re_MM,pr_MM,'Color',cmap(44,:),'LineWidth',1);
plot(re_MM2,pr_MM2,'Color',cmap(50,:),'LineWidth',1);
grid on;
title('Precision recall curve')
xlabel('Recall','FontSize',18);
ylabel('Precision','FontSize',18);
legend('LR','LR1','BG','CG','TG','Canny','2MM','2MM2');
save('PR_com.mat','re_LR','pr_LR','re_LR1','pr_LR1','re_BG','pr_BG','re_CG','pr_CG','re_TG','pr_TG','re_ca','pr_ca','re_MM','pr_MM','re_MM2','pr_MM2');
save('F1_com.mat','F_LR','F_LR1','F_BG','F_CG','F_TG','F_ca','F_MM','F_MM2');
c=0.05:0.01:0.95;
figure;plot(c,F_LR,'Color',cmap(1,:),'LineWidth',1);hold on;
%plot(re_KM,pr_KM,'Color',cmap(64,:),'LineWidth',6);
plot(c,F_LR1,'Color',cmap(14,:),'LineWidth',2);
plot(c,F_BG,'Color',cmap(20,:),'LineWidth',1);
plot(c,F_CG,'Color',cmap(26,:),'LineWidth',1);
plot(c,F_TG,'Color',cmap(32,:),'LineWidth',1);
plot(c,F_ca,'Color',cmap(38,:),'LineWidth',1);
plot(c,F_MM,'Color',cmap(44,:),'LineWidth',1);
plot(c,F_MM2,'Color',cmap(50,:),'LineWidth',1);
grid on;
title('F-Measure')
xlabel('Threshold Value','FontSize',18);
ylabel('F-Measure','FontSize',18);
legend('LR','LR1','BG','CG','TG','Canny','2MM','2MM2');