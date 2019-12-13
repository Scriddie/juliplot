# Some plotting tests

using scatter

x = collect(1:10)
y = rand(1:10, 10)

img = scatter(x, y)
ImageView.imshow(img)
