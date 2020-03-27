function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% when operating in convolution mode. See 'help imfilter'. 
% While "correlation" and "convolution" are both called filtering, 
% there is a difference. From 'help filter2':
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should meet the requirements laid out on the project webpage.

% Boundary handling can be tricky as the filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% we look at 'help imfilter', we see that there are several options to deal 
% with boundaries. 
% Please recreate the default behavior of imfilter:
% to pad the input image with zeros, and return a filtered image which matches 
% the input image resolution. 
% A better approach is to mirror or reflect the image content in the padding.

% Uncomment to call imfilter to see the desired behavior.
% output = imfilter(image, filter, 'conv');

%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

%%================================Start==================================%%%
if numel(size (image))<3
[mi,ni]=size (image);%  mi m for rows i for image
[mf , nf]=size(filter ); % mf m for rows ,f for filters
 n_image= zeros(mi,ni);
if ( rem(mf,2)==0)||( rem (nf,2)==0)
    msgbox('Even Filters are not allowed ', 'Error','error');
    return 
else
    r=floor(mf/2);c=floor(nf/2);
     p_image =padarray(image,[r c ],0);% padded image 

    for i=1:mi
        for j=1:ni
        mul_result = filter.*p_image (i:(i+mf-1), (j:(j+nf-1)));
        s_result=sum (sum(mul_result));
        n_image(i,j)=s_result;   
               
        end  
     end    
    
end 
  %%%========================For gray scale images===========================%%%% 
else 
[mi,ni,li]=size (image);%  mi m for rows i for image
[mf , nf]=size(filter ); % mf m for rows ,f for filters
 n_image= zeros(mi,ni,li);
if ( rem(mf,2)==0)||( rem (nf,2)==0)
    msgbox('Even Filters are not allowed ', 'Error','error');
    return 
else
    r=floor(mf/2);c=floor(nf/2);
     p_image =padarray(image,[r c ],0);% padded image 
     
    for k=1:3 
    for i=1:mi
        for j=1:ni
        mul_result = filter.*p_image (i:(i+mf-1), (j:(j+nf-1)),k);
        s_result=sum (sum(mul_result));
        n_image(i,j,k)=s_result;   
               
        end  
    end    
    end 
    
end 
end
   
    

output=n_image;


end

