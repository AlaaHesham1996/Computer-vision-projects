

function predicted_categories = nearest_neighbor_classify(train_image_feats, train_labels, test_image_feats)
    no_train_images = size(train_image_feats, 1); 
    no_test_images = size(test_image_feats, 1);
   % predicted_categories=zeros(no_test_images,1);
    
          
        %iterate through each of the images to be predicted
        for i = 1:no_test_images
            
            dist = zeros(1,no_train_images);
            current_test_feature = test_image_feats(i,:);
            
            %iterate through each of the features
            for j = 1:no_train_images
                
                current_train_feature = train_image_feats(j,:);
                dist(j) = vl_alldist2(current_train_feature',current_test_feature');
                
            end
            
            [mindistance, index] = min(dist);
            
            predicted_categories(i,1) = train_labels(index);
            
            
        end
        
    end




