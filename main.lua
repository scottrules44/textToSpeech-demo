local textToSpeech = require "plugin.textToSpeech"
local json = require "json"
textToSpeech.init(function (e)
    print(json.encode(e))
 end)

timer.performWithDelay( 5000, function()
  print(json.encode(textToSpeech.getVoices()))
end )

local widget = require("widget")

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 0,0,1 )

local title = display.newText( {text = "Text To Speech Plugin", fontSize = 20} )
title.width, title.height = 300, 168
title.x, title.y = display.contentCenterX, 168*.5
title:setFillColor(1,1,1)
local sayHelloWorld
sayHelloWorld = widget.newButton( {
    x = display.contentCenterX,
    y = display.contentCenterY,
    id = "sayHelloWorld",
    labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
    label = "Say Hello World",
    onEvent = function ( e )
        if (e.phase == "ended") then
            textToSpeech.speak("Hello World, how you doing?", {volume=.8})
        end
    end
} )
