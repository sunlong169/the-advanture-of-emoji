
local function move(status)
    local data={
        love.graphics.newImage("res/image/player/move1.png"),
        love.graphics.newImage("res/image/player/move2.png"),
        love.graphics.newImage("res/image/player/move3.png"),
        love.graphics.newImage("res/image/player/move4.png"),
        love.graphics.newImage("res/image/player/move5.png"),
    }
    return data[status]
end

function Main()
    local player = {x = 250, y = 280, speed = 300, img = nil}
    stage = {x = 0, y = 0, speed = 300, img = nil}
    
    local time = 0
    local timer = 0.05
    local status=1
    player.img = move(1)

    -- stage.img = love.graphics.newImage("res/image/stage/test-stage.png")


    

    local s = Scene01.New()
    SceneManager.ChangeScene(s)



    
    -- role.transform:SetPosition(Point.New(0,0))
    -- role.transform:SetLocalPosition(Point.New(0,0))
end


-- function love.update(dt)

--     if love.keyboard.isDown('escape') then
        
--         love.event.push('quit')
--     end

--     if love.keyboard.isDown('right', 'd') then
--         time = time + dt

--         if time>timer then
--           status=status+1
--           time=0
--         end

--         if status==6 then
--            status=1
--         end
        
--         if stage.x > -(2400-800) and player.x>300 then
--         stage.x = stage.x - (stage.speed * dt)
--         else if stage.x<(2400-800) and player.x<800 or player.x<300 then 
--              player.x = player.x + (stage.speed * dt)
--              end
                    
--         end
--          player.img = move(status)
         
--     end


--     if love.keyboard.isDown('left', 'a') then
--         time = time + dt

--         if time>timer then
--           status=status+1
--           time=0
--         end

--         if status==6 then
--            status=1
--         end
        
--         if  (stage.x < 0 and player.x<=300) then
--         stage.x = stage.x + (stage.speed * dt)
--         else if ( stage.x >= 0 and player.x>0 ) or( player.x<=300 and player.x>0 ) or player.x>300 then 
--                  player.x = player.x - (stage.speed * dt)
--              end
            
--         end

--         player.img = move(status)
--     end

-- end


-- function love.draw()
--     love.graphics.draw(stage.img, stage.x, stage.y)
--     love.graphics.draw(player.img, player.x, player.y, 0, 7/21, 7/21)
--     love.graphics.print(stage.x)
    
--     IDraw.__draw()
-- end

