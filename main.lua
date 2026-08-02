SMODS.Atlas {
    key = "trobala_jokers",
    path = "trobala_jokers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "trobala_decks",
    path = "trobala_decks.png",
    px = 71,
    py = 95
}

GLOBALS = {}
GLOBALS.inventory_slots = -3
GLOBALS.inventory_increment = 1
GLOBALS.stamina = 100

GLOBALS.wooden_stick_base_durability = 3
GLOBALS.wooden_stick_mult = 10

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

local backs_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs")
for _, file in ipairs(backs_src) do
    assert(SMODS.load_file("src/backs/" .. file))()
end

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
}