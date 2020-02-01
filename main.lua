debug = true
player = {x = 100, y = 280, speed = 300, img = nil}
stage = {x = 0, y = 0, speed = 300, img = nil}

function love.load()
    player.img = love.graphics.newImage("/res/image/player/move1.png")
    stage.img = love.graphics.newImage("res/image/stage/test-stage.png")
    love.graphics.setBackgroundColor(50 / 255, 175 / 255, 1)
    love.graphics.setLineWidth(5) 
end

function love.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('right', 'd') then
        stage.x = stage.x - (stage.speed * dt)
    end

    if love.keyboard.isDown('left', 'a') then
        stage.x = stage.x + (stage.speed * dt)
    end

end


function love.draw()
    love.graphics.draw(stage.img, stage.x, stage.y)
    love.graphics.draw(player.img, player.x, player.y)
end
