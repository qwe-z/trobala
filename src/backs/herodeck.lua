SMODS.Back {
    key = "thehdeck",
    atlas = "trobala_decks",
    pos = {x=0,y=0},
    apply = function(self)
        G.P_CENTERS.p_buffoon_normal_1.weight = 0
        G.P_CENTERS.p_buffoon_jumbo_1.weight = 0
        G.P_CENTERS.p_buffoon_mega_1.weight = 0

        G.P_CENTERS.p_buffoon_normal_2.weight = 0

        G.P_CENTERS.p_spectral_normal_1.weight = 0
        G.P_CENTERS.p_spectral_jumbo_1.weight = 0
        G.P_CENTERS.p_spectral_mega_1.weight = 0

        G.P_CENTERS.p_spectral_normal_2.weight = 0

        G.P_CENTERS.p_standard_normal_1.weight = 0
        G.P_CENTERS.p_standard_jumbo_1.weight = 0
        G.P_CENTERS.p_standard_mega_1.weight = 0

        G.P_CENTERS.p_standard_normal_2.weight = 0
        G.P_CENTERS.p_standard_jumbo_2.weight = 0
        G.P_CENTERS.p_standard_mega_2.weight = 0

        G.P_CENTERS.p_standard_normal_3.weight = 0

        G.P_CENTERS.p_standard_normal_4.weight = 0

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