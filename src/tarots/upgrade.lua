SMODS.Consumable {
    key = 'upgrade',
    atlas = "trobala_consumables",
    discovered = true,
    pos = {x=0,y=0},
    config = {max_highlighted=2},
    set = "Tarot",
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        local rightmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x > rightmost.T.x then
                rightmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.hand.highlighted[i] ~= rightmost then
                        SMODS.destroy_cards(G.hand.highlighted[i])
                    else
                        if SMODS.has_enhancement(G.hand.highlighted[i],'m_qwektb_basicattack') then
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_qwektb_chargedattack1, nil, true)
                        elseif SMODS.has_enhancement(G.hand.highlighted[i],'m_qwektb_chargedattack1') then
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_qwektb_chargedattack2, nil, true)
                        end
                    end
                    return true
                end
            }))
        end
    end,
    can_use = function(self, card)
        return true
    end
}