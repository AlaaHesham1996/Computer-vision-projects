
function image_feats = get_tiny_images(image_paths)

new_size = 16;
no= size(image_paths,1);  % we want to know number of images that we shall resize

image_feats = zeros(no,new_size^2); % every row will contain features of an images , these features are nothing but resized images  


    for i = 1:no
        old_img = imread(char(image_paths(i)));
        resized_img = imresize(old_img, [new_size new_size]);
        image_ = resized_img(:);
        norm = image_ - mean(image_(:)); % to normalize images there are various techniques one of them is to subtract from mean 

        for j = 1:new_size
            image_feats(i,:) = norm;
        end
        
    end
end 




