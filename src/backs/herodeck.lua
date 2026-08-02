SMODS.Back {
    key = "thehdeck",
    atlas = "trobala_decks",
    pos = {x=0,y=0},
    apply = function(self)
        for k, v in pairs(G.P_CENTERS) do
            if v.set == "Joker" and not v.mod then
                v.in_pool = function(self)
                    return false
                end
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                local hero = SMODS.add_card({
                    key = "j_qwektb_hero",
                })
                hero:set_eternal(true)
                G.jokers.config.card_limit = G.jokers.config.card_limit + GLOBALS.inventory_slots
                return true
            end
        }))
        
    end
}