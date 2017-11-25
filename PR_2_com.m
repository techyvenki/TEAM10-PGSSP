clear all;
load('PR_com.mat');
load('F1_com.mat');
%load('PR_F_KM16.mat');

Human_test=csvread('compressed/color/test/Human.csv');
Human_test=reshape(Human_test',100*17120,1);

%X_test=cat(2,BG,CG,TG);

Y_test_ct=csvread('output/ctree_com.csv');
Y_test_K16=csvread('output/kmeans_s_16com.csv');
Y_test_K64=csvread('output/kmeans_s_64com.csv');
Y_test_K128=csvread('output/kmeans_s_128com.csv');
%Y_test_svm=csvread('output/svm_com.csv');
%%Calculate Precision Recall
    H=Human_test;
    H(H~=0)=1;H(H==0)=0;
    i=1;
for c=0.05:0.01:0.95
   
    Y_p_LR=Y_test_ct;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_ct(i)=C(2,2)/(C(1,2)+C(2,2));
    re_ct(i)=C(2,2)/(C(2,1)+C(2,2));
    F_ct(i) = 2*pr_ct(i)*re_ct(i)/(pr_ct(i)+re_ct(i));
    
    Y_p_LR=Y_test_K16;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_K16(i)=C(2,2)/(C(1,2)+C(2,2));
    re_K16(i)=C(2,2)/(C(2,1)+C(2,2));
    F_K16(i) = 2*pr_K16(i)*re_K16(i)/(pr_K16(i)+re_K16(i));
    
    Y_p_LR=Y_test_K64;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_K64(i)=C(2,2)/(C(1,2)+C(2,2));
    re_K64(i)=C(2,2)/(C(2,1)+C(2,2));
    F_K64(i) = 2*pr_K64(i)*re_K64(i)/(pr_K64(i)+re_K64(i));
    
    Y_p_LR=Y_test_K128;
    Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
    C = confusionmat(H,Y_p_LR);
    pr_K128(i)=C(2,2)/(C(1,2)+C(2,2));
    re_K128(i)=C(2,2)/(C(2,1)+C(2,2));
    F_K128(i) = 2*pr_K128(i)*re_K128(i)/(pr_K128(i)+re_K128(i));
    

    
%     Y_p_LR=Y_test_svm;
%     Y_p_LR(Y_p_LR>=c)=1;Y_p_LR(Y_p_LR<c)=0;
%     C = confusionmat(H,Y_p_LR);
%     pr_svm(i)=C(2,2)/(C(1,2)+C(2,2));
%     re_svm(i)=C(2,2)/(C(2,1)+C(2,2));
%     F_svm(i) = 2*pr_ct(i)*re_ct(i)/(pr_ct(i)+re_ct(i));
%     

    
    
    i=i+1
    
  
end;
colormap jet;
cmap=colormap;
figure;plot(re_LR1,pr_LR1,'Color',cmap(1,:),'LineWidth',1);hold on;
plot(re_K16,pr_K16,'Color',cmap(54,:),'LineWidth',1);
plot(re_K64,pr_K64,'Color',cmap(54,:),'LineWidth',2);
plot(re_K128,pr_K128,'Color',cmap(54,:),'LineWidth',3);
plot(re_ct,pr_ct,'Color',cmap(10,:),'LineWidth',1);
%plot(re_svm,pr_svm,'Color',cmap(18,:),'LineWidth',1);
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
legend('LR','KM16','KM64','KM128','CT','BG','CG','TG','Canny','2MM','2MM2');

save('PRF_com_2.mat','re_ct','pr_ct','F_ct','re_K16','pr_K16','F_K16','re_K64','pr_K64','F_K64','re_K128','pr_K128','F_K128');
c=0.05:0.01:0.95;
figure;plot(c,F_LR1,'Color',cmap(1,:),'LineWidth',1);hold on;
plot(c,F_K16,'Color',cmap(54,:),'LineWidth',1);
plot(c,F_K64,'Color',cmap(54,:),'LineWidth',2);
plot(c,F_K128,'Color',cmap(54,:),'LineWidth',3);
plot(c,F_ct,'Color',cmap(10,:),'LineWidth',1);
%plot(c,F_svm,'Color',cmap(18,:),'LineWidth',1);
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
legend('LR','KM16','KM64','KM128','CT','BG','CG','TG','Canny','2MM','2MM2');
