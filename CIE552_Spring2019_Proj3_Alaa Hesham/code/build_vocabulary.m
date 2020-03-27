% Starter code prepared by James Hays for Computer Vision

%This function will sample SIFT descriptors from the training images,
%cluster them with kmeans, and then return the cluster centers.

function vocab = build_vocabulary( image_paths, vocab_size )

n_img_samples = 0;
N = size(image_paths,1);
if n_img_samples <= 0
    n_img_samples = N;  % here Iam taking all_the_images , you can choose other wise by changing n_img_samples
    img_index = 1:N;  % image index 
else
      img_index = randi([1 N],1,n_img_samples); % will be excuted if you choose to sample them 
end

%%%%%%%%% Number of samples from each image
no_features = 100; % number of features for image 

loc = zeros(2,N);
sift_features = zeros(128,N);

%Iterate through all the images for training
for i = 1:n_img_samples
    
    %retrieve image and convert to double
    img = imread(char(image_paths{img_index(i),1}));
    img = im2double(img);
 
    %Get SIFT features and their locations from i-th image
    [loc, sift_features] = vl_dsift(single(img),'fast', 'Step', 5);
    
    noOfFeats = size(sift_features,2);
 
    if no_features <= 0
        no_features = noOfFeats;
        featIndices = [1:noOfFeats];
    else
        no_features = min(no_features,noOfFeats); 
        %Indices of features to be sampled
        featIndices = randi([1 noOfFeats],1,no_features);
        randLocations= loc(:,featIndices);
    end

    X(:,(i-1)*no_features+1:i*no_features) = double(sift_features(:,featIndices));
    
end


[centers, assignments] = vl_kmeans(X, vocab_size);
%centers = d x K matrix of cluster centroids
%d = #of dimensions
%vocab is vocab size x 128
vocab = centers';
end
