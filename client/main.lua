
function readJsonFile(filePath)

    local resourceName = GetCurrentResourceName()
    local jsonData = LoadResourceFile(resourceName, filePath)
    
    if not jsonData then
        error("Could not open file " .. filePath)
    end

    return jsonData
end

local jsonData = readJsonFile("json/sounds.json")

local sounds, pos, err = json.decode(jsonData, 1, nil)
if err then
    error("Error while decoding JSON: " .. err)
end


local MainMenu = RageUI.CreateMenu(Locales[Config.Language].title, Locales[Config.Language].sub_title, 0 , 0 , false, false, 37, 247, 146, 255);
MainMenu.EnableMouse = Config.EnableMouse;

function RageUI.PoolMenus:SoundPlayer()
	MainMenu:IsVisible(function(Items)
        
        for i, sound in pairs(json.decode(jsonData, 1, nil)) do
		    Items:AddButton(sound.AudioName, sound.AudioRef or false, { IsDisabled = false }, function(onSelected)
		    	if onSelected then
		    		Citizen.CreateThread(function()
		    			Citizen.Wait(200)
		    			PlaySoundFromCoord(1, sound.AudioName, GetEntityCoords(PlayerPedId()), sound.AudioRef == "0" and tonumber(sound.AudioRef) or sound.AudioRef , Config.IsNetwork, Config.Range, false)
		    		end)
		    	end
		    end, _)
        end

	end, function() end)
end


RegisterCommand(Config.Command, function()
    RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
end)
