clear all
close all

image1 = imread('person_toy/00000001.jpg');
g1_sigma = 0.8;
g1_size = 9;
g2_sigma = 0.3;
g2_size = 9;

k = 0.04;
supression_size = 15;
top_N = 100;
method = 'Harris';

flow_scaling = 1.2;

[Ix, Iy, H, rows, columns] = harris_corner_detector(image1, g1_sigma, g1_size, g2_sigma, g2_size, k, supression_size, top_N, method);

figure
imshow(image1)
hold on
plot(rows,columns,'ro', 'MarkerSize', 5)

[N, M, ~] = size(image1);
for i = 2:100
    image2 = imread(strcat('person_toy/', pad(num2str(i), 8, 'left','0'),'.jpg'));    
    [Vx, Vy] = lucas_kanade(image1,image2, floor(rows), floor(columns), supression_size);
    imshow(image2)
    hold on
    quiver(floor(rows),floor(columns),Vx,Vy)
    rows = rows + flow_scaling*Vx;
    columns = columns + flow_scaling*Vy;
    plot(rows,columns,'ro', 'MarkerSize', 5)
    saveas(gcf,strcat('person_toy_flow/', pad(num2str(i), 8, 'left','0'),'.jpg'))
    pause(0.01)
    image1 = image2;
    
end
