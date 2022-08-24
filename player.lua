require('input')
require('levelLoader')

--player object declaration--
player = {}
player.sprite = love.graphics.newImage('sprites/player.png')
player.x = 1000
player.y = 0
player.xtile = 0
player.ytile = 0

local function playerInput()
    if input.right then player.x = player.x + 10 end
    if input.left then player.x = player.x - 10 end
    if input.a then
        player.jump = true
        player.grounded = false
    else player.jump = false end
end

local function movePlayer()
    if player.x < 0 then player.x = 0 end
    if player.x + 50 > levelLength * 16 then player.x = (levelLength * 16) - 50 end
    if tileMap[getTile(player.xtile, player.ytile)].exists then
        player.grounded = true
    end
    player.xtile = math.floor((player.x) / 16)
    player.ytile = math.floor((player.y + 50) / 16)
end

local function playerGravity()
    if not tileMap[getTile(player.xtile, player.ytile)].exists
    and not player.jump
    and not player.grounded then
        player.y = player.y + 10
    end
end

function playerLoop()
    playerInput()
    movePlayer()
    playerGravity()
end

