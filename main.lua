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
    key = "trobala_enhancements",
    path = "trobala_enhancements.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "trobala_consumables",
    path = "trobala_consumables.png",
    px = 71,
    py = 95
}

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

local backs_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs")
for _, file in ipairs(backs_src) do
    assert(SMODS.load_file("src/backs/" .. file))()
end

local tarots_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/tarots")
for _, file in ipairs(tarots_src) do
    assert(SMODS.load_file("src/tarots/" .. file))()
end

local enhancements_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/enhancements")
for _, file in ipairs(enhancements_src) do
    assert(SMODS.load_file("src/enhancements/" .. file))()
end

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
}