GLOBALS = {}
GLOBALS.inventory_slots = -3
GLOBALS.inventory_increment = 1
GLOBALS.stamina = 100

SMODS.Back {
    key = "thehdeck",
    atlas = "trobala_decks",
    pos = {x=0,y=0},
    config = {ante_scaling=3},
    apply = function(self)
        SMODS.change_booster_limit(-2)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.tarot_rate = 0
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                local cnt = 0
                for _, i in ipairs(G.deck.cards) do
                    if cnt <= 40 then
                      i:set_ability(G.P_CENTERS.m_qwektb_basicattack, nil, true)
                    else 
                        i:set_ability(G.P_CENTERS.m_qwektb_chargedattack1, nil, true)
                    end
                    cnt = cnt + 1
                end
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
local atp = SMODS.add_to_pool
        function SMODS.add_to_pool(prototype_obj, args)
        local ret = atp(prototype_obj, args)

        if prototype_obj.set == 'Joker' and not prototype_obj.original_mod and args.source and args.source == 'sho' then
        ret = false
        end

        return ret
        end

        local cc = create_card
        function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append, extra)
        if forced_key then
        G.GAME.current_forced_key = forced_key
        end
        local ret = cc(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append, extra)
        G.GAME.current_forced_key = nil
        return ret
        end