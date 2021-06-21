clc;
clearvars;

textSize = 15;
input = imread('citylife.jpeg', 'jpg'); %Reading the image
Photo = rgb2gray(input); %Conversion of image to greyscale

%(2, 2, 1) The 2's represent the row and column 
%and the 1 represents the position of the plot
subplot(2, 2, 1); 
imshow(Photo); 
title('Grey Scale', 'FontSize', textSize); 
%FontSize is a built-in function to adjust the font size
[pixels, greyLevels] = imhist(Photo);
subplot(2, 2, 3); 

%plotting the histogram bar graph
bar(greyLevels, pixels); %chose a bar histogram over a stair histogram
%plot(imhist(Photo), 'black.-');
%title({'First line';'Second line'},'FontWeight','Normal')
%title({'Histogram'}, 'FontWeight','Heavy');
title('Histogram', 'FontSize', textSize);
xlabel('Grey Level', 'FontSize', textSize);
ylabel('Pixels', 'FontSize', textSize);
 
 
Double = im2double(Photo); %using double precision
ImageMax = max(Double(:));
ImageMin = min(Double(:));
T = 0.5*(ImageMax+ImageMin);
deltaT = 0.01;
num = 1;
done = false;

while ~done
  %Thresholding Calculations 
  Thresh(num) = T;
  segmented = Double >= T;
  Tnext = 0.5*(mean(Double(segmented)) + mean(Double(~segmented)));
  done = abs(T - Tnext) < deltaT;
  T = Tnext;
  subplot(2, 2, 2);
  imshow(segmented);
  title('Segmentation', 'FontSize', textSize);
  
  subplot(2, 2, 4);
  plot(Thresh, 'black.-', 'MarkerSize', 20, 'LineWidth', 1);
  %'black.-' changes the color of the points and the line
  %'MarkerSize' changes the thickness of the points
  %'LineWidth' changes the thickness of the line
  title('Thresholds', 'FontSize', textSize);
  xlabel('Iteration', 'FontSize', textSize);
  ylabel('Threshold', 'FontSize', textSize);
  
  num = num + 1;
end