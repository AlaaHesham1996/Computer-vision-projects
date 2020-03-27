% Starter code prepared by James Hays for Computer Vision

%This feature representation is described in the handout, lecture
%materials, and Szeliski chapter 14.

function image_feats = get_bags_of_words(image_paths)


load('vocab.mat')
n_clusters = size(vocab, 1);

noOfFeat = 0;

%number of entries in each image histogram
vocab_size = size(vocab, 2);

%Number of images
n_images = size(image_paths,1);

%initialise result
image_feats = zeros(n_images,n_clusters);

fprintf('Processing images (of %d): ',n_images);

t1 = cputime;
%processing each image
for i = 1:n_images
    
    if mod(i,100)==0
        fprintf('%d, Time Taken: %d\n',i, cputime - t1);
        t1 = cputime;
    end
    
    %read each line of image
    img = imread(char(image_paths(i)));
    %Get SIFT features and their locations from i-th image
    [locations, SIFT_features] = vl_dsift(single(img),'fast', 'Step', 5);
    
    noOfFeat = size(SIFT_features,2);
    
%     startTime = cputime;
    %compare each feature
    for j = 1:noOfFeat
        
        dist = zeros(1,n_clusters);
        
        currentfeat = double(SIFT_features(:,j));
        %measure distance between feature from each cluster center
        for k=1:n_clusters
            current_cluster = vocab(k,:);
            dist(k) = vl_alldist2(currentfeat,current_cluster');
        end
           
        %get closest cluster center matched
        [minVal, ind] = min(dist);
        
        
        image_feats(i,ind) = image_feats(i,ind) + 1;
    end

    %%
        
    % normalise histogram  
    maxfeature_value = max(image_feats(i,:));
    image_feats(i,:) = image_feats(i,:)/maxfeature_value;
    
end
fprintf('\n bag of words using sift  has been calculated \n');

end

