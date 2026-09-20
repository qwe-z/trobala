SMODS.Joker {
    key = 'zorasword',
    atlas = 'trobala_jokers',
    pos = {x=1,y=0},
    config = {
    extra = {
      mult = 15,
      durability = 27,
      hand_size_increase = 1,
      increase_size = 0
    }
    },
    rarity = 2,
    cost = 7,
    discovered = true,
    in_pool = function(self)
      return true, {allow_duplicates = true}
    end,
    calculate = function(self, card, context)
      if context.after and context.main_eval and not context.blueprint then
        G.hand:change_size(card.ability.extra.hand_size_increase)
        card.ability.extra.increase_size = card.ability.extra.increase_size + card.ability.extra.hand_size_increase
      end
      if context.blind_defeated and not context.blueprint then
        G.hand:change_size(-card.ability.extra.increase_size)
        card.ability.extra.increase_size = 0
      end
      if context.joker_main then
        return {
          mult = card.ability.extra.mult,
        }
      end
      if context.after and context.main_eval and not context.blueprint then
        card.ability.extra.durability = card.ability.extra.durability - 1
        if card.ability.extra.durability <= 0 then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				blockable = false,
				func = function()
					G.jokers:remove_card(card)
					card:remove()
					card = nil
					return true
				end,
			}))
			return {
              message = "destroyed",
            }      
				end
      end
    end,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult,
          card.ability.extra.durability,
          card.ability.extra.increase_size
        }
      }
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.increase_size)
    end
}