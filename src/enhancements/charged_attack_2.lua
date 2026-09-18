SMODS.Enhancement {
    key = 'chargedattack2',
    atlas = 'trobala_enhancements',
    pos = {x=0,y=0},
    config = {bonus=1000},
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return {vars={card.ability.bonus}}
    end,
}