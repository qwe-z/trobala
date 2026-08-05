SMODS.Consumable {
    key = 'arrow',
    atlas = 'trobala_consumables',
    discovered = true,
    pos = {x = 1, y =2},
    config = {
        extra = {
            damage = 0,
        }
    },
    set = 'Tarot',
    discoverd = true,
    use = function(self, card, area, copier)
    end,

    can_use = function(self, card)
        return true
    end
}