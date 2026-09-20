SMODS.Joker {
    key = 'hero',
    atlas = 'trobala_jokers',
    pos = {x=0,y=0},
    config = {
    extra = {
    },
    },
    rarity = 1,
    cost = 0,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = false,
    eternal_compat = true,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        --if context.blind_defeated and not context.blueprint then
        --end
        --end
        if context.ante_end and not context.blueprint and GLOBALS.inventory_slots < 10 then
            GLOBALS.inventory_slots = GLOBALS.inventory_slots + 1
            G.jokers.config.card_limit = G.jokers.config.card_limit + GLOBALS.inventory_increment
        end
        if G.GAME.current_round.hands_left == 0 and not context.blueprint then
            card.ability.extra.one = true
            table.remove(GLOBALS.hp)
            if #GLOBALS.hp == 0 then
                G.GAME.won = false
            else
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 2
                return {
                    saved = true,
                    message = '-1hp',
                    colour = G.C.RED
                }
            end
        end
        if G.GAME.current_round.hands_left > 0 and not context.blueprint then
            card.ability.extra.one = false
        end
    end,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
            table.concat(GLOBALS.hp," "),
        }
      }
    end,
    add_to_deck = function(self, card, from_debuff)

    end,
}
