local menuMove = false
menuSelection = 1

function menuLoop()
    if loadGame then
    loadLevel()
    gameState = 2
    end
    if input.enter then
        loadGame = true
    end
    if input.down and not menuMove then
        menuSelection = menuSelection + 1
        menuMove = true
    end
    if input.up and not menuMove then
        menuSelection = menuSelection - 1
        menuMove = true
    end
    if not input.down
    and not input.up then
        menuMove = false
    end
    
    if menuSelection == 1 then
        
    end
end
