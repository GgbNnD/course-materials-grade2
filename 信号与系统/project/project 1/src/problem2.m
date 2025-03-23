clc;
close all;
clear;
%读取图片
img = imread("F:\School\大二下\信号与系统\project\project 1\introduction\Files for Problem2\findsmiley.jpg");
[img_row,img_colum] = size(img);
%转为double类型以归一化
img_copy = double(img);
for i = 1:img_row
    for j =1:img_colum
        if(img_copy(i,j)>200)
            img_copy(i,j) = 1;
        else
            img_copy(i,j) = -1;
        end
    end
end
%匹配矩阵
p = [-1 -1 -1 -1 -1;
    -1 1 1 1 -1;
    -1 -1 -1 -1 -1;
    -1 -1 1 -1 -1;
    -1 1 -1 1 -1;
    -1 -1 -1 -1 -1];
sum = 0;
sum_max = 0;
nose_row = 0;
nose_colum = 0;
%卷积
for i =3:img_row-3
    for j=3:img_colum-2
        img_matrix = img_copy(i-2:i+3,j-2:j+2);
        for k = -2:3
            for l =-2:2
                sum = sum+img_matrix(3+k,3+l)*p(4-k,3-l);
            end
        end
        if(sum>sum_max)
            nose_row = i;
            nose_colum =j;
            sum_max = sum;
        end
        sum = 0;
    end
end
smiley_img = img(nose_row-2:nose_row+3,nose_colum-2:nose_colum+2);
imshow(smiley_img,'InitialMagnification','fit')