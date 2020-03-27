% Starter code prepared by James Hays for Computer Vision

%This function will train a linear SVM for every category (i.e. one vs all)
%and then use the learned linear classifiers to predict the category of
%every test image. Every test feature will be evaluated with all 15 SVMs
%and the most confident SVM will "win". Confidence, or distance from the
%margin, is W*X + B where '*' is the inner product or dot product and W and
%B are the learned hyperplane parameters.

function predicted_categories = svm_classify(train_image_feats, train_labels, test_image_feats)
% image_feats is an N x d matrix, where d is the dimensionality of the
%  feature representation.
% train_labels is an N x 1 cell array, where each entry is a string
%  indicating the ground truth category for each training image.
% test_image_feats is an M x d matrix, where d is the dimensionality of the
%  feature representation. You can assume M = N unless you've modified the
%  starter code.
% predicted_categories is an M x 1 cell array, where each entry is a string
%  indicating the predicted category for each test image.

%{
Useful functions:
 matching_indices = strcmp(string, cell_array_of_strings)
 
  This can tell you which indices in train_labels match a particular
  category. This is useful for creating the binary labels for each SVM
  training task.



%}

LAMBDA = 0.000008;

%unique() is used to get the category list from the observed training
%category list. 'categories' will not be in the same order as in proj3.m,
%because unique() sorts them. This shouldn't really matter, though.
categories = unique(train_labels); 
num_categories = length(categories);
N = size(train_image_feats,1);
M = size(test_image_feats,1);

bin_labels = cell(1,N);

num_dim = size(train_image_feats,2);

W = zeros(num_categories,num_dim);
B = zeros(num_categories,1);

%% Training Phase
for i = 1:num_categories
    
    %Get Binary labels for category i
    bin_labels = double(strcmp(categories(i),train_labels));
    
    bin_labels(bin_labels==0) = -1;
    
    %train linear svm for each cat
    [W(i,:) B(i,:)] = vl_svmtrain(train_image_feats', bin_labels', LAMBDA);

    
end

%% Testing Phase

%iterate through each test image feature
for i = 1:M
    
    current_feat = test_image_feats(i,:);
    
    current_confid  = zeros(1,num_categories);
    
    for j = 1:num_categories
        tempW = W(j,:)';
        current_confid(j) = dot(tempW, current_feat') + B(j,:);
        
    end
    
    [maxVal maxInd] = max(current_confid);
    
    
    predicted_categories(i,1) = categories(maxInd);
    
end

end



