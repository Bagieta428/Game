local tick = require("tick")
tick.framerate = 60

local buttons = {}
local gameState = "menu"

function love.load()
  background = love.graphics.newImage("assets/main_menu/menu_background.png")
  title = love.graphics.newImage("assets/main_menu/menu_game_title.png")
  
  font = love.graphics.newFont(24)
  love.graphics.setFont(font)
  
  buttons = {
    {label = "Start", x = 350, y = 350, width = 200, height = 50, action = function()
        print("Start gry")
    end},
    {label = "Ustawienia", x = 500, y = 410, width = 200, height = 50, action = function()
        print("Ustawienia")
    end},
    {label = "Wyjdz", x = 650, y = 470, width = 200, height = 50, action = function()
        love.event.quit()
    end}
  }
end

function love.draw()
  if gameState == "menu" then
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(title, 270, 30)
    
    for i, button in ipairs(buttons) do
      love.graphics.setColor(0.2,0.2,0.2)
      love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("line", button.x, button.y, button.width, button.height)
      love.graphics.printf(button.label, button.x, button.y + 15, button.width, "center")
    end
  end
end

function love.mousepressed(x, y, button, istouch, presses)
  if gameState == "menu" and button == 1 then
    for i, button in ipairs(buttons) do
      if x >= button.x and x <= button.x + button.width and y >= button.y and y <= button.y + button.height then
        button.action()
      end
    end
  end
end
