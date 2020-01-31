debug = true

function love.load()
    player = love.graphics.newImage("/res/player.png")
end

function love.update()
end

function love.draw()
    love.graphics.draw(player, 100, 100)
end