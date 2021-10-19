using Images
using Statistics
using ImageFiltering

function shrink_image(image, ratio=5)
    (height, width) = size(image)
    new_height = height ÷ ratio - 1
    new_width = width ÷ ratio - 1
    list = [mean(image[ ratio * i:ratio * (i + 1),ratio * j:ratio * (j + 1) ], ) for i in 1:new_width for j in 1:new_height]
    reshape(list, new_height, new_width)
end

function show_colored_kernel(kernel)
    to_rbg(x) = RGB(max(-x, 0), max(x, 0), 0)
    to_rbg.(kernel) / maximum(kernel)
end

download("https://images.unsplash.com/photo-1634316888867-792005cd20ef?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80","test_image.jpg")
large_image = load("test_image.jpg")
image = shrink_image(large_image, 7)

kernel = Kernel.gaussian((1, 1))
show_colored_kernel(kernel)

kernel = Kernel.gaussian((1, 1))
kernel = [-0.5 -1.0 -0.5
            -1.0 7.0 -1.0
            -0.5 -1.0 -0.5]
show_colored_kernel(kernel)

kernel = Kernel.sobel()[2]
show_colored_kernel(kernel)

