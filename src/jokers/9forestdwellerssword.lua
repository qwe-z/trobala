SMODS.Joker {
    key = 'forestdwellerssword',
    atlas = 'trobala_jokers',
    pos = {x=1,y=0},
    config = {
    extra = {
      extra_hands = 0,
      mult = 22,
      durability = 27
    }
    },
    rarity = 2,
    cost = 7,
    discovered = true,
    in_pool = function(self)
      return true, {allow_duplicates = true}
    end,
    calculate = function(self, card, context)
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
      if not context.blind_defeated and context.after then
        for _, i in ipairs(G.play.cards) do
          if SMODS.has_enhancement(i,'m_qwektb_chargedattack2') then
            card.ability.extra.extra_hands = card.ability.extra.extra_hands + 1
            ease_hands_played(1)
          end
        end
      end
    end,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult,
          card.ability.extra.durability,
        }
      }
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.extra_hands
        ease_hands_played(-card.ability.extra.extra_hands)
        card.ability.extra.extra_hands = 0
    end
}