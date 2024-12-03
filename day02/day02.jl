function readlevels(filename)
    out = Array{Int16}[]

    for line in eachline(filename)
        nums = split(line, ' ', keepempty=false)
        push!(out, parse.(Int16, nums))
    end

    return out

end

function star_one()
    lines = readlevels("data.txt")

    safe_count = 0

    for line in lines
        i = 1
        safe = true
        ascending = false

        if line[1] < line[2]
            ascending = true
        end

        while i < length(line) 
            if ascending
                if line[i] > line[i+1] || line[i + 1] - line[i] > 3 || line[i + 1] == line[i]
                    i += 1
                    safe = false
                    break
                else
                    i += 1
                end
            else
                if line[i] < line[i + 1] || line[i] - line[i + 1] > 3 || line[i + 1] == line[i]
                    i += 1
                    safe = false
                    break
                else
                    i += 1
                end
            end

        end
        if safe
            safe_count += 1
        end
    end

    return safe_count
end

function star_two()
    lines = readlevels("data.txt")

    safe_count = 0

    for line in lines
        i = 1
        violations = 0
        safe = true
        ascending = false

        if line[1] < line[2]
            ascending = true
        end

        while i < length(line) 
            if ascending
                if line[i] > line[i+1] || line[i + 1] - line[i] > 3 || line[i + 1] == line[i]
                    i += 1
                    violations += 1
                else
                    i += 1
                end
            else
                if line[i] < line[i + 1] || line[i] - line[i + 1] > 3 || line[i + 1] == line[i]
                    i += 1
                    violations += 1
                else
                    i += 1
                end
            end

            if violations >= 2
                safe = false
                break
            end

        end
        if safe
            safe_count += 1
        end
    end

    return safe_count
end

println(star_one())
println(star_two())