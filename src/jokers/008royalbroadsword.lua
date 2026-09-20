SMODS.Joker {
    key = 'royalbroadsword',
    atlas = 'trobala_jokers',
    pos = {x=2,y=0},
    config = {
    extra = {
      mult = 36,
      durability = 36,
      repetitions = 0,
      odds = 2,
      max_repetitions = 10
    }
    },
    rarity = 3,
    cost = 10,
    discovered = true,
    in_pool = function(self)
      return true, {allow_duplicates = true}
    end,
    calculate = function(self, card, context)
      if context.retrigger_joker_check
        and context.other_card == card
        and not context.retrigger_joker 
        then
        card.ability.extra.repetitions = 0
        while SMODS.pseudorandom_probability(card, 'qwektb_royalbroadsword', 1, card.ability.extra.odds) and card.ability.extra.repetitions < card.ability.extra.max_repetitions do
          card.ability.extra.repetitions = card.ability.extra.repetitions + 1
        end
        return {
          repetitions = card.ability.extra.repetitions,
          message = localize('k_again_ex')
        }
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
      local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'qwektb_royalbroadsword')
      return {
        vars = {
          card.ability.extra.mult,
          card.ability.extra.durability,
          card.ability.extra.odds,
          card.ability.extra.max_repetitions,
        }
      }
    end
}