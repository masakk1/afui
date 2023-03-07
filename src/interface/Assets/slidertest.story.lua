return function(target)
    
    local loop = true

    local slider = require(script.Parent.slidertest)
    slider.Body.Parent = target

    task.spawn(function()
        local n = 0
        while loop do
            task.wait(.25)
            slider:Update(n)
            n += 0.05
        end        
    end)

    return function()
        loop = false
        slider:Destroy()
    end

end