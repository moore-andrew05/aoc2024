function load_data(pathname)
    grid = String[]

    for line in eachline(pathname)
        push!(grid, line)
    end

    return grid
end

function validate_point(x, y, x_dim, y_dim)
    if x > 0 && x <= x_dim && y > 0 && y <= y_dim
        return true
    else
        return false
    end
end

function star_one()
    data = load_data("data.txt")

    y_dim = length(data)
    x_dim = length(data[1])

    search_term = "XMAS"
    directions = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    term_count = 0

    function word_search(x, y, dir)
        new_x = x
        new_y = y
        pos = 2
        while pos < 5
            new_x = new_x + dir[1]
            new_y = new_y + dir[2]
            if validate_point(new_x, new_y, x_dim, y_dim) && data[new_y][new_x] == search_term[pos]
                pos += 1
            else
                return
            end


        end
        term_count += 1
    end

    for y in range(1, y_dim)
        for x in range(1, x_dim)
            if data[y][x] == 'X'
                for dir in directions
                    word_search(x, y, dir)
                end
            end
        end
    end

    return term_count
end

function star_two()
    data = load_data("data.txt")
    y_dim = length(data)
    x_dim = length(data[1])
    perms = ["MSAMS", "MMASS", "SSAMM", "SMASM"]
    directions = [[-1, -1], [1, -1], [0, 0], [-1, 1], [1, 1]]
    term_count = 0

    for y in range(2, y_dim - 1)
        for x in range(2, x_dim - 1)
            check = ""
            for dir in directions
                check *= data[y+dir[2]][x+dir[1]]
            end
            if check in perms
                term_count += 1
            end
        end
    end

    return term_count

end




println(star_one())
println(star_two())