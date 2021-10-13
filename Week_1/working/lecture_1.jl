using Images

url = "https://images.unsplash.com/photo-1634034464593-5b252db180b3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=871&q=80"

download(url,"pumpkin.jpg")

philip = load("pumpkin.jpg")
typeof(philip)
size(philip)

RGBX(0.4,0.6,0.1)

philip[100,400]
philip[1:200,1:600]

(h, w) = size(philip)
head = philip[(h ÷ 2):h,(w ÷ 10):(9w ÷ 10)]

[head head]

[head reverse(head, dims=2)
reverse(head,dims=1) reverse(reverse(head, dims=1), dims=2)]

new_phil = copy(philip)

red = RGB(1, 0, 0)
for i in 1:100
    for j in 1:100
        new_phil[i,j] = red
    end
end
new_phil

new_phil2 = copy(new_phil)
green = RGB(0, 1, 0)
new_phil2[235:end,300:500] .= green
new_phil2

function redify(color)
    return RGB(color.r, 0, 0)
end

color = RGB(0.8, 0.5, 0.2)
[color, redify(color)]

color = RGB(0.1, 0.5, 0.2)
[color, redify(color)]

redify.(philip)
