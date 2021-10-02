clear;
%im=imread()
%image(im)
%plotting
Im = imread('1.jpg'); 
image(Im); 
hold on 
X_door=[260.4785 263.2957 590.177, 589.3172]
Y_door=[890.6704 430.1723 430.1723 890.6704]
fill(X_door, Y_door, 'b')

hold on 
X_fire=[187.4570 191.0376 223.7258 220.2849]
Y_fire=[545.9260 433.9469 436.4633 544.6678]
fill(X_fire, Y_fire, 'g')

legend
[x y] = ginput(4); 
disp(x);
disp(y);