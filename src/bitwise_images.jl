using Colors
using Images

function xor_values(x, y)
    xor(x,y)
end

function and_values(x, y)
    x & y
end

function or_values(x, y)
    x | y
end

function calc_image(width::UInt8, height::UInt8, bitwise_function)
    image = zeros(RGB{Float64}, width, height)

    r::UInt8 = 0
    g::UInt8 = 126
    b::UInt8 = 255
    
    for x = 1:width, y = 1:height
        r = 0 + bitwise_function(x, y)
        g = 255 - bitwise_function(x, y)
        b = 64 + div(bitwise_function(x, y), 2)
        
        image[x, y] = RGB{N0f8}(reinterpret(N0f8, UInt8(r)), reinterpret(N0f8, UInt8(g)), reinterpret(N0f8, UInt8(b)))
    end
    
    image
end

save("xor.png", calc_image(UInt8(255), UInt8(255), xor_values))
save("and.png", calc_image(UInt8(255), UInt8(255), and_values))
save("or.png", calc_image(UInt8(255), UInt8(255), or_values))
