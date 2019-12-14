using ImageView

x = collect(1:10)
y = rand(1:10, 10)

mutable struct JuliPlot
    img
    size::Tuple{Int64, Int64}
    range::Tuple{Int64, Int64}
end

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
        x_ind = Int(ceil(((current_x-minimum(x))/x_range) * (size_x-1))) + 1
        y_ind = Int(ceil(((current_y-minimum(y))/y_range) * (size_y-1))) + 1
        img[y_ind, x_ind] = 1
    end
    return JuliPlot(img, (size_x, size_y), (x_range, y_range))
end

function smoothen(img)
    # TODO: apply convolutional filters!
end

function x_axis(plt::JuliPlot)
    rows = size(plt.img)[1]
    cols = size(plt.img)[2]
    axis = zeros(1, cols)
    axis[1, :] .= 0.5
    plt.img = [plt.img; axis]
    return plt
end

function y_axis(plt::JuliPlot)
    rows = size(plt.img)[1]
    cols = size(plt.img)[2]
    axis = zeros(rows, 1)
    axis[:, 1] .= 0.5
    plt.img = [axis plt.img]
    return plt
end

function labels(img)
    x_range = img.range[1]
    y_range = img.range[2]
    # TODO: display image labels as numbers :O
end

plt = scatter(x, y, 100, 100)
plt = x_axis(plt)
plt = y_axis(plt)
ImageView.imshow(plt.img)
