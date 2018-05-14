-- TODO: create class system

function initPixelTable(pxltable, w, h)
    for i = 0,w do
        pxltable[i] = {}
        for j = 0,h do 
            pxltable[i][j] = nil
        end
    end 
end