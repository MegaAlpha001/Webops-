old_Pic = imread("img.jpg");

figure;
subplot(2,2,1);
imshow(old_Pic);
title("Old Picture");

subplot(2,3,4);
hist(old_Pic(:));
title("Histogram (Original)");

kernel = [0, -1, 0; 0, 3, 0; 0, -1, 0];
new_Pic = 2 * old_Pic;
B = old_Pic;
image_size = size(old_Pic);
for m = 2:image_size(1)-1
    for n = 2:image_size(2)-1
        p = 0;
        for i = 0:2
            for j = 0:2
                p = p + kernel(i+1, j+1) * B(m-1+j, n-j+1, :);
            end
        end
        new_Pic(m,n,:) = p;
    end
end
figure;
subplot(2,2,1);
imshow(new_Pic);
title("Contrast-Adjusted Image");
subplot(2,3,5);
hist(new_Pic(:));
title("Histogram (Contrast-Adjusted Image)");

kernel = [2, 0, 0, 0, 0, 2, 0, 0, 2];
new_Pic = old_Pic ^ 2;
B = old_Pic;
image_size = size(old_Pic);
for m = 2:image_size(1)-1
    for n = 2:image_size(2)-1
        p = 0;
        for i = 0:2
            for j = 0:2
                p = p + kernel(i+1, j+1) * new_Pic(m-1+j, n-j+1, :);
            end
        end
        B(m,n,:) = p;
    end
end
figure;
subplot(2,2,1);
imshow(new_Pic);
title("Gamma-Correction Image");
subplot(2,3,5);
hist(new_Pic(:));
title("Histogram (Gamma-Correction Image)");
pause;
