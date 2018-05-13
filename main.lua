-- TODO: avoid duplicate points in pixels
-- TODO: how to check if out of window 

function table.contains(tabl, val)
    for i,v in ipairs(tabl) do 
        if v==val then return true end
    end
    return false
end

function love.load()
    love.graphics.setBackgroundColor(255,255,255)
    pixels = {} -- pixels to draw 
    canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(0,0,0)
end

function love.update(dt)
    pos = {love.mouse.getX(), love.mouse.getY()}
    if (love.mouse.isDown(1) and 
        not table.contains(pixels,pos) and                      -- duplicate control
        pos[1]>=0 and pos[1]<=love.graphics.getWidth() and      -- not off screen
        pos[2]>=0 and pos[2]<=love.graphics.getHeight()) then
        table.insert(pixels, pos) -- add to draw!
    end
end 

function love.draw()
    love.graphics.setPointSize(3)
    if #pixels > 0 then
        love.graphics.setCanvas(canvas)
        for i,v in ipairs(pixels) do 
            love.graphics.points(v[1], v[2]) -- draws the pixels as pts
        end
        love.graphics.setCanvas() 
    end
    love.graphics.draw(canvas,0,0)
    love.graphics.print("How many pixels in table: " .. #pixels, 0,0)
    love.graphics.print("Mouse cursor position: "..pos[1].." "..pos[2], 0, 15)
end