debug = true

function love.load()
    player = love.graphics.newImage("/res/image/player/move1.png")
    love.graphics.setBackgroundColor(50/255,175/255,1)
    love.graphics.setLineWidth(5)
    
end

function love.update(dt)
end


function love.draw()
   
    love.graphics.draw(player, 0,400-105,0,0.3,0.3)
    love.graphics.line(0,400,800,400)
    
end
