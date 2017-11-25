%Script for feature extraction, compression and storing the extracted features in csv files

addpath(genpath('code\third_party\segmentationBerkeley\lib\matlab'));
type='color';
datatype='train';
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
    pb=imresize(pb,[107,160]);
    pb_h(:,i)=reshape(pb,107*160,1);
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/human.csv'),pb_h');

clear pb_h;

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_BG,thetaBG] = pbBG(im);
    pb_BG=imresize(pb_BG,[107,160]);
    pb_h(:,i)=reshape(pb_BG,107*160,1);
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/BG.csv'),pb_h');

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_TG,thetaTG] = pbTG(im,0.02,8,tex);
    pb_TG=imresize(pb_TG,[107,160]);
    pb_h(:,i)=reshape(pb_TG,107*160,1);
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/TG.csv'),pb_h');

 for i=1:length(iids)
     im=imgRead(iids(i),type);
     [pb_CG,thetaCG] = pbCG(im);
    pb_CG=imresize(pb_CG,[107,160]);
    pb_h(:,i)=reshape(pb_CG,107*160,1);
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/CG.csv'),pb_h');
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
    pb_Canny=imresize(pb_Canny,[107,160]);
    pb_h(:,i)=reshape(pb_Canny,107*160,1);
    
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/Canny.csv'),pb_h');

for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_MM] = pb2MM(im);
    pb_MM=imresize(pb_MM,[107,160]);
    pb_h(:,i)=reshape(pb_MM,107*160,1);
    
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/2MM.csv'),pb_h');


for i=1:length(iids)
    im=imgRead(iids(i),type);
    [pb_MM2] = pb2MM2(im);
    pb_MM2=imresize(pb_MM2,[107,160]);
    pb_h(:,i)=reshape(pb_MM2,107*160,1);
    
end;
csvwrite(strcat('compressed/',type,'/',datatype,'/2MM2.csv'),pb_h');






