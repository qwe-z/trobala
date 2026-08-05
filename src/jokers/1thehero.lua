SMODS.Joker {
    key = 'hero',
    atlas = 'trobala_jokers',
    pos = {x=0,y=0},
    config = {
    extra = {
        stamina_limit = 100,
        stamina_gain = 20,

        cnt = 0,

        onechargestamina = 0,
        twochargestamina = 10,
        threechargestamina = 20,
        fourchargestamina = 30,
        fivechargestamina = 40,

        onecharge = 10,
        twocharge = 20,
        threecharge = 30,
        fourcharge = 40,
        fivecharge = 50,
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
        if context.blind_defeated and not context.blueprint then
            if GLOBALS.stamina < card.ability.extra.stamina_limit then
                GLOBALS.stamina = GLOBALS.stamina + card.ability.extra.stamina_gain
            end
            if GLOBALS.stamina < 100 then
                return {
                message = string.format("+%d STAMINA",card.ability.extra.stamina_gain),
                colour = G.C.GREEN
                }
            end
        end
        if context.ante_end and not context.blueprint then
            GLOBALS.inventory_slots = GLOBALS.inventory_slots + 1
            G.jokers.config.card_limit = G.jokers.config.card_limit + GLOBALS.inventory_increment
        end
        if context.joker_main then
            card.ability.extra.cnt = 0
            for _, i in ipairs(G.play.cards) do
                if SMODS.has_enhancement(i,'m_qwektb_charge') then
                    card.ability.extra.cnt = card.ability.extra.cnt + 1
                end
            end
            if card.ability.extra.cnt * 10 > GLOBALS.stamina then
                if GLOBALS.stamina == 40 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.fivechargestamina
                    return {
                        xmult = card.ability.extra.fivecharge,
                        message = string.format("-%d STAMINA",card.ability.extra.fivechargestamina),
                        colour = G.C.GREEN
                    }
                end
                if GLOBALS.stamina == 30 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.fourchargestamina
                    return {
                        xmult = card.ability.extra.fourcharge,
                        message = string.format("-%d STAMINA",card.ability.extra.fourchargestamina),
                        colour = G.C.GREEN
                    }
                end
                if GLOBALS.stamina == 20 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.threechargestamina
                    return {
                        mult = card.ability.extra.threecharge,
                        message = string.format("-%d STAMINA",card.ability.extra.threechargestamina),
                        colour = G.C.GREEN
                    }
                end
                if GLOBALS.stamina == 10 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.twochargestamina
                    return {
                        mult = card.ability.extra.twocharge,
                        message = string.format("-%d STAMINA",card.ability.extra.twochargestamina),
                        colour = G.C.GREEN
                    }
                end
                if GLOBALS.stamina == 0 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.onechargestamina
                    return {
                        mult = card.ability.extra.onecharge,
                        message = string.format("-%d STAMINA",card.ability.extra.onechargestamina),
                        colour = G.C.GREEN
                    }
                end
            else
                if card.ability.extra.cnt * 10 == 50 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.fivechargestamina
                    return {
                        xmult = card.ability.extra.fivecharge,
                        message = string.format("-%d STAMINA",card.ability.extra.fivechargestamina),
                        colour = G.C.GREEN
                    }
                end
                if card.ability.extra.cnt * 10 == 40 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.fourchargestamina
                    return {
                        xmult = card.ability.extra.fourcharge,
                        message = string.format("-%d STAMINA",card.ability.extra.fourchargestamina),
                        colour = G.C.GREEN
                    }
                end
                if card.ability.extra.cnt * 10 == 30 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.threechargestamina
                    return {
                        mult = card.ability.extra.threecharge,
                        message = string.format("-%d STAMINA",card.ability.extra.threechargestamina),
                        colour = G.C.GREEN
                    }
                end
                if card.ability.extra.cnt * 10 == 20 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.twochargestamina
                    return {
                        mult = card.ability.extra.twocharge,
                        message = string.format("-%d STAMINA",card.ability.extra.twochargestamina),
                        colour = G.C.GREEN
                    }
                end
                if card.ability.extra.cnt * 10 == 10 then
                    GLOBALS.stamina = GLOBALS.stamina - card.ability.extra.onechargestamina
                    return {
                        mult = card.ability.extra.onecharge,
                        message = string.format("-%d STAMINA",card.ability.extra.onechargestamina),
                        colour = G.C.GREEN
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
            GLOBALS.stamina
        }
      }
    end,

    add_to_deck = function(self, card, from_debuff)
        GLOBALS.stamina = 100
    end,
}