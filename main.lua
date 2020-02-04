debug = true
local player = {x = 250, y = 280, speed = 300, img = nil}
stage = {x = 0, y = 0, speed = 300, img = nil}

local time = 0
local timer = 0.05
local status=1


local function move(status)
    local data={
        img1=love.graphics.newImage("res/image/player/move1.png"),
        img2=love.graphics.newImage("res/image/player/move2.png"),
        img3=love.graphics.newImage("res/image/player/move3.png"),
        img4=love.graphics.newImage("res/image/player/move4.png"),
        img5=love.graphics.newImage("res/image/player/move5.png"),

    }
    if status==1 then
       return data.img1
    end
    if status==2 then
        return data.img3
     end
     if status==3 then 
        return data.img3
     end
     if status==4 then
        return data.img4
     end
     if status==5 then
        return data.img5
     end
 
    
end


--[[local function player(x,y,size,status)
     local player={
         x=x ,--x坐标,
         y=y ,--坐标,
         size=size, --大小缩放
         status=status --所处状态
     }

 --[[    function player:draw(status)image
        local img=love.graphics.newImage("res/image/player/move1.png")
        if status==1 then
            love.graphics.newImage()

        end

         
     end


     return player
    
end
]]

player.img = move(1)
function love.load()
    
    
    stage.img = love.graphics.newImage("res/image/stage/test-stage.png")
    love.graphics.setBackgroundColor(50 / 255, 175 / 255, 1)
    love.graphics.setLineWidth(5) 
end

function love.update(dt)

    if love.keyboard.isDown('escape') then
        
        love.event.push('quit')
    end

    if love.keyboard.isDown('right', 'd') then
        time = time + dt

        if time>timer then
          status=status+1
          time=0
        end

        if status==6 then
           status=1
        end
        
        if stage.x > -(2400-800) and player.x>300 then
        stage.x = stage.x - (stage.speed * dt)
        else if stage.x<(2400-800) and player.x<800 or player.x<300 then 
             player.x = player.x + (stage.speed * dt)
             end
                    
        end
         player.img = move(status)
         
    end


    if love.keyboard.isDown('left', 'a') then
        time = time + dt

        if time>timer then
          status=status+1
          time=0
        end

        if status==6 then
           status=1
        end
        
        if  (stage.x < 0 and player.x<=300) then
        stage.x = stage.x + (stage.speed * dt)
        else if ( stage.x >= 0 and player.x>0 ) or( player.x<=300 and player.x>0 ) or player.x>300 then 
                 player.x = player.x - (stage.speed * dt)
             end
            
        end
      
        
        player.img = move(status)
    end

  
 
end

function love.draw()
    love.graphics.draw(stage.img, stage.x, stage.y)
    love.graphics.draw(player.img, player.x, player.y,0,7/21,7/21)
    love.graphics.print(stage.x)
end
 




