require('levelLoader')
require('menu')
local gameScene = love.graphics.newCanvas()
local menuScene = love.graphics.newCanvas()
local background = love.graphics.newCanvas()
local tiles = love.graphics.newCanvas()
local objects = love.graphics.newCanvas()
local debugText = love.graphics.newCanvas()

local function objectRenderer()
    love.graphics.setCanvas(objects)
        love.graphics.clear(0,0,0,0)
        love.graphics.draw(player.sprite, player.x, player.y, 0, 1, 1) --draws player--
    love.graphics.setCanvas()
end

function tileRenderer()
    love.graphics.setCanvas(tiles)
        for i=0, totalTiles do
        if tileMap[i].exists == true then
        local tileSprite = love.graphics.newImage("tiles/"..tileMap[i].tileset.."/"..tileMap[i].tileID..".png")
        love.graphics.draw(tileSprite, i % levelLength * 16, math.floor(i / levelLength) * 16)
        end
        i = i + 1
        end
    love.graphics.setCanvas()
end

local function gameDebugRenderer()
    love.graphics.setCanvas(debugText)
        love.graphics.clear(0,0,0,0)
        love.graphics.print("Player X Tile: "..player.xtile, 0, 20, 0, 2, 2)
        love.graphics.print("Player Y Tile: "..player.ytile, 0, 40, 0, 2, 2)
        love.graphics.print("Player X: "..player.x, 0, 60, 0, 2, 2)
        love.graphics.print("Player Y: "..player.y, 0, 80, 0, 2, 2)
        love.graphics.print("Player Jumping?: "..tostring(player.jump), 0, 100, 0, 2, 2)
        love.graphics.print("Player Grounded?: "..tostring(player.grounded), 0, 120, 0, 2, 2)
    love.graphics.setCanvas()
end

local function menuRenderer()
    love.graphics.setCanvas(menuScene)
        love.graphics.clear(0,0,0,0)
        love.graphics.print("menu test!", 500, 300, 0, 4, 4)
        love.graphics.print("(enter to start)", 540, 380, 0, 2, 2)
    love.graphics.setCanvas()
end

local function menuDebugRenderer()
    love.graphics.setCanvas(debugText)
        love.graphics.clear(0,0,0,0)
        love.graphics.print("Current Selection: "..menuSelection, 0, 20, 0, 2, 2)
    love.graphics.setCanvas()
end

function compositeLayers()
    if gameState == 1 then
        love.graphics.draw(menuScene)
    end
    if gameState == 2 then
        love.graphics.draw(tiles)
        love.graphics.draw(objects)
    end
    love.graphics.draw(debugText)
end

function gameRenderLoop()
    objectRenderer()
    gameDebugRenderer()
end

function menuRenderLoop()
    menuRenderer()
    menuDebugRenderer()
end