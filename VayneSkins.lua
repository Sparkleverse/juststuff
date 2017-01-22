--if GetObjectName(myHero) ~= "Vayne" then return end
--if GetObjectName(myHero) == "Vayne" or GetObjectName(myHero) == "Bard" then return end

local ver = "0.02"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        print("New version found! " .. data)
        print("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Sparkleverse/juststuff/master/VayneSkins.lua", SCRIPT_PATH .. "VayneSkins.lua", function() print("Update Complete, please 2x F6!") return end)
    end
end
GetWebResultAsync("https://raw.githubusercontent.com/Sparkleverse/juststuff/master/VayneSkins.version", AutoUpdate)

require ("OpenPredict")
require ("MapPositionGOS")
require ("ChallengerCommon")


--[[local SkinMenu = Menu("Vayne", "Vayne")
--Skin Changer
SkinMenu:SubMenu("SkinChanger", "SkinChanger")]]
local SkinMenu = Menu("SkinChanger", "SkinChanger")


local skinMeta = {["Bard"] = {"Classic", "Elderwood", "Snowday", "Bard"}, 
    ["Vayne"] = {"Classic", "Vindicator", "Aristocrat", "DragonSlayer", "Heartseeker", "SKT T1", "Arclight", "DragonSlayer Green", "DragonSlayer Red", "DragonSlayer Blue", "SoulStealer"},
    ["Jhin"] = {"Classic", "High Noon"}

--SkinMenu.SkinChanger
SkinMenu:DropDown('skin', myHero.charName.. " Skin List", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
--SkinMenu.SkinChanger
--if GetObjectName(myHero) == "Vayne" then
    SkinMenu.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
--end

--Hope you enjoyed reading this script in github. It's pretty simple.
print("Hope you enjoy the Skin Changer V:" ..ver.. "; Enjoy " ..myHero.name.. "! :^>")	
