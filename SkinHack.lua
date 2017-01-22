-- Thanks to these 2 wonderful people for helping me out! Love you guys
---- Jouzuna
---- Scortch
-- I really appreciated the help! ^w^


--if GetObjectName(myHero) ~= "Vayne" then return end
--if GetObjectName(myHero) == "Vayne" or GetObjectName(myHero) == "Bard" then return end

local ver = "0.02"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        print("New version found! " .. data)
        print("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Sparkleverse/juststuff/master/SkinHack.lua", SCRIPT_PATH .. "SkinHack.lua", function() print("Update Complete, please 2x F6!") return end)
    end
end
GetWebResultAsync("https://raw.githubusercontent.com/Sparkleverse/juststuff/master/SkinHack.version", AutoUpdate)

require ("OpenPredict")
require ("MapPositionGOS")
require ("ChallengerCommon")


--[[local SkinMenu = Menu("Vayne", "Vayne")
--Skin Changer
SkinMenu:SubMenu("SkinChanger", "SkinChanger")]]
local SkinMenu = Menu("SkinChanger", "SkinChanger")


--[[local skinMeta = {["Bard"] = {"Classic", "Elderwood", "Bloom Marigold", "Bloom Ivy", "Bloom Sage", "Snow Day", "Bard Bard"}, 
    ["Jhin"] = {"Classic", "High Noon"}, 
    ["Khazix"] = {"Classic", "Mecha", "GotS (Broken Claws ATM)", "Death Blossom"},
    ["Vayne"] = {"Classic", "Vindicator", "Aristocrat", "DragonSlayer", "Heartseeker", "SKT T1", "Arclight", "DragonSlayer Green", "DragonSlayer Red", "DragonSlayer Blue", "SoulStealer"},
    ["Veigar"] = {"Classic", "White Mage", "Curling", "Greybeard", "Leprechaun", "Baron Von", "Superb Villain", "Bad Santa", "Final Boss"},
    ["Vi"] = {"Classic", "Neon Strike", "Officer", "Debonair", "Demon", "Warring Kingdoms"},
	["Viktor"] = {"Classic", "Full Machine", "Prototype", "Creator"}}]]

-- Cleaned Up. This guy helped me out so much: Jouzuna
local skinMeta = {
	["Aatrox"] = { "default", "Justicar Aatrox", "Mecha Aatrox", "Sea Hunter Aatrox" }, 
	["Ahri"] = { "default", "Dynasty Ahri", "Midnight Ahri", "Foxfire Ahri", "Popstar Ahri", "Challenger Ahri", "Academy Ahri", "Arcade Ahri" }, 
	["Akali"] = { "default", "Stinger Akali", "Crimson Akali", "All-star Akali", "Nurse Akali", "Blood Moon Akali", "Silverfang Akali", "Headhunter Akali", "Sashimi Akali" }, 
	["Alistar"] = { "default", "Black Alistar", "Golden Alistar", "Matador Alistar", "Longhorn Alistar", "Unchained Alistar", "Infernal Alistar", "Sweeper Alistar", "Marauder Alistar", "SKT T1 Alistar" }, 
	["Amumu"] = { "default", "Pharaoh Amumu", "Vancouver Amumu", "Emumu", "Re-Gifted Amumu", "Almost-Prom King Amumu", "Little Knight Amumu", "Sad Robot Amumu", "Surprise Party Amumu", "Sewn Chaos Amumu" }, 
	["Anivia"] = { "default", "Team Spirit Anivia", "Bird of Prey Anivia", "Noxus Hunter Anivia", "Hextech Anivia", "Blackfrost Anivia", "Prehistoric Anivia" }, 
	["Annie"] = { "default", "Goth Annie", "Red Riding Annie", "Annie in Wonderland", "Prom Queen Annie", "Frostfire Annie", "Reverse Annie", "FrankenTibbers Annie", "Panda Annie", "Sweetheart Annie", "Hextech Annie" }, 
	["Ashe"] = { "default", "Freljord Ashe", "Sherwood Forest Ashe", "Woad Ashe", "Queen Ashe", "Amethyst Ashe", "Heartseeker Ashe", "Marauder Ashe", "PROJECT: Ashe" }, 
	["AurelionSol"] = { "default", "Ashen Lord Aurelion Sol" }, 
	["Azir"] = { "default", "Galactic Azir", "Gravelord Azir", "SKT T1 Azir", "Warring Kingdoms Azir" }, 
	["Bard"] = { "default", "Elderwood Bard", "Snow Day Bard", "Bard Bard" }, 
	["Blitzcrank"] = { "default", "Rusty Blitzcrank", "Goalkeeper Blitzcrank", "Boom Boom Blitzcrank", "Piltover Customs Blitzcrank", "Definitely Not Blitzcrank", "iBlitzcrank", "Riot Blitzcrank", "Battle Boss Blitzcrank", "Sewn Chaos Blitzcrank" }, 
	["Brand"] = { "default", "Apocalyptic Brand", "Vandal Brand", "Cryocore Brand", "Zombie Brand", "Spirit Fire Brand" }, 
	["Braum"] = { "default", "Dragonslayer Braum", "El Tigre Braum", "Braum Lionheart", "Santa Braum" }, 
	["Caitlyn"] = { "default", "Resistance Caitlyn", "Sheriff Caitlyn", "Safari Caitlyn", "Arctic Warfare Caitlyn", "Officer Caitlyn", "Headhunter Caitlyn", "Lunar Wraith Caitlyn" }, 
	["Camille"] = { "default", "Program Camille" }, 
	["Cassiopeia"] = { "default", "Desperada Cassiopeia", "Siren Cassiopeia", "Mythic Cassiopeia", "Jade Fang Cassiopeia" }, 
	["Chogath"] = { "default", "Nightmare Cho'Gath", "Gentleman Cho'Gath", "Loch Ness Cho'Gath", "Jurassic Cho'Gath", "Battlecast Prime Cho'Gath", "Prehistoric Cho'Gath" }, 
	["Corki"] = { "default", "UFO Corki", "Ice Toboggan Corki", "Red Baron Corki", "Hot Rod Corki", "Urfrider Corki", "Dragonwing Corki", "Fnatic Corki", "Arcade Corki" }, 
	["Darius"] = { "default", "Lord Darius", "Bioforge Darius", "Woad King Darius", "Dunkmaster Darius", "Academy Darius" }, 
	["Diana"] = { "default", "Dark Valkyrie Diana", "Lunar Goddess Diana", "Infernal Diana" }, 
	["Draven"] = { "default", "Soul Reaver Draven", "Gladiator Draven", "Primetime Draven", "Pool Party Draven", "Beast Hunter Draven", "Draven Draven" }, 
	["DrMundo"] = { "default", "Toxic Dr. Mundo", "Mr. Mundoverse", "Corporate Mundo", "Mundo Mundo", "Executioner Mundo", "Rageborn Mundo", "TPA Mundo", "Pool Party Mundo", "El Macho Mundo" }, 
	["Ekko"] = { "default", "Sandstorm Ekko", "Academy Ekko", "PROJECT: Ekko" }, 
	["Elise"] = { "default", "Death Blossom Elise", "Victorious Elise", "Blood Moon Elise", "SKT T1 Elise" }, 
	["Evelynn"] = { "default", "Shadow Evelynn", "Masquerade Evelynn", "Tango Evelynn", "Safecracker Evelynn" }, 
	["Ezreal"] = { "default", "Nottingham Ezreal", "Striker Ezreal", "Frosted Ezreal", "Explorer Ezreal", "Pulsefire Ezreal", "TPA Ezreal", "Debonair Ezreal", "Ace of Spades Ezreal", "Arcade Ezreal" }, 
	["FiddleSticks"] = { "default", "Spectral Fiddlesticks", "Union Jack Fiddlesticks", "Bandito Fiddlesticks", "Pumpkinhead Fiddlesticks", "Fiddle Me Timbers", "Surprise Party Fiddlesticks", "Dark Candy Fiddlesticks", "Risen Fiddlesticks" }, 
	["Fiora"] = { "default", "Royal Guard Fiora", "Nightraven Fiora", "Headmistress Fiora", "PROJECT: Fiora", "Pool Party Fiora" }, 
	["Fizz"] = { "default", "Atlantean Fizz", "Tundra Fizz", "Fisherman Fizz", "Void Fizz", "Cottontail Fizz", "Super Galaxy Fizz" }, 
	["Galio"] = { "default", "Enchanted Galio", "Hextech Galio", "Commando Galio", "Gatekeeper Galio", "Debonair Galio" }, 
	["Gangplank"] = { "default", "Spooky Gangplank", "Minuteman Gangplank", "Sailor Gangplank", "Toy Soldier Gangplank", "Special Forces Gangplank", "Sultan Gangplank", "Captain Gangplank", "Dreadnova Gangplank" }, 
	["Garen"] = { "default", "Sanguine Garen", "Desert Trooper Garen", "Commando Garen", "Dreadknight Garen", "Rugged Garen", "Steel Legion Garen", "Rogue Admiral Garen", "Warring Kingdoms Garen" }, 
	["Gnar"] = { "default", "Dino Gnar", "Gentleman Gnar", "Snow Day Gnar", "El León Gnar" }, 
	["Gragas"] = { "default", "Scuba Gragas", "Hillbilly Gragas", "Santa Gragas", "Gragas, Esq.", "Vandal Gragas", "Oktoberfest Gragas", "Superfan Gragas", "Fnatic Gragas", "Gragas Caskbreaker" }, 
	["Graves"] = { "default", "Hired Gun Graves", "Jailbreak Graves", "Mafia Graves", "Riot Graves", "Pool Party Graves", "Cutthroat Graves", "Snow Day Graves" }, 
	["Hecarim"] = { "default", "Blood Knight Hecarim", "Reaper Hecarim", "Headless Hecarim", "Arcade Hecarim", "Elderwood Hecarim", "Worldbreaker Hecarim" }, 
	["Heimerdinger"] = { "default", "Alien Invader Heimerdinger", "Blast Zone Heimerdinger", "Piltover Customs Heimerdinger", "Snowmerdinger", "Hazmat Heimerdinger" }, 
	["Illaoi"] = { "default", "Void Bringer Illaoi" }, 
	["Irelia"] = { "default", "Nightblade Irelia", "Aviator Irelia", "Infiltrator Irelia", "Frostblade Irelia", "Order of the Lotus Irelia" }, 
	["Ivern"] = { "default", "Candy King Ivern" }, 
	["Janna"] = { "default", "Tempest Janna", "Hextech Janna", "Frost Queen Janna", "Victorious Janna", "Forecast Janna", "Fnatic Janna", "Star Guardian Janna" }, 
	["JarvanIV"] = { "default", "Commando Jarvan IV", "Dragonslayer Jarvan IV", "Darkforge Jarvan IV", "Victorious Jarvan IV", "Warring Kingdoms Jarvan IV", "Fnatic Jarvan IV" }, 
	["Jax"] = { "default", "The Mighty Jax", "Vandal Jax", "Angler Jax", "PAX Jax", "Jaximus", "Temple Jax", "Nemesis Jax", "SKT T1 Jax", "Warden Jax" }, 
	["Jayce"] = { "default", "Full Metal Jayce", "Debonair Jayce", "Forsaken Jayce", "Jayce Brighthammer" }, 
	["Jhin"] = { "default", "High Noon Jhin" }, 
	["Jinx"] = { "default", "Mafia Jinx", "Firecracker Jinx", "Slayer Jinx", "Star Guardian Jinx" }, 
	["Kalista"] = { "default", "Blood Moon Kalista", "Championship Kalista", "SKT T1 Kalista" }, 
	["Karma"] = { "default", "Sun Goddess Karma", "Sakura Karma", "Traditional Karma", "Order of the Lotus Karma", "Warden Karma", "Winter Wonder Karma" }, 
	["Karthus"] = { "default", "Phantom Karthus", "Statue of Karthus", "Grim Reaper Karthus", "Pentakill Karthus", "Fnatic Karthus", "Karthus Lightsbane" }, 
	["Kassadin"] = { "default", "Festival Kassadin", "Deep One Kassadin", "Pre-Void Kassadin", "Harbinger Kassadin", "Cosmic Reaver Kassadin" }, 
	["Katarina"] = { "default", "Mercenary Katarina", "Red Card Katarina", "Bilgewater Katarina", "Kitty Cat Katarina", "High Command Katarina", "Sandstorm Katarina", "Slay Belle Katarina", "Warring Kingdoms Katarina", "PROJECT: Katarina" }, 
	["Kayle"] = { "default", "Silver Kayle", "Viridian Kayle", "Unmasked Kayle", "Battleborn Kayle", "Judgment Kayle", "Aether Wing Kayle", "Riot Kayle", "Iron Inquisitor Kayle" }, 
	["Kennen"] = { "default", "Deadly Kennen", "Swamp Master Kennen", "Karate Kennen", "Kennen M.D.", "Arctic Ops Kennen", "Blood Moon Kennen" }, 
	["Khazix"] = { "default", "Mecha Kha'Zix", "Guardian of the Sands Kha'Zix", "Death Blossom Kha'Zix" }, 
	["Kindred"] = { "default", "Shadowfire Kindred", "Super Galaxy Kindred" }, 
	["Kled"] = { "default", "Sir Kled" }, 
	["KogMaw"] = { "default", "Caterpillar Kog'Maw", "Sonoran Kog'Maw", "Monarch Kog'Maw", "Reindeer Kog'Maw", "Lion Dance Kog'Maw", "Deep Sea Kog'Maw", "Jurassic Kog'Maw", "Battlecast Kog'Maw" }, 
	["Leblanc"] = { "default", "Wicked LeBlanc", "Prestigious LeBlanc", "Mistletoe LeBlanc", "Ravenborn LeBlanc", "Elderwood LeBlanc" }, 
	["LeeSin"] = { "default", "Traditional Lee Sin", "Acolyte Lee Sin", "Dragon Fist Lee Sin", "Muay Thai Lee Sin", "Pool Party Lee Sin", "SKT T1 Lee Sin", "Knockout Lee Sin" }, 
	["Leona"] = { "default", "Valkyrie Leona", "Defender Leona", "Iron Solari Leona", "Pool Party Leona", "PROJECT: Leona", "Barbecue Leona" }, 
	["Lissandra"] = { "default", "Bloodstone Lissandra", "Blade Queen Lissandra", "Program Lissandra" }, 
	["Lucian"] = { "default", "Hired Gun Lucian", "Striker Lucian", "PROJECT: Lucian", "Heartseeker Lucian" }, 
	["Lulu"] = { "default", "Bittersweet Lulu", "Wicked Lulu", "Dragon Trainer Lulu", "Winter Wonder Lulu", "Pool Party Lulu", "Star Guardian Lulu" }, 
	["Lux"] = { "default", "Sorceress Lux", "Spellthief Lux", "Commando Lux", "Imperial Lux", "Steel Legion Lux", "Star Guardian Lux", "Elementalist Lux" }, 
	["Malphite"] = { "default", "Shamrock Malphite", "Coral Reef Malphite", "Marble Malphite", "Obsidian Malphite", "Glacial Malphite", "Mecha Malphite", "Ironside Malphite" }, 
	["Malzahar"] = { "default", "Vizier Malzahar", "Shadow Prince Malzahar", "Djinn Malzahar", "Overlord Malzahar", "Snow Day Malzahar" }, 
	["Maokai"] = { "default", "Charred Maokai", "Totemic Maokai", "Festive Maokai", "Haunted Maokai", "Goalkeeper Maokai", "Meowkai", "Victorious Maokai" }, 
	["MasterYi"] = { "default", "Assassin Master Yi", "Chosen Master Yi", "Ionia Master Yi", "Samurai Yi", "Headhunter Master Yi", "PROJECT: Yi" }, 
	["MissFortune"] = { "default", "Cowgirl Miss Fortune", "Waterloo Miss Fortune", "Secret Agent Miss Fortune", "Candy Cane Miss Fortune", "Road Warrior Miss Fortune", "Mafia Miss Fortune", "Arcade Miss Fortune", "Captain Fortune", "Pool Party Miss Fortune" }, 
	["MonkeyKing"] = { "default", "Volcanic Wukong", "General Wukong", "Jade Dragon Wukong", "Underworld Wukong", "Radiant Wukong" }, 
	["Mordekaiser"] = { "default", "Dragon Knight Mordekaiser", "Infernal Mordekaiser", "Pentakill Mordekaiser", "Lord Mordekaiser", "King of Clubs Mordekaiser" }, 
	["Morgana"] = { "default", "Exiled Morgana", "Sinful Succulence Morgana", "Blade Mistress Morgana", "Blackthorn Morgana", "Ghost Bride Morgana", "Victorious Morgana", "Lunar Wraith Morgana", "Bewitching Morgana" }, 
	["Nami"] = { "default", "Koi Nami", "River Spirit Nami", "Urf the Nami-tee", "Deep Sea Nami" }, 
	["Nasus"] = { "default", "Galactic Nasus", "Pharaoh Nasus", "Dreadknight Nasus", "Riot K-9 Nasus", "Infernal Nasus", "Archduke Nasus", "Worldbreaker Nasus" }, 
	["Nautilus"] = { "default", "Abyssal Nautilus", "Subterranean Nautilus", "AstroNautilus", "Warden Nautilus", "Worldbreaker Nautilus" }, 
	["Nidalee"] = { "default", "Snow Bunny Nidalee", "Leopard Nidalee", "French Maid Nidalee", "Pharaoh Nidalee", "Bewitching Nidalee", "Headhunter Nidalee", "Warring Kingdoms Nidalee", "Challenger Nidalee" }, 
	["Nocturne"] = { "default", "Frozen Terror Nocturne", "Void Nocturne", "Ravager Nocturne", "Haunting Nocturne", "Eternum Nocturne", "Cursed Revenant Nocturne" }, 
	["Nunu"] = { "default", "Sasquatch Nunu", "Workshop Nunu", "Grungy Nunu", "Nunu Bot", "Demolisher Nunu", "TPA Nunu", "Zombie Nunu" }, 
	["Olaf"] = { "default", "Forsaken Olaf", "Glacial Olaf", "Brolaf", "Pentakill Olaf", "Marauder Olaf", "Butcher Olaf" }, 
	["Orianna"] = { "default", "Gothic Orianna", "Sewn Chaos Orianna", "Bladecraft Orianna", "TPA Orianna", "Winter Wonder Orianna", "Heartseeker Orianna" }, 
	["Pantheon"] = { "default", "Myrmidon Pantheon", "Ruthless Pantheon", "Perseus Pantheon", "Full Metal Pantheon", "Glaive Warrior Pantheon", "Dragonslayer Pantheon", "Slayer Pantheon", "Baker Pantheon" }, 
	["Poppy"] = { "default", "Noxus Poppy", "Lollipoppy", "Blacksmith Poppy", "Ragdoll Poppy", "Battle Regalia Poppy", "Scarlet Hammer Poppy", "Star Guardian Poppy" }, 
	["Quinn"] = { "default", "Phoenix Quinn", "Woad Scout Quinn", "Corsair Quinn", "Heartseeker Quinn" }, 
	["Rammus"] = { "default", "King Rammus", "Chrome Rammus", "Molten Rammus", "Freljord Rammus", "Ninja Rammus", "Full Metal Rammus", "Guardian of the Sands Rammus" }, 
	["RekSai"] = { "default", "Eternum Rek'Sai", "Pool Party Rek'Sai" }, 
	["Renekton"] = { "default", "Galactic Renekton", "Outback Renekton", "Bloodfury Renekton", "Rune Wars Renekton", "Scorched Earth Renekton", "Pool Party Renekton", "Prehistoric Renekton", "SKT T1 Renekton" }, 
	["Rengar"] = { "default", "Headhunter Rengar", "Night Hunter Rengar", "SSW Rengar" }, 
	["Riven"] = { "default", "Redeemed Riven", "Crimson Elite Riven", "Battle Bunny Riven", "Championship Riven", "Dragonblade Riven", "Arcade Riven", "Championship Riven 2016" }, 
	["Rumble"] = { "default", "Rumble in the Jungle", "Bilgerat Rumble", "Super Galaxy Rumble" }, 
	["Ryze"] = { "default", "Young Ryze", "Tribal Ryze", "Uncle Ryze", "Triumphant Ryze", "Professor Ryze", "Zombie Ryze", "Dark Crystal Ryze", "Pirate Ryze", "Ryze Whitebeard", "SKT T1 Ryze" }, 
	["Sejuani"] = { "default", "Sabretusk Sejuani", "Darkrider Sejuani", "Traditional Sejuani", "Bear Cavalry Sejuani", "Poro Rider Sejuani", "Beast Hunter Sejuani", "Sejuani Dawnchaser" }, 
	["Shaco"] = { "default", "Mad Hatter Shaco", "Royal Shaco", "Nutcracko", "Workshop Shaco", "Asylum Shaco", "Masked Shaco", "Wild Card Shaco" }, 
	["Shen"] = { "default", "Frozen Shen", "Yellow Jacket Shen", "Surgeon Shen", "Blood Moon Shen", "Warlord Shen", "TPA Shen" }, 
	["Shyvana"] = { "default", "Ironscale Shyvana", "Boneclaw Shyvana", "Darkflame Shyvana", "Ice Drake Shyvana", "Championship Shyvana", "Super Galaxy Shyvana" }, 
	["Singed"] = { "default", "Riot Squad Singed", "Hextech Singed", "Surfer Singed", "Mad Scientist Singed", "Augmented Singed", "Snow Day Singed", "SSW Singed", "Black Scourge Singed" }, 
	["Sion"] = { "default", "Hextech Sion", "Barbarian Sion", "Lumberjack Sion", "Warmonger Sion", "Mecha Zero Sion" }, 
	["Sivir"] = { "default", "Warrior Princess Sivir", "Spectacular Sivir", "Huntress Sivir", "Bandit Sivir", "PAX Sivir", "Snowstorm Sivir", "Warden Sivir", "Victorious Sivir" }, 
	["Skarner"] = { "default", "Sandscourge Skarner", "Earthrune Skarner", "Battlecast Alpha Skarner", "Guardian of the Sands Skarner" }, 
	["Sona"] = { "default", "Muse Sona", "Pentakill Sona", "Silent Night Sona", "Guqin Sona", "Arcade Sona", "DJ Sona", "Sweetheart Sona" }, 
	["Soraka"] = { "default", "Dryad Soraka", "Divine Soraka", "Celestine Soraka", "Reaper Soraka", "Order of the Banana Soraka", "Program Soraka" }, 
	["Swain"] = { "default", "Northern Front Swain", "Bilgewater Swain", "Tyrant Swain" }, 
	["Syndra"] = { "default", "Justicar Syndra", "Atlantean Syndra", "Queen of Diamonds Syndra", "Snow Day Syndra" }, 
	["TahmKench"] = { "default", "Master Chef Tahm Kench", "Urf Kench" }, 
	["Taliyah"] = { "default", "Freljord Taliyah" }, 
	["Talon"] = { "default", "Renegade Talon", "Crimson Elite Talon", "Dragonblade Talon", "SSW Talon" }, 
	["Taric"] = { "default", "Emerald Taric", "Armor of the Fifth Age Taric", "Bloodstone Taric", "Pool Party Taric" }, 
	["Teemo"] = { "default", "Happy Elf Teemo", "Recon Teemo", "Badger Teemo", "Astronaut Teemo", "Cottontail Teemo", "Super Teemo", "Panda Teemo", "Omega Squad Teemo", "Little Devil Teemo" }, 
	["Thresh"] = { "default", "Deep Terror Thresh", "Championship Thresh", "Blood Moon Thresh", "SSW Thresh", "Dark Star Thresh" }, 
	["Tristana"] = { "default", "Riot Girl Tristana", "Earnest Elf Tristana", "Firefighter Tristana", "Guerilla Tristana", "Buccaneer Tristana", "Rocket Girl Tristana", "Dragon Trainer Tristana", "Bewitching Tristana" }, 
	["Trundle"] = { "default", "Lil' Slugger Trundle", "Junkyard Trundle", "Traditional Trundle", "Constable Trundle", "Worldbreaker Trundle" }, 
	["Tryndamere"] = { "default", "Highland Tryndamere", "King Tryndamere", "Viking Tryndamere", "Demonblade Tryndamere", "Sultan Tryndamere", "Warring Kingdoms Tryndamere", "Nightmare Tryndamere", "Beast Hunter Tryndamere" }, 
	["TwistedFate"] = { "default", "PAX Twisted Fate", "Jack of Hearts Twisted Fate", "The Magnificent Twisted Fate", "Tango Twisted Fate", "High Noon Twisted Fate", "Musketeer Twisted Fate", "Underworld Twisted Fate", "Red Card Twisted Fate", "Cutpurse Twisted Fate" }, 
	["Twitch"] = { "default", "Kingpin Twitch", "Whistler Village Twitch", "Medieval Twitch", "Gangster Twitch", "Vandal Twitch", "Pickpocket Twitch", "SSW Twitch" }, 
	["Udyr"] = { "default", "Black Belt Udyr", "Primal Udyr", "Spirit Guard Udyr", "Definitely Not Udyr" }, 
	["Urgot"] = { "default", "Giant Enemy Crabgot", "Butcher Urgot", "Battlecast Urgot" }, 
	["Varus"] = { "default", "Blight Crystal Varus", "Arclight Varus", "Arctic Ops Varus", "Heartseeker Varus", "Varus Swiftbolt", "Dark Star Varus" }, 
	["Vayne"] = { "default", "Vindicator Vayne", "Aristocrat Vayne", "Dragonslayer Vayne", "Heartseeker Vayne", "SKT T1 Vayne", "Arclight Vayne", "Soulstealer Vayne" }, 
	["Veigar"] = { "default", "White Mage Veigar", "Curling Veigar", "Veigar Greybeard", "Leprechaun Veigar", "Baron Von Veigar", "Superb Villain Veigar", "Bad Santa Veigar", "Final Boss Veigar" }, 
	["Velkoz"] = { "default", "Battlecast Vel'Koz", "Arclight Vel'Koz", "Definitely Not Vel'Koz" }, 
	["Vi"] = { "default", "Neon Strike Vi", "Officer Vi", "Debonair Vi", "Demon Vi", "Warring Kingdoms Vi" }, 
	["Viktor"] = { "default", "Full Machine Viktor", "Prototype Viktor", "Creator Viktor" }, 
	["Vladimir"] = { "default", "Count Vladimir", "Marquis Vladimir", "Nosferatu Vladimir", "Vandal Vladimir", "Blood Lord Vladimir", "Soulstealer Vladimir", "Academy Vladimir" }, 
	["Volibear"] = { "default", "Thunder Lord Volibear", "Northern Storm Volibear", "Runeguard Volibear", "Captain Volibear", "El Rayo Volibear" }, 
	["Warwick"] = { "default", "Grey Warwick", "Urf the Manatee", "Big Bad Warwick", "Tundra Hunter Warwick", "Feral Warwick", "Firefang Warwick", "Hyena Warwick", "Marauder Warwick" }, 
	["Xerath"] = { "default", "Runeborn Xerath", "Battlecast Xerath", "Scorched Earth Xerath", "Guardian of the Sands Xerath" }, 
	["XinZhao"] = { "default", "Commando Xin Zhao", "Imperial Xin Zhao", "Viscero Xin Zhao", "Winged Hussar Xin Zhao", "Warring Kingdoms Xin Zhao", "Secret Agent Xin Zhao" }, 
	["Yasuo"] = { "default", "High Noon Yasuo", "PROJECT: Yasuo", "Blood Moon Yasuo" }, 
	["Yorick"] = { "default", "Undertaker Yorick", "Pentakill Yorick" }, 
	["Zac"] = { "default", "Special Weapon Zac", "Pool Party Zac" }, 
	["Zed"] = { "default", "Shockblade Zed", "SKT T1 Zed", "PROJECT: Zed", "Championship Zed" }, 
	["Ziggs"] = { "default", "Mad Scientist Ziggs", "Major Ziggs", "Pool Party Ziggs", "Snow Day Ziggs", "Master Arcanist Ziggs" }, 
	["Zilean"] = { "default", "Old Saint Zilean", "Groovy Zilean", "Shurima Desert Zilean", "Time Machine Zilean", "Blood Moon Zilean" }, 
	["Zyra"] = { "default", "Wildfire Zyra", "Haunted Zyra", "SKT T1 Zyra" }}

--SkinMenu.SkinChanger
SkinMenu:DropDown('skin', myHero.charName.. " Skin List", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
--SkinMenu.SkinChanger
--if GetObjectName(myHero) == "Vayne" then
    SkinMenu.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
--end

-- Stop looking at my stuff Deftsu

--Hope you enjoyed reading this script in github. It's pretty simple, just really long. It could be rewritten.
print("Hope you enjoy the Skin Changer V:" ..ver.. "; Enjoy " ..myHero.name.. "! :^>")	
