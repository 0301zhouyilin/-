function [lbpFeatures, lbpImage] = my_LBP(image)
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    [rows, cols] = size(image);
    lbpImage = zeros(rows, cols);
    radius = 1;
    nPoints = 8;

    for i = 2:rows-1
        for j = 2:cols-1
            s = 0;
            for k = -1:1
                for m = -1:1
                    if image(i+k, j+m) >= image(i, j)
                        s = s + 2^((m+1)*3 + k+1);
                    end
                end
            end
            lbpImage(i, j) = s;
        end
    end

    lbpFeatures = hist(lbpImage(:), 0:nPoints);
    lbpFeatures = lbpFeatures / sum(lbpFeatures);
end