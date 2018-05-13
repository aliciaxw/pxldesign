-- TODO: create layer system 
-- TODO: set up a GUI
-- TODO: drawing smooth lines 
-- TODO: figure out a zoom system 

function love.load()
    love.graphics.setBackgroundColor(255,255,255)
    -- initialize 2D pixel array, empty at first
    pixels = {}
    for i = 1,love.graphics.getWidth() do
        pixels[i] = {}
        for j = 1,love.graphics.getHeight() do 
            pixels[i][j] = nil
        end
    end 
    canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
end

function love.update(dt)
    pos = {love.mouse.getX(), love.mouse.getY()}
    if (love.mouse.isDown(1)) then -- duplicate control
        pixels[pos[1]][pos[2]] = {0,0,0} -- set pixel to {r, g, b}
    end
end

function love.draw()
    love.graphics.setPointSize(1)
    -- setting canvas
    love.graphics.setCanvas(canvas)
    -- draw points 
    for i = 1,love.graphics.getWidth() do
        for j = 1,love.graphics.getHeight() do
            if pixels[i][j] ~= nil then 
                -- set color, then draw point
                love.graphics.setColor(pixels[i][j][1], pixels[i][j][2], pixels[i][j][3])
                love.graphics.points(i,j)
            end
        end
    end
    love.graphics.setCanvas()
    love.graphics.draw(canvas,0,0)
    love.graphics.print("Mouse cursor position: "..pos[1].." "..pos[2], 0, 15)
end