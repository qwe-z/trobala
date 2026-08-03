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

SMODS.Atlas {
    key = "trobala_charge",
    path = "trobala_charge.png",
    px = 71,
    py = 95
}

GLOBALS = {}
GLOBALS.inventory_slots = -3
GLOBALS.inventory_increment = 1
GLOBALS.stamina = 100

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

local backs_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs")
for _, file in ipairs(backs_src) do
    assert(SMODS.load_file("src/backs/" .. file))()
end

local enhancements_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/enhancements")
for _, file in ipairs(enhancements_src) do
    assert(SMODS.load_file("src/enhancements/" .. file))()
end

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
}