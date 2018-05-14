-- TODO: create layer system 
-- TODO: set up a GUI
-- TODO: figure out a zoom system 
-- TODO: clear canvas
-- TODO: fix colors 
-- TODO: converter from rgb 0..255 to 0..1

require "dda" 
require "obj"

STROKE_SIZE = 10
LINE_COLOR = {1, 0.5, 0.5} -- {r,g,b}

function love.load()
    icon = love.image.newImageData("img/pxldesign-icon.png")
    love.window.setIcon(icon)

    love.graphics.setBackgroundColor(255,255,255)
    love.window.setTitle("pxldesign")
    -- initialize 2D pixel array, empty at first
    pixels = {}
    initPixelTable(pixels, love.graphics.getWidth(), love.graphics.getHeight())
    -- initialize last position
    lastpos = {0, 0}
    -- initialize button last pressed
    pressed = false

    canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
end


function love.update(dt)
    pos = {love.mouse.getX(), love.mouse.getY()}    
    if (love.mouse.isDown(1)) then
        pixels[pos[1]][pos[2]] = LINE_COLOR -- set pixel to {r, g, b}
        if (pressed == true) then 
            addline(pixels, lastpos, pos)
        end
        pressed = true
        lastpos = pos -- update last position for interpolation
    else
        pressed = false 
    end
end


function love.draw()
    love.graphics.setPointSize(STROKE_SIZE)
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
    love.graphics.draw(canvas, 0, 0)
    -- debug
    love.graphics.print("Mouse cursor position: "..pos[1].." "..pos[2], 0, 15)
end


function love.keypressed(key)
    if key == "r" then 
        print("Key pressed")
        -- TODO: add clear canvas functionality 
    end
end