function hog_image = my_HOG(image)
    if size(image, 3) > 1
        image = rgb2gray(image);
    end
    image = im2double(image);
    cell_size = 24;
    num_bins = 9;
    min_magnitude = 0.1;

    dx = [-1 0 1; -2 0 2; -1 0 1];
    dy = dx';
    Gx = imfilter(image, dx, 'replicate');
    Gy = imfilter(image, dy, 'replicate');

    magnitude = sqrt(Gx.^2 + Gy.^2);
    orientation = atan2d(Gy, Gx);
    orientation = mod(orientation, 180);

    magnitude = imgaussfilt(magnitude, 1.5);
    [rows, cols] = size(image);
    hog_image = ones(rows, cols, 'double');
    num_cells_y = floor(rows / cell_size);
    num_cells_x = floor(cols / cell_size);
    bin_edges = linspace(0, 180, num_bins + 1);
    bin_centers = (bin_edges(1:end-1) + bin_edges(2:end)) / 2;

    for i = 1:num_cells_y
        for j = 1:num_cells_x
            row_start = (i-1)*cell_size + 1;
            row_end = min(i*cell_size, rows);
            col_start = (j-1)*cell_size + 1;
            col_end = min(j*cell_size, cols);
            cell_mag = magnitude(row_start:row_end, col_start:col_end);
            cell_ori = orientation(row_start:row_end, col_start:col_end);
            if mean(cell_mag(:)) < min_magnitude
                continue;
            end
            hist = zeros(1, num_bins);
            for b = 1:num_bins
                mask = (cell_ori >= bin_edges(b)) & (cell_ori < bin_edges(b+1));
                hist(b) = sum(cell_mag(mask));
            end

            hist = hist / (norm(hist) + 1e-6);
            center_y = (row_start + row_end) / 2;
            center_x = (col_start + col_end) / 2;
            max_line_length = cell_size * 0.4;
            [sorted_hist, sorted_idx] = sort(hist, 'descend');
            for b = 1:min(2, sum(sorted_hist > 0.2))
                angle = bin_centers(sorted_idx(b));
                line_length = sorted_hist(b) * max_line_length;
                dx = cosd(angle) * line_length;
                dy = sind(angle) * line_length;
                thickness = max(1, round(sorted_hist(b) * 3));
                hog_image = drawThickLine(hog_image, ...
                    [center_x-dx, center_y-dy, center_x+dx, center_y+dy], ...
                    thickness);
            end
        end
    end
    hog_image = 1 - hog_image;
    hog_image = imadjust(hog_image);
end

function img = drawThickLine(img, line, thickness)
    x1 = round(line(1)); y1 = round(line(2));
    x2 = round(line(3)); y2 = round(line(4));
    dx = x2 - x1;
    dy = y2 - y1;
    N = max(abs(dx), abs(dy)) * 2;
    t = linspace(0, 1, N);
    x = x1 + t * dx;
    y = y1 + t * dy;

    for i = -thickness:thickness
        for j = -thickness:thickness
            if i^2 + j^2 <= thickness^2
                xp = round(x) + i;
                yp = round(y) + j;
                valid = xp >= 1 & xp <= size(img,2) & yp >= 1 & yp <= size(img,1);
                if any(valid)
                    ind = sub2ind(size(img), yp(valid), xp(valid));
                    img(ind) = 0;
                end
            end
        end
    end
end