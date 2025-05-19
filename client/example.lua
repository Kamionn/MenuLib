-- Exemple d'utilisation de MenuLib
local function OpenExampleMenu()
    local menu = exports.MenuLib:CreateMenuBuilder("Menu Principal")
        :theme("dark")
        :addButton("Option 1", function() print("Option 1 !") end)
        :addToggle("Godmode", function(val) print("Godmode:", val) end, false)
        :addSlider("Vitesse", function(val) print("Vitesse:", val) end, 0, 100, 50)
        :addSelect("Météo", function(val) print("Météo:", val) end, { "Clair", "Pluie", "Neige" }, "Clair")
        :addSubMenu("Sous-menu", function(sub)
            sub:addButton("Retour", function() print("Retour !") end)
            sub:addToggle("Option dans sous-menu", function(val) print("Sous-menu:", val) end, true)
        end)
        :open()
end

-- Commande pour ouvrir le menu exemple
RegisterCommand("menuexemple", function()
    OpenExampleMenu()
end)

-- Gestion des actions du menu
RegisterNetEvent("MenuLib:Action")
AddEventHandler("MenuLib:Action", function(action, value)
    if action == "opt1_action" then
        print("Option 1 sélectionnée")
    elseif action == "godmode_toggle" then
        print("Godmode: " .. tostring(value))
    elseif action == "speed_set" then
        print("Vitesse définie à: " .. value)
    elseif action == "weather_set" then
        print("Météo définie à: " .. value)
    elseif action == "back" then
        print("Retour au menu principal")
    elseif action == "sub_opt" then
        print("Option sous-menu: " .. tostring(value))
    end
end)

exports.MenuLib:OpenMenu({
    title = "Menu rapide",
    items = { ... },
    config = { theme = "dark" }
}, {
    opt1_action = function() print("Action 1 !") end,
    godmode_toggle = function(val) print("Godmode:", val) end,
    -- etc.
}) 