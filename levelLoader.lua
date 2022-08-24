function loadLevel()
    local bitser = require 'libs.bitser'
    local loadedLevel = bitser.loads(love.filesystem.read('levels/testlevel.lvl'))
    tileMap = loadedLevel.tiles
    levelLength = loadedLevel.length
    totalTiles = #tileMap
    tileRenderer()
end

function getTile(x, y)
    return x + y * levelLength
end

--this will have the rest of the level loading stuff later (objects, music, etc.)