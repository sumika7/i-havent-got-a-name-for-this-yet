require('input')
require('player')
require('levelLoader')
require('renderer')
require('menu')
local minDT = 1/60
local nextTime = love.timer.getTime()
gameState = 1
loadGame = false

local function gameLoop()
    playerLoop()
end

function love.load()
    menuLoop()
end

function love.draw()
    local fps = love.timer.getFPS()
    love.graphics.print("FPS: "..fps, 0, 0, 0, 2, 2)
    compositeLayers()

    local curTime = love.timer.getTime()
    if nextTime <= curTime then
       nextTime = curTime
       return
    end
    love.timer.sleep(nextTime - curTime)
end

function love.update()
    nextTime = nextTime + minDT
    inputCheck()
    if gameState == 1 then
        menuLoop()
        menuRenderLoop()
    end
    if gameState == 2 then
        gameLoop()
        gameRenderLoop()
    end
end
