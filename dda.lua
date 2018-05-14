function math.round(val)
    return math.floor((math.floor(val*2) + 1) / 2)
end 

-- implementation of dda line generation algorithm
function line(x0, y0, x1, y1)
    local dx, dy, steps, xincre, yincre
    local x = x0
    local y = y0
    local result = {} -- return this 
    
    dx = x1 - x0
    dy = y1 - y0

    -- find number of steps to put pixels
    if (math.abs(dx) > math.abs(dy)) then
        steps = math.abs(dx)
    else 
        steps = math.abs(dy)
    end
    
    xincre = dx / steps 
    yincre = dy / steps 

    for i = 0,steps do 
        table.insert(result, {math.round(x), math.round(y)})
        x = x + xincre 
        y = y + yincre 
    end 
    return result
end

-- adds line to table of pixels
function addline(pxltable, lastpos, pos)
    local line = line(lastpos[1], lastpos[2], pos[1], pos[2])
    for i,v in ipairs(line) do
        pxltable[v[1]][v[2]] = {0,0,0}
    end
end

--[[
test = line(0, 0, 0, 4)
for i,v in ipairs(test) do 
    print("x: "..test[i][1].." y: "..test[i][2])
end
--]]