clc 
test_image = im2single(imread('../data/cat.bmp'));
test_image = imresize(test_image, 0.7, 'bilinear');
test_image2 = im2single(imread('../data/dog.bmp'));
test_image2 = imresize(test_image2, 0.7, 'bilinear');

output=gen_hybrid_image( test_image2, test_image,7);
figure (1)
imshow(output)
vis_out=vis_hybrid_image(output);
figure(2)
imshow(vis_out)
%%%%%%%%%%%%%%%=========second pair===========%%%%%%%%%%
test_image3 = im2single(imread('../data/bird.bmp'));
test_image3 = imresize(test_image3, 0.7, 'bilinear');
test_image4 = im2single(imread('../data/plane.bmp'));
test_image4 = imresize(test_image4, 0.7, 'bilinear');

output2=gen_hybrid_image( test_image4, test_image3,6);
figure(3)
imshow(output2);
vis_out2=vis_hybrid_image(output2);
figure(4)
imshow(vis_out2)
%%%%%%%%%%%%%%%%%======third pair===========%%%%%%%%%%
test_image5 = im2single(imread('../data/bicycle.bmp'));
%test_image5 = imresize(test_image5, 0.7, 'bilinear');
test_image6 = im2single(imread('../data/motorcycle.bmp'));
%test_image6 = imresize(test_image6, 0.7, 'bilinear');

output3=gen_hybrid_image( test_image5, test_image6,8);
figure(5)
imshow(output3);
vis_out3=vis_hybrid_image(output3);
figure(6)
imshow(vis_out3)
%%%%%=============forth pair=======%%%%%%
test_image7 = im2single(imread('../data/fish.bmp'));
test_image8 = im2single(imread('../data/submarine.bmp'));

output4=gen_hybrid_image( test_image7, test_image8,4);
figure(7)
imshow(output4);
vis_out4=vis_hybrid_image(output4);
figure(8)
imshow(vis_out4)


