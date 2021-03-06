clc
clear
close all

image = imread('C:\Users\favm2206\Documents\images\vitesse max version 2\bmp\image_1253.bmp');

% Constantes
GREEN = 2;
IMAGE_WIDTH = 480;
IMAGE_HEIGHT = 480;

HALF_IMAGE_WIDTH = IMAGE_WIDTH/2;
HALF_IMAGE_HEIGHT = IMAGE_HEIGHT/2;

THIRD_IMAGE_WIDTH = IMAGE_WIDTH/3;
THIRD_IMAGE_HEIGHT = IMAGE_HEIGHT/3;

MAX_SCALE = 0.5;

% Variables
max = [ 0 0 ];
max_chosen = [ 0 0 ];
index_X = [ 0 0 ];
index_Y = [ 0 0 ];
intensity_X = [ 0 0 ];
intensity_Y = [ 0 0 ];

% Detection du dessus de la plaque
for j = 2 : THIRD_IMAGE_HEIGHT
    gx = image(j-1, HALF_IMAGE_WIDTH-1, GREEN) ...
        + 2*image(j, HALF_IMAGE_WIDTH-1, GREEN) ...
        + image(j+1, HALF_IMAGE_WIDTH-1, GREEN) ...
        - image(j-1, HALF_IMAGE_WIDTH+1, GREEN) ...
        - image(j, HALF_IMAGE_WIDTH+1, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH+1, GREEN);
    
    gy = image(j-1, HALF_IMAGE_WIDTH-1, GREEN) ...
        + 2*image(j-1, HALF_IMAGE_WIDTH, GREEN) ...
        + image(j-1, HALF_IMAGE_WIDTH+1, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH-1, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH+1, GREEN);
    
    g = sqrt(double(gx*gx + gy*gy));
    
    if g > max(1)*MAX_SCALE
        intensity_Y(1) = intensity_Y(1)+g;
        max_chosen(1) = g;
        index_Y(1) = j;
        if max_chosen(1) > max(1)
            max(1) = max_chosen(1);
        end
    end
end

% Detection du dessous de la plaque
for j = IMAGE_HEIGHT - 1 : -1 : THIRD_IMAGE_HEIGHT*2
    gx = image(j-1, HALF_IMAGE_WIDTH-1, GREEN) ...
        + 2*image(j, HALF_IMAGE_WIDTH-1, GREEN) ...
        + image(j+1, HALF_IMAGE_WIDTH-1, GREEN) ...
        - image(j-1, HALF_IMAGE_WIDTH+1, GREEN) ...
        - image(j, HALF_IMAGE_WIDTH+1, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH+1, GREEN);
    
    gy = image(j-1, HALF_IMAGE_WIDTH-1, GREEN) ...
        + 2*image(j-1, HALF_IMAGE_WIDTH, GREEN) ...
        + image(j-1, HALF_IMAGE_WIDTH+1, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH-1, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH, GREEN) ...
        - image(j+1, HALF_IMAGE_WIDTH+1, GREEN);
    
    g = sqrt(double(gx*gx + gy*gy));
    
    if g > max(2)*MAX_SCALE
        intensity_Y(2) = intensity_Y(2)+g;
        max_chosen(2) = g;
        index_Y(2) = j;
        if max_chosen(2) > max(2)
            max(2) = max_chosen(2);
        end
    end
end

max = [ 0 0 ];
max_chosen = [ 0 0 ];

% Detection du cote gauche de la plaque
for j = 2 : THIRD_IMAGE_WIDTH
    gx = image(HALF_IMAGE_HEIGHT-1, j-1, GREEN) ...
        + 2*image(HALF_IMAGE_HEIGHT, j-1, GREEN) ...
        + image(HALF_IMAGE_HEIGHT+1, j-1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT-1, j+1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT, j+1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j+1, GREEN);
    
    gy = image(HALF_IMAGE_HEIGHT-1, j-1, GREEN) ...
        + 2*image(HALF_IMAGE_HEIGHT-1, j, GREEN) ...
        + image(HALF_IMAGE_HEIGHT-1, j+1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j-1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j+1, GREEN);
    
    g = sqrt(double(gx*gx + gy*gy));
    
    if g > max(1)*MAX_SCALE
        intensity_X(1) = intensity_X(1)+g;
        max_chosen(1) = g;
        index_X(1) = j;
        if max_chosen(1) > max(1)
            max(1) = max_chosen(1);
        end
    end
end

% Detection du cote droite de la plaque
for j = IMAGE_WIDTH-1 : -1 : THIRD_IMAGE_WIDTH*2
    gx = image(HALF_IMAGE_HEIGHT-1, j-1, GREEN) ...
        + 2*image(HALF_IMAGE_HEIGHT, j-1, GREEN) ...
        + image(HALF_IMAGE_HEIGHT+1, j-1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT-1, j+1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT, j+1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j+1, GREEN);
    
    gy = image(HALF_IMAGE_HEIGHT-1, j-1, GREEN) ...
        + 2*image(HALF_IMAGE_HEIGHT-1, j, GREEN) ...
        + image(HALF_IMAGE_HEIGHT-1, j+1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j-1, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j, GREEN) ...
        - image(HALF_IMAGE_HEIGHT+1, j+1, GREEN);
    
    g = sqrt(double(gx*gx + gy*gy));
    
    if g > max(2)*MAX_SCALE
        intensity_X(2) = intensity_X(2)+g;
        max_chosen(2) = g;
        index_X(2) = j;
        if max_chosen(2) > max(2)
            max(2) = max_chosen(2);
        end
    end
end

center_X = (index_X(1) + index_X(2))/2
center_Y = (index_Y(1) + index_Y(2))/2

diameter_X = index_X(2) - index_X(1)
diameter_Y = index_Y(2) - index_Y(1)




