clc;
clearvars;

fontSize = 20;

cPhoto = imread('test_photo.jpg');
Photo = rgb2gray(cPhoto);
subplot(2, 2, 1);
imshow(Photo);
title('Gray Scale Image', 'FontSize', fontSize);

[pixelCount, grayLevels] = imhist(Photo);
subplot(2, 2, 2); 
bar(grayLevels, pixelCount);

title('Histogram', 'FontSize', fontSize, 'Interpreter', 'None');
xlabel('Gray Level', 'FontSize', fontSize);
ylabel('Pixel Count', 'FontSize', fontSize);


Id = im2double(Photo);
Imax = max(Id(:));
Imin = min(Id(:));
T = 0.5*(min(Id(:)) + max(Id(:)));
deltaT = 0.01;
done = false;
counter = 1;
while ~done
  savedThresholds(counter) = T;
  
  g = Id >= T;
  Tnext = 0.5*(mean(Id(g)) + mean(Id(~g)));
  done = abs(T - Tnext) < deltaT;
  T = Tnext;
  
  subplot(2, 2, 3);
  imshow(g);
  title('Segmented Image', 'FontSize', fontSize);
  
  subplot(2, 2, 4);
  plot(savedThresholds, 'b*-', 'MarkerSize', 15, 'LineWidth', 2);

  title('Thresholds', 'FontSize', fontSize);
  xlabel('Iteration', 'FontSize', fontSize);
  ylabel('Threshold', 'FontSize', fontSize);

  counter = counter + 1;
end