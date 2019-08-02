   --bg = love.graphics.newImage("spr/bg.png")


spr = {}
    -- I- Instancier le sprite (le charger)
    spr.img = love.graphics.newImage("spr/personnage.png")
    spr.x = 100
    spr.y = 100
    spr.ox = 0
    spr.oy = 0
    spr.r = 0
    spr.depConst = 115

crossVX = 0
crossVY = 0
crossDepConst = 8
   
mouse = {}
   

function love.load()
    
end

function love.update(dt)
    --Control of main spr
    SprControl(dt)
 
    --Faux
    crossCenterX = spr.x + spr.ox
    crossCenterY = spr.y + spr.oy
    
    --Mouse position for Debuging
    mouse.x, mouse.y = love.mouse.getPosition()

end

function love.draw()
    -- II- AFFICHER le sprite
    --love.graphics.draw(bg, 0, 0)
    love.graphics.draw(spr.img, spr.x, spr.y, math.rad(spr.r), 1, 1, spr.ox, spr.oy)
    
    --draw a red cross on img.ox & oy
    love.graphics.setColor(255,0,0)
    love.graphics.line(crossCenterX-5, crossCenterY-5, crossCenterX+5, crossCenterY+5)
    love.graphics.line(crossCenterX+5, crossCenterY-5, crossCenterX-5, crossCenterY+5)
    love.graphics.rectangle("fill", 250, 250, 10, 10)
    --Reset the color choice of "setColor()"
    love.graphics.reset()

    --############# DEBUG PRINT ##################
    love.graphics.print("ox: "..spr.ox, 600, 10)
    love.graphics.print("oy: "..spr.oy, 600, 20)
    love.graphics.print("x: "..spr.x, 600, 30)
    love.graphics.print("y: "..spr.y, 600, 40)
    love.graphics.print("r en degrés: "..spr.r, 600, 60)
    --Print of Mouse Pos Debuggin
    if mouse.x ~= nil and mouse.y ~= nil then
        love.graphics.print("Mouse X: "..mouse.x, 600, 80)
        love.graphics.print("Mouse Y: "..mouse.y, 600, 90)
    end


end

--Permit Game Extinction
function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end  
end

function SprControl(pDT)
    --SPR POS INPUTS
    if love.keyboard.isDown("q") then 
        spr.x = spr.x - spr.depConst * pDT
    end
    if love.keyboard.isDown("d") then 
        spr.x = spr.x + spr.depConst * pDT
    end
    if love.keyboard.isDown("z") then 
        spr.y = spr.y - spr.depConst * pDT
    end
    if love.keyboard.isDown("s") then 
        spr.y = spr.y + spr.depConst * pDT
    end

    --Rotation Angle control
    if love.keyboard.isDown("r") then 
        spr.r = spr.r + 5
        if spr.r > 360 then spr.r = 0 elseif spr.r < 0 then spr.r = 360 end
    end

    --SPR ORIGIN PTS INPUTS
    if love.keyboard.isDown("left") then 
        spr.ox = spr.ox - crossDepConst 
    end
    if love.keyboard.isDown("right") then 
        spr.ox = spr.ox + crossDepConst 
    end
    if love.keyboard.isDown("up") then 
        spr.oy = spr.oy - crossDepConst 
    end
    if love.keyboard.isDown("down") then 
        spr.oy = spr.oy + crossDepConst 
    end    

end



