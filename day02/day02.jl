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

function validate_line(line)
    i = 1
    ascending = false

    if line[1] < line[length(line)]
        ascending = true
    end

    while i < length(line) 
        if ascending
            if line[i] > line[i+1] || line[i + 1] - line[i] > 3 || line[i + 1] == line[i]
                return i
                break
            else
                i += 1
            end
        else
            if line[i] < line[i + 1] || line[i] - line[i + 1] > 3 || line[i + 1] == line[i]
                return i
                break
            else
                i += 1
            end
        end

    end

    return -1 
end

function star_two()
    lines = readlevels("data.txt")
    safe_count = 0
    skipped = false
    for line in lines
        res = validate_line(line)

        if res == -1
            safe_count += 1
        else
            if res < length(line) - 1
                skip_next = [line[1:res]; line[res+2:length(line)]]
            else
                skip_next = line[1:length(line) - 1]
            end
            
            if res > 1
                skip_cur = [line[1:res - 1]; line[res+1:length(line)]]
            else
                skip_cur = line[2:length(line)]
            end

            if validate_line(skip_cur) == -1 || validate_line(skip_next) == -1
                safe_count += 1
            end

        end
    end




    return safe_count
end

println(star_one())
println(star_two())