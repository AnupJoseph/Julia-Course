using Images
using ImageFiltering
using ColorTypes

function colored_line(vec)
    Gray.(vec)
end

example_vector = [0.5,0.4,0.3,0.2,0.1,0.0,0.7,0.0,0.7,0.9]
colored_line(example_vector)

random_vect = rand(10)
colored_line(random_vect)


function mean(x)
    return sum(x) / length(x)
end

mean([1, 2, 3])

mean(random_vect)

function demean(x)
    return [val - mean(x) for val in x]
end

mean(demean(random_vect))

function create_bar!(vec)
    vec[40:60] .= 1
end
vec = rand(100)
create_bar!(vec)

function vecvec_to_matrix(vecvec)
    vecvec = [reshape(vec, :, 1) for vec in vecvec]
    return reshape(vecvec, :, 1)
end
vecvec_to_matrix([[1,2], [3,4]])


philip_file = download("https://i.imgur.com/VGPeJ6s.jpg")

decimate(image, ratio=5) = image[1:ratio:end, 1:ratio:end]

philip = let 
    original = load(philip_file)
    decimate(original, 8)
end

function mean_colors(image)
    r, g, b = mean(red(image)), mean(green(image)), mean(blue(image))
    return [r g b]
end