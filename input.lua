input = {}
input.left = false
input.right = false
input.up = false
input.down = false
input.a = false

function inputCheck()
    input.left = love.keyboard.isDown('left')
    input.right = love.keyboard.isDown('right')
    input.up = love.keyboard.isDown('up')
    input.down = love.keyboard.isDown('down')
    input.enter = love.keyboard.isDown('return')
    input.a = love.keyboard.isDown('a')
end
