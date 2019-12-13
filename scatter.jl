using ImageView
using Images
using TestImage

x = collect(1:10)
y = rand(1:10, 10)

function get_range(x)
    return maximum(x) - minimum(x)
end

function scatter(x, y, size_x, size_y)
    x_length = length(x)
    y_length = length(y)
    x_range = get_range(x)
    y_range = get_range(y)
    max_y = maximum(y)
    img = zeros(size_x, size_y)
    for i in 1:x_length
        current_x = x[i]
        current_y = y[i]
        x_ind = Int(ceil(((current_y-minimum(y))/y_range) * (size_y-1))) + 1
        y_ind = Int(ceil(((current_x-minimum(x))/x_range) * (size_x-1))) + 1
        println(x_ind, " ", y_ind)
        img[x_ind, y_ind] = 1
    end
    return img
end

function x_axis(img)
    rows = size(img)[1]
    cols = size(img)[2]
    axis = zeros(1, cols)
    axis[1, :] .= 0.5
    img = [img; axis]
    return img
end

function y_axis(img)
    rows = size(img)[1]
    cols = size(img)[2]
    axis = zeros(rows, 1)
    axis[:, 1] .= 0.5
    img = [axis img]
    return img
end

function labels(img)
end

img = scatter(x, y, 100, 100)
img = x_axis(img)
img = y_axis(img)
ImageView.imshow(img)
