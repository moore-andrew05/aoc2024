function readlists(filename)
    a1 = Int32[]
    a2 = Int32[]

    for line in eachline(filename)
        nums = split(line, ' ', keepempty=false)
        push!(a1, parse.(Int32, nums[1]))
        push!(a2, parse.(Int32, nums[2]))
    end
    return a1, a2
end


function star_one()
    l1, l2 = readlists("data.txt")
    l1 = sort(l1)
    l2 = sort(l2)

    running_sum = 0

    for (i, val) in enumerate(l1)
        running_sum += abs(val - l2[i])
    end

    return running_sum
end


function star_two()
    l1, l2 = readlists("data.txt")

    counts = Dict{Int32,Int32}()
    for val in l2
        if haskey(counts, val)
            counts[val] += 1
        else
            counts[val] = 1
        end
    end

    running_sum = 0

    for val in l1
        if haskey(counts, val)
            running_sum += val * counts[val]
        end
    end

    return running_sum
end
    
    
println(star_one())
println(star_two())
