using ImageView
using TestImages
using Images

test_x = [1, 2, 3, 4, 5]
test_y = [2, 4, 6, 8, 10]

img = zeros(length(test_x), length(test_y))

for i in 1:length(test_x)
    x_ind = Int(test_x[i]/maximum(test_x) * length(test_x))
    y_ind = length(test_y) - Int(test_y[i]/maximum(test_y) * length(test_y))
    println(x_ind, "  ", y_ind)
    img[x_ind, y_ind] = 1
end

# img = [0.2 0.1 0.4; 0.7 0.1 0.2; 0.9 1 0]
ImageView.imshow(img)


