GLOBALS = {}
SMODS.Back {
    key = "thehdeck",
    atlas = "trobala_decks",
    pos = {x=0,y=0},
    config = {ante_scaling=3},
    apply = function(self)
        GLOBALS.inventory_slots = -3
        GLOBALS.inventory_increment = 1
        GLOBALS.hp = {"x","x","x"}
        GLOBALS.damage = 1

        G.GAME.planet_rate = 0
        G.GAME.playing_card_rate = 0
        G.GAME.banned_keys = {c_judgement=true,c_familiar=true,c_grim=true,c_incantation=true,c_wraith=true,c_sigil=true,c_ouija=true,c_soul=true,c_black_hole=true,
        p_buffoon_normal_1=true,p_buffoon_normal_2=true,p_buffoon_jumbo_1=true,p_buffoon_mega_1=true,
        tag_uncommon=true,tag_rare=true,tag_negative=true,tag_foil=true,tag_holographic=true,tag_polychrome=true,tag_buffoon=true,tag_top_up=true,
        p_celestial_normal_1=true,p_celestial_normal_2=true,p_celestial_normal_3=true,p_celestial_normal_4=true,p_celestial_jumbo_1=true,p_celestial_jumbo_2=true,
        p_celestial_mega_1=true,p_celestial_mega_2=true,
        p_standard_normal_1=true,p_standard_normal_2=true,p_standard_normal_3=true,p_standard_normal_4=true,p_standard_jumbo_1=true,p_standard_jumbo_2=true,
        p_standard_mega_1=true,p_standard_mega_2=true,
        v_magic_trick=true,v_illusion=true,v_telescope=true,v_observatory=true,v_omen_globe=true,
        --j_qwektb_hero=true
    }
        --SMODS.change_booster_limit(-2)
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