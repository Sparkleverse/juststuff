if GetObjectName(myHero) ~= "Vayne" then return end

local ver = "0.01"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        print("New version found! " .. data)
        print("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Sparkleverse/juststuff/master/SkinChanger.lua", SCRIPT_PATH .. "SkinChanger.lua", function() print("Update Complete, please 2x F6!") return end)
    end
end
GetWebResultAsync("https://raw.githubusercontent.com/Sparkleverse/juststuff/master/SkinChanger.version", AutoUpdate)

require ("OpenPredict")
require ("MapPositionGOS")
require ("ChallengerCommon")


local VayneMenu = Menu("Vayne", "Vayne")

--Skin Changer
VayneMenu:SubMenu("Skin Changer", "Skin Changer")

local skinMeta = {["Vayne"] = {"Classic", "Vindicator", "Aristocrat", "DragonSlayer", "Heartseeker", "SKT T1", "Arclight", "DragonSlayer Green", "DragonSlayer Red", "DragonSlayer Blue", "SoulStealer"}}
VayneMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skin List", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
VayneMenu.SkinChanger.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end	

--AYYYYYYYY
print("Hope you enjoy the Skin Changer; Have Fun " ..myHero.name.. " :^>")	
