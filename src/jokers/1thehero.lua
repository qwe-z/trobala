SMODS.Joker {
    key = 'hero',
    atlas = 'trobala_jokers',
    pos = {x=0,y=0},
    config = {
    extra = {
        stamina_limit = 100,
        stamina_gain = 20,
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
        if context.joker_main then
            card.ability.extra.cnt = 0
        end
    end,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
            stamina_limit = card.ability.extra.stamina_limit,
        }
      }
    end,
    add_to_deck = function(self, card, from_debuff)

    end,
}
