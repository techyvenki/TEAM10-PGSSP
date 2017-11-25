
%Script for feature extraction and storing the extracted features in csv
%files
addpath(genpath('F:\Aarathi\IIIT\SMIA\project\code\third_party\segmentationBerkeley\lib\matlab'));
type='gray';
datatype='test';
[iids] = imgList(datatype);


% Compute Texture Gradiant
no = 6;
ss = 1;
ns = 2;
sc = sqrt(2);
el = 2;
k = 64;
fname = sprintf( ...
    'unitex_%.2g_%.2g_%.2g_%.2g_%.2g_%d.mat',no,ss,ns,sc,el,k);
load(fname); % defines fb,tex,tsim

for i=1:length(iids)
    pb=pbHuman(type,iids(i));
    pb_h(:,i)=reshape(pb,321*481,1);
end;
csvwrite(strcat(type,'/',datatype,'/human.csv'),pb_h');

clear pb_h;

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_BG,thetaBG] = pbBG(im);
    pb_h(:,i)=reshape(pb_BG,321*481,1);
end;
csvwrite(strcat(type,'/',datatype,'/BG.csv'),pb_h');

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_TG,thetaTG] = pbTG(im,0.02,8,tex);
    pb_h(:,i)=reshape(pb_TG,321*481,1);
end;
csvwrite(strcat(type,'/',datatype,'/TG.csv'),pb_h');

% for i=1:length(iids)
%     im=imgRead(iids(i),type);
%     [pb_CG,thetaCG] = pbCG(im);
%     pb_h(:,i)=reshape(pb_CG,321*481,1);
% end;
% csvwrite(strcat(type,'/',datatype,'/CG.csv'),pb_h');
% 
% for i=1:length(iids)
%     im=imgRead(iids(i),type);
%     [pb_CGTG,thetaCGTG] = pbCGTG(im,[0.01 0.02 0.02 0.02],8,tex);
%     pb_h(:,i)=reshape(pb_CGTG,321*481,1);
% end;
% csvwrite(strcat(type,'/',datatype,'/CGTG.csv'),pb_h');

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_Canny] = pbCanny(im);
    pb_h(:,i)=reshape(pb_Canny,321*481,1);
end;
csvwrite(strcat(type,'/',datatype,'/Canny.csv'),pb_h');

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_MM] = pb2MM(im);
    pb_h(:,i)=reshape(pb_MM,321*481,1);
end;
csvwrite(strcat(type,'/',datatype,'/2MM.csv'),pb_h');


for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_MM2] = pb2MM2(im);
    pb_h(:,i)=reshape(pb_MM2,321*481,1);
end;
csvwrite(strcat(type,'/',datatype,'/2MM2.csv'),pb_h');






