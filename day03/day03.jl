function load_data(pathname)
    out = ""

    for line in eachline(pathname)
        out = out * line
    end

    return out
end

function mul_capture(capture)
    num1, num2 = split(capture[5:length(capture) - 1], ",")
    num1 = parse(Int64, num1)
    num2 = parse(Int64, num2)
    return num1 * num2
end


function star_one()
    data = load_data("data.txt")
    tot = 0
    capture = r"(mul\(\d{1,3},\d{1,3}\))"
    matches = eachmatch(capture, data)
    for match in matches
        tot += mul_capture(match.match)
    end
    return tot

end

print(star_one())