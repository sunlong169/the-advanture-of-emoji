require "Frame._loader"
debug = true

require "Scripts._loader"
function love.load()
    Main()
end

function love.update(dt)
    Scene.__update(dt)
end

function love.draw()
    IDraw.__draw()
end
