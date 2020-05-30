function randomWindow = randomWindowGen(im, WindowNum)    
    [row,col,~] = size(im);
    for j = 1 : WindowNum
        x1 = 0; x2 = 0;y1 = 0; y2 = 0;
        while(abs(x1 - x2) < 16 || abs(y1 - y2) < 16)
            x1 = ceil((col-1)*rand(1));
            x2 = ceil((col-1)*rand(1));
            y1 = ceil((row-1)*rand(1));
            y2 = ceil((row-1)*rand(1));
        end
        randomWindow(j, 1) = min(x1, x2);
        randomWindow(j, 2) = min(y1, y2);
        randomWindow(j, 3) = max(x1, x2) - min(x1, x2) + 1;
        randomWindow(j, 4) = max(y1, y2) - min(y1, y2) + 1;
    end
end