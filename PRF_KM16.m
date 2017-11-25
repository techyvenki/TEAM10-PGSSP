clear all;
load('PR.mat');
load('F1.mat');


Human_test=csvread('color/test/Human.csv');
%X_test=cat(2,BG,CG,TG);
Y_test_KM=csvread('output/kmeans_us_16.csv');

%%Calculate Precision Recall
    H=Human_test;
    H(H~=0)=1;H(H==0)=0;
    i=1;
for c=0.05:0.01:0.95
   
    Y_p_LR=Y_test_KM;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_KM_16(i)=C(2,2)/(C(1,2)+C(2,2));
    re_KM_16(i)=C(2,2)/(C(2,1)+C(2,2));
    F_KM_16(i) = 2*pr_KM_16(i)*re_KM_16(i)/(pr_KM_16(i)+re_KM_16(i));
    
    i=i+1;
    
  
end;
colormap jet;
cmap=colormap;
figure;plot(re_LR,pr_LR,'Color',cmap(1,:),'LineWidth',1);hold on;
plot(re_KM_16,pr_KM_16,'Color',cmap(64,:),'LineWidth',1);
%plot(re_LR,pr_LR,'Color',cmap(14,:));
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
legend('LR','KM_16','BG','CG','TG','Canny','2MM','2MM2');
save('PR_F_KM16.mat','re_KM_16','pr_KM_16','F_KM_16');
%save('F1.mat','F_LR','F_KM','F_BG','F_CG','F_TG','F_ca','F_MM','F_MM2');
c=0.05:0.01:0.95;
figure;plot(c,F_LR,'Color',cmap(1,:),'LineWidth',1);hold on;
plot(c,F_KM_16,'Color',cmap(64,:),'LineWidth',2);
%plot(re_LR,pr_LR,'Color',cmap(14,:));
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
legend('LR','KM16','BG','CG','TG','Canny','2MM','2MM2');