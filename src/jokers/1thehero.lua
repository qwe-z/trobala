SMODS.Joker {
    key = 'hero',
    atlas = 'trobala_jokers',
    pos = {x=0,y=0},
    config = {
    extra = {
        slots = GLOBALS.inventory_slots,
        stamina = GLOBALS.stamina,
    }
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
        if context.ante_end then
            GLOBALS.inventory_slots = GLOBALS.inventory_slots + 1
            G.jokers.config.card_limit = G.jokers.config.card_limit + GLOBALS.inventory_increment
        end
    end,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
        }
      }
    end,
}