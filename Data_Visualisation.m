%% This script is for visualising the dataset and the extracted features for a sigle training image.

addpath(genpath('F:\Aarathi\IIIT\SMIA\project\code\third_party\segmentationBerkeley\lib\matlab'));

[iids] = imgList('train');
im = imgRead(iids(1),'color');

[segs,uids] = readSegs('color',iids(1));
imshow(segs{6}/max(max(segs{6})));

pb_h=pbHuman('color',iids(1));
imshow(pb_h)


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


[pb_BG,thetaBG] = pbBG(im);
[pb_TG,thetaTG] = pbTG(im,0.02,8,tex);
[pb_CG,thetaCG] = pbCG(im);
[pb_CGTG,thetaCGTG] = pbCGTG(im,[0.01 0.02 0.02 0.02],8,tex);
[pb_Canny] = pbCanny(im);
[pb_MM] = pb2MM(im);
[pb_MM2] = pb2MM2(im);

figure
subplot(2,2,1)       
[im2] = pboverlay(im,pb_h);
imshow(im2);
title('Human Marked')

subplot(2,2,2)       
[im2] = pboverlay(im,pb_Canny);
imshow(im2);
title('Canny Detecter')

subplot(2,2,3)       
[im2] = pboverlay(im,pb_MM);
imshow(im2);
title('2MM')

subplot(2,2,4)       
[im2] = pboverlay(im,pb_MM2);
imshow(im2);
title('2MM2')

figure

subplot(2,2,1)       
[im2] = pboverlay(im,pb_CG);
imshow(im2);
title('CG')

subplot(2,2,2)       
[im2] = pboverlay(im,pb_BG);
imshow(im2);
title('BG')


subplot(2,2,3)       
[im2] = pboverlay(im,pb_TG);
imshow(im2);
title('TG')


subplot(2,2,4)       
[im2] = pboverlay(im,pb_CGTG);
imshow(im2);
title('CGTG')