debug = true

require "Frame._loader"
require "Scripts._loader"

function love.load()
    IEngine.Start()
    Main()
end

function love.update(dt)
    IEngine.__update(dt)
end

function love.draw()
    IEngine.__draw()
end
