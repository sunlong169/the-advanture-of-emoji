debug = true

require "Frame._loader"
require "Scripts._loader"

function love.load()
    Main()
end

function love.update(dt)
    SceneManager.__update(dt)
end

function love.draw()
    IDraw.__draw()
end
