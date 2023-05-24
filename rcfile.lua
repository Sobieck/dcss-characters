##
## magus_ShadowRider38_sobieck.rc
################################################################################################
##
## BEGIN
################################################################################################
: rc_msg("Initializing magus_ShadowRider38_sobieck.rc ...")
: crawl.enable_more(false)


## RC FILE FROM ShadowRider38 who learned a lot from Yermak

# TEAMCAPTAIN MrDizzy

#tile_player_tile = tile:cat6

tile_font_crt_family = Lucida Console 
tile_font_stat_family = Lucida Console 
tile_font_msg_family = Lucida Console 
tile_font_lbl_family = Lucida Console
#msg_min_height = 7
#msg_max_height = 10
#view_max_height = 21
small_more = true
#msg_webtiles_height = 10

note_skill_levels = 1,3,6,9,12,15,18,21,24,27
note_chat_messages = true
dump_message_count = 50
dump_book_spells = false
travel_delay = -1
explore_delay = -1
rest_delay = -1
trapwalk_safe_hp = dart:20,needle:15,arrow:35,bolt:45,spear:40,axe:45,blade:95

{
local need_skills_opened = true
function ready()
  if you.turns() == 0 and need_skills_opened then
    need_skills_opened = false
    crawl.sendkeys("m")
  end

  if crawl.messages(5):find("You enter a gauntlet") and (you.god()=="Lugonu" or you.god()=="Fedhas" or you.god()=="Sif Muna") then
    crawl.mpr("Break the walls!")
  end

  fmore_early_threats()
  update_safe()
end

local safe = you.feel_safe()

function update_safe()
  local old_safe = safe
  safe = you.feel_safe()
  if not safe and old_safe then
    crawl.mpr("Danger!", "warning")
    crawl.more()
  end
end

local fmet = true
function fmore_early_threats()
  if you.xl() > 13 and fmet then
    crawl.setopt("force_more_message -= centaur.* comes? into view")
    crawl.setopt("force_more_message -= hydra.* comes? into view")
    crawl.setopt("force_more_message -= killer bee.* comes? into view")
    crawl.setopt("force_more_message -= electric eel.* comes? into view")
    fmet = false
  end
end

local aft = false
function toggle_autothrow()
  if aft then
    crawl.setopt("use_animations += beam, monster")
    crawl.setopt("autofight_throw = false")
    crawl.mpr("Autofight_throw is off.")
  else
    crawl.setopt("use_animations -= beam, monster")
    crawl.setopt("autofight_throw = true")
    crawl.mpr("Autofight_throw is on.")
  end
  aft = not aft
end

local cheiwalk = true
function toggle_cheiwalk()
  if cheiwalk then
    crawl.setopt("force_more_message -= comes? into view")
    crawl.mpr("Cheiwalk mode is off.")
  else
    crawl.setopt("force_more_message += comes? into view")
    crawl.mpr("Cheiwalk mode is on.")
  end
  cheiwalk = not cheiwalk
end

local mmores = false
function toggle_more_mores()
  if mmores then
    crawl.setopt("force_more_message -= Found")
    crawl.mpr("Less mores.")
  else
    crawl.setopt("force_more_message += Found")
    crawl.mpr("More mores.")
  end
  mmores = not mmores
end

local portalmode = false
function toggle_portal_mode()
  if portalmode then
    crawl.setopt("show_game_time = false")
    crawl.mpr("Portal mode is off.")
  else
    crawl.setopt("show_game_time = true")
    crawl.mpr("Portal mode is on.")
  end
  portalmode = not portalmode
end

local autorestmode = true
function toggle_autorest()
  if autorestmode then
    crawl.setopt("explore_auto_rest = false")
    crawl.mpr("Autorest mode is off.")
  else
    crawl.setopt("explore_auto_rest = true")
    crawl.mpr("Autorest mode is on.")
  end
  autorestmode = not autorestmode
end

local function autopickup(it, name)
  local class = it.class(true)
  local weap = items.equipped_at("Weapon")
  local shie = items.equipped_at("Shield")
  if it.is_useless then return false end
  if class == "armour" then
    local aux_slots = {cloak="Cloak", helmet="Helmet",
      gloves="Gloves", boots="Boots", shield="Shield"}
    st, _ = it.subtype()
    if aux_slots[st] == "Shield" then
      if (weap == nil or weap.hands == 1) and (shie == nil or it.branded) then
        return true
      end
    elseif aux_slots[st] ~= nil and items.equipped_at(aux_slots[st]) == nil then
      return true
    elseif st ~= "body" and it.branded then
      return true
    end 
  end
  return nil
end

add_autopickup_func(autopickup)
}


### Macros

macros += K1 \{-1018} \{27}

macros += K2 \{-268} +
macros += K2 \{-267} \{32}
macros += K2 \{-266} +
macros += K2 \{-265} .

macros += K3 \{-1018} \{27}

#macros += K4 . ,

macros += M \{-274} ===toggle_cheiwalk
macros += M \{-273} ===toggle_autothrow
macros += M \{-272} ===toggle_autorest
macros += M \{-269} zY
macros += M \{-268} Za+
macros += M \{-267} za\{32}
macros += M \{-266} f+
macros += M \{-265} f.
macros += M \{-250} zb
macros += M \{25} ===toggle_more_mores
macros += M \{4} \{5}
macros += M \{5} \{20}
macros += M ( [
macros += M \{-1016} \{9}
macros += M \{-1018} o
#macros += M . ,
macros += M [ (
macros += M ] )
macros += M z Z


### EN0N's Mini-Map Color Scheme

tile_upstairs_col = green
tile_downstairs_col = red
tile_branchstairs_col = #ffa500
tile_door_col = #c27149
tile_wall_col = #5a524c
tile_explore_horizon_col = #aaaaaa
tile_floor_col = #1e1b1a
tile_item_col = #1e1b1a
tile_feature_col = #d4be21
tile_plant_col = #4b6d39
tile_water_col = #0b5d79
tile_deep_water_col = #1212b3
tile_trap_col = #f447ff
tile_transporter_col = #ff5656
tile_transporter_landing_col = #59ff89
tile_lava_col = #5f0a00


use_animations -= hp, player, pickup, branch_entry
view_delay = 35
default_show_all_skills = true
default_manual_training = true
confirm_butcher = never
skill_focus = true
show_travel_trail = true
travel_one_unsafe_move = true
easy_floor_use = true
action_panel_show = false
show_game_time = false
show_god_gift = yes
cloud_status = true
simple_targeting = false
force_spell_targeter = eringya's noxious bog
force_ability_targeter = sanctuary, word of chaos, recite, elemental force, oozemancy, drain life, disaster area, corrupt, foxfire swarm
tile_web_mouse_control = false
tile_show_threat_levels =
fire_order = launcher, boomerang, rock, poisoned dart, javelin, stone

runrest_ignore_message += blood rots? away
runrest_ignore_message += Your icy armour
runrest_ignore_message += Your skin is crawling a little less
runrest_ignore_message += infusion is running out
runrest_ignore_message += shroud begins to fray
runrest_ignore_message += You feel.*sick
runrest_ignore_message += You howl as the wereblood boils in your veins
runrest_ignore_message += Your primal bloodlust
interrupt_eat =
runrest_safe_poison = 100:100
#interrupt_armour_on -= hp_loss
#interrupt_armour_off -= hp_loss
interrupt_memorise -= hp_loss
interrupt_memorise -= monster
autofight_stop = 40
explore_auto_rest = true
explore_stop = items,stairs,shops,altars,portals,branches,runed_doors
explore_stop += greedy_pickup_smart,artefacts
tile_show_demon_tier = true

menu_colour += cyan:brand weapon
menu_colour += cyan:enchant weapon
menu_colour += cyan:enchant armour
menu_colour += cyan:recharging
menu_colour += cyan:magic mapping
menu_colour += green:potions? of might
menu_colour += green:potions? of agility
menu_colour += green:potions? of brilliance
menu_colour += green:potions? of haste
menu_colour += green:potions? of resistance
menu_colour += green:potions? of berserk
menu_colour += cyan:wand of para
menu_colour += cyan:wand of conf
menu_colour += cyan:wand of poly
menu_colour += cyan:wand of ensl
menu_colour += cyan:wand of disi
menu_colour += cyan:wand of char
menu_colour += cyan:wand of mind

autoinscribe ^= scroll of silence:!r
#: if you.skill("Staves") < 5 then
#  autoinscribe += magical staff:!a
#: end


ae := autopickup_exceptions

# nullifying the effect of the most annoying 0.24 commit:
ae += >ring of (poi|resist cor|fli|see)
ae += >amulet of (the acr|fai|the gou|gua|har|mag|rag|ref|reg)

ae += >scrolls? of (amn|noise)
ae += >wand of rand
ae += >ring of (protection from (mag|fire|cold)|mag|ste|ice|fire|pos|wil|wiz)
ae += >ring of (dex|int|str)
ae ^= <potions? of (ambr|attr|lign|mut)
ae ^= <scrolls? of (immolation|vulnerability)
ae += <(curare|throwing net)
ae += <(lamp of fire|phial of floods|lightning rod|figurine|condenser vane)
ae ^= <tin of tremorstones
ae += <sack of spiders
ae += <phantom mirror
ae += <box of beasts
ae += <deck
ae += <assassin
ae += <god gift
ae += <artefact
ae += <magical staff
ae ^= >staff of

as := ability_slot

as ^= End Transfo: t
as ^= Evoke Invis: i
as ^= Turn Visibl: j
as ^= Evoke Fligh: l
as ^= Fly:         l
as ^= Stop Flying: m
as ^= Spit:        q
as ^= Breath:      q
as ^= Rolling:     r

ss := spell_slot

ss ^= Apportation: g
ss ^= Blink:       d
ss ^= Lesser Beck: e
ss ^= Portal Proj: J
ss ^= Teleport Ot: t
ss ^= Warp Weapon: W
ss ^= Passage of:  z
ss ^= Phase Shift: p
ss ^= Summon Fore: F
ss ^= ontrolled B: C
ss ^= Control Tel: k

ss ^= Song of Sla: y
ss ^= Missiles:    f
ss ^= Flight:      l
ss ^= Regeneratio: R
ss ^= Shroud of G: h
ss ^= Spectral We: W
ss ^= Ozocubu:     b
ss ^= Haste:       H

ss ^= Confus:      x
ss ^= Tukima's Da: t
ss ^= Invisibilit: i
ss ^= Enslavement: v
ss ^= Dazzling Sp: q

ss ^= Animate Ske: h
ss ^= Sublimation: Z
ss ^= Corpse Rot:  r
ss ^= Vampiric Dr: v
ss ^= Control Und: U
ss ^= Dispel Unde: u
ss ^= Animate Dea: E
ss ^= Borgnjor's : w

ss ^= Sticks to S: s
ss ^= Spider Form: O
ss ^= Ice Form:    I
ss ^= Blade Hands: u
ss ^= Statue Form: Y
ss ^= Dragon Form: T
ss ^= Irradiate:   Q

ss ^= Stone Skin:  s
ss ^= Passwall:    c
ss ^= Frozen Ramp: c
ss ^= Petrify:     p
ss ^= Lee's Rapid: l
ss ^= Summon Butt: B
ss ^= Aura of Abj: A
ss ^= Summon Ligh: L
ss ^= Freezing Cl: f
ss ^= Conjure Fla: j
ss ^= Mephitic Cl: m
ss ^= Olgreb's To: t
ss ^= Cure Poison: w
ss ^= Bolt:        w
ss ^= Fireball:    e

is := item_slot

#free (in trunk): abdehipCL (qzNSW)
is ^= ^stone:j
is ^= poisoned dart:k
is ^= (^|[0-9] )boomerang:t
is ^= silver boomerang:u
is ^= (^|[0-9] )javelin:v
is ^= large rock:w
is ^= silver javelin:x
is ^= curare:F
is ^= datura:G
is ^= atropa:J
is ^= dispersal:K
is ^= ring of protection from fire:f
is ^= ring of protection from cold:c
is ^= ring of protection from magic:m
is ^= ring of willpower:m
is ^= ring of positive energy:n
is ^= ring of poison resistance:o
is ^= ring of see invisible:s
is ^= ring of slaying:y
is ^= of resist corrosion:g
is ^= amulet of regeneration:r
is ^= blowgun:q
is ^= throwing net:Z
is ^= scroll of remove curse:W
is ^= scroll of identify:R
is ^= scroll of teleportation:T
is ^= scroll of blinking:B
is ^= scroll of magic map:M
is ^= potion of flight:l
is ^= potion of curing:Q
is ^= potion of haste:H
is ^= wand of acid:A
is ^= wand of digg:D
is ^= wand of ensl:E
is ^= wand of char:E
is ^= wand of iceb:I
is ^= wand of clou:O
is ^= wand of para:P
is ^= wand of scat:S
is ^= wand of flam:V
is ^= food:z
is ^= mirror:K
is ^= vane:O
is ^= box:X
is ^= sack:N
is ^= phial:U
is ^= lamp:Y
is ^= tin of t:Y


force_more_message -= You finish merging with the rock

#force_more_message += You have reached level
force_more_message += You fall through a shaft
force_more_message += You enter a teleport trap
force_more_message += You are suddenly yanked
force_more_message += interdimensional caravan
force_more_message += distant snort
force_more_message += Found a gateway leading out of the Abyss
force_more_message += Found a gateway leading deeper into the Abyss
force_more_message += Found .* abyssal rune of Zot
force_more_message += Careful!
force_more_message += You are starting to lose your buoyancy
force_more_message += You miscast Flight
#force_more_message += filled with .* inner flame
#force_more_message += grabs you
force_more_message += starts rolling
force_more_message += looks more exp
force_more_message += vile air hits you
force_more_message += engulfs you in water
force_more_message += breathes miasma
force_more_message += You feel your flesh start
force_more_message += Found * staircase leading down
force_more_message += You are engulfed in seething chaos
force_more_message += You are slowing down
force_more_message += You are confused
force_more_message += fire storm spell
force_more_message += Your guardian golem overheats
force_more_message += offers itself
force_more_message += volcano erupts
force_more_message += Uskayaw prepares the audience for your solo
force_more_message += Something reaches out for you
force_more_message += You become entangled in the net
force_more_message += wield.* blowgun
force_more_message += (the weather|forecast)
force_more_message += you cannot.* because
force_more_message += pie hits you
force_more_message += goes berserk
force_more_message += venomous gases
#force_more_message += vanishes in a puff
force_more_message += weaves a glowing orb
force_more_message += Your transformation is almost over
force_more_message += The ironbrand convoker begins to recite a word of recall
force_more_message += Something unseen opens the door
force_more_message += Your unholy channel is weakening
runrest_stop_message += Your unholy channel is weakening

force_more_message += centaur.* comes? into view
force_more_message += hydra.* comes? into view
#force_more_message += killer bee.* comes? into view
force_more_message += electric eel.* comes? into view

force_more_message += wielding.* distortion.* comes? into view
force_more_message += floating eye.* comes? into view
force_more_message += carrying a wand
force_more_message += serpent.* comes? into view
force_more_message += demonologist.* comes? into view
force_more_message += fiend.* comes? into view
force_more_message += tzitzi.* comes? into view
force_more_message += pandemonium lord.* comes? into view
force_more_message += cacodemon.* comes? into view
force_more_message += neqoxec.* comes? into view
force_more_message += wretched star.* comes? into view
force_more_message += shining eye.* comes? into view
force_more_message += zyme.* comes? into view
force_more_message += hellion.* comes? into view
force_more_message += tormentor.* comes? into view
force_more_message += orb.* of fire.* comes? into view

#force_more_message += (?-i:[A-Z]).* comes? into view

force_more_message += Found a gate leading to another region of Pandemonium
force_more_message += You found a shaft
runrest_stop_message += You found a shaft

flash_screen_message += You are slowing down
flash_screen_message += wielding.* distortion.* comes? into view
flash_screen_message += Ashenzari invites you to partake
flash_screen_message += Ru believes you are ready to make a new sacrifice
flash_screen_message += Vehumet offers you knowledge

: if you.race() ~= "Gargoyle" and you.race() ~= "Ghoul" and you.race() ~= "Mummy" and you.race() ~= "Djinni" then
  force_more_message += dream sheep.* comes? into view
:end
: if you.race() ~= "Gargoyle" then
force_more_message += plume of calc
:end


### Portals

force_more_message += ticking.*clock
force_more_message += dying ticks
force_more_message += distant snort
force_more_message += coins.*counted
force_more_message += tolling.*bell
force_more_message += roar of battle
force_more_message += creaking.*portcullis
force_more_message += portcullis is probably
force_more_message += wave of frost
force_more_message += crackling.*melting
force_more_message += hiss.*sand
force_more_message += sound.*rushing water
force_more_message += rusting.*drain
force_more_message += drain falling apart
force_more_message += heat about you
force_more_message += falling.*rocks
force_more_message += rumble.*avalanche of rocks
force_more_message += crackle.*arcane power
force_more_message += crackle.*magical portal
force_more_message += distant wind
force_more_message += whistling.*wind
force_more_message += rapidly growing quiet

confirm_action += Death's Door


### Messages

msc := message_colour

channel.monster_damage = plain
channel.god = plain
channel.monster_spell = plain
channel.monster_enchant = plain
channel.friend_spell = darkgrey
channel.friend_enchant = darkgrey
channel.monster_warning = yellow
channel.timed_portal = lightgreen

# Danger
msc ^= red: you shout at
msc ^= red: carrying a wand
msc ^= red: distortion.* comes? into view
msc ^= red: floating eye.* comes? into view
msc ^= red: You are slowing down
msc ^= red: you cannot.* because
msc ^= red: (the weather|forecast)
msc ^= red: you will pay
msc ^= red: flickers and vanishes
msc ^= magenta: cacodemon.* comes? into view
msc ^= magenta: neqoxec.* comes? into view
msc ^= magenta: wretched star.* comes? into view
msc ^= magenta: shining eye.* comes? into view

: if you.race() == "Mummy" then
msc ^= red: golden eye
: end

# Kills (is there a universal way to colour this?)
msc ^= brown: you kill
msc ^= brown: you destroy
msc ^= brown: dies
msc ^= brown: you blow up
msc ^= brown: is destroyed
msc ^= brown: is incinerated
msc ^= brown: drowns

# Misc
msc ^= green: more experienced
msc ^= green: you have finished your manual
msc ^= darkgrey: you are exhausted
msc ^= yellow: is nearby
msc ^= yellow: there are.* nearby
msc ^= darkgrey: You now have

# mute useless messages
# todo

msc ^= mute: begin reading


### Squelch stupid prompts

{
function c_answer_prompt(prompt)
  if prompt == "Annotate level on other end of current stairs?" then
    return false
  end
end
}
{
function c_answer_prompt(prompt)
  if prompt == "Are you sure you want to leave the Dungeon? This will make you lose the game!" then
    return false
  end
end
}


### Species, Job, God conditions

: if you.race() == "Ghoul" then
auto_eat_chunks = false
auto_butcher = full
: elseif you.race() == "Felid" or you.race() == "Troll" or you.race() == "Kobold" then
auto_butcher = satiated
: else
auto_eat_chunks = true
auto_butcher = hungry
: end

: if true and (you.race() == "Spriggan" or you.race() == "Gnoll") then
default_autopickup = false
: else
default_autopickup = true
: end

#: if you.race() == "Ghoul" or you.race() == "Felid" or you.race() == "Troll" or you.race() == "Kobold" then
easy_eat_chunks = true
#: end

: if you.race() == "Ghoul" or you.race() == "Mummy" then
ae += <scrolls? of torment
:else
ae += >scrolls? of torment
: end

: if you.race() == "Tengu" or you.race() == "Merfolk" or you.race() == "Barachi" or you.race() == "Octopode" then
ae += >potions? of flight
: end

: if you.race() == "Vampire" or you.race() == "Mummy" or you.race() == "Ghoul" or you.race() == "Demonspawn" then
ae += >scrolls? of holy word
: end

: if you.race() == "Ogre" or you.race() == "Troll" then
ae += <large rock
ae += <javelin
: end

: if you.god() == "Trog" then
ae += >potions? of brilliance
ae += >potions? of berserk
ae += >magical staff
: end

: if you.god() == "Zin" then
ae ^= <potions? of ambro
:else 
ae += >potions? of ambro
: end

: if you.god() == "Cheibriados"then
default_autopickup = false
force_more_message += comes? into view
: end

: if you.race() == "Barachi" then
force_more_message += comes? into view
: end

: if you.god() == "Fedhas" then
autoinscribe += fruit:!e
: end


: if false then
ae += >potions? of brilliance
ae += >book
ae += >ring of int
skill_focus = true
: end

#force_more_message += comes? into view
#force_more_message += Found a stone staircase
#force_more_message += Found
#force_more_message += paralyse.*in retribution

show_more = false
#autofight_throw = true


{
  local zigmode = false
   
  function toggle_zigmode()
    zigmode = not zigmode
   
    if (zigmode) then
      crawl.setopt("use_animations = 0")
      crawl.setopt("show_more = false")
      crawl.setopt("view_delay = 0")
      crawl.setopt("travel_key_stop = false")
      crawl.setopt("explore_stop = 0")
      crawl.mpr("Zigmode is on.")
    else
      crawl.setopt("use_animations = beam, range, hp, monster_in_sight, pickup, monster, player")
      crawl.setopt("show_more = true")
      crawl.setopt("view_delay = 100")
      crawl.setopt("travel_key_stop = true")
      crawl.mpr("Zigmode is off.")
    end
  end
  }
   
  macros += M {-270} ===toggle_zigmode 


-- ### Magus

##
## Globals.rc
################################################################################################
# PAUSE variable for ForceMorePrompts.rc
$PAUSE_MORE := PAUSE

{
  -- Pause for AnnounceDamage.lua
  PAUSE_MORE = "PAUSE"

  -- Standard Colors (ignoring black, not visible)
  COLORS = {
    ["darkgrey"] = "darkgrey",
    ["lightgrey"] = "lightgrey",
    ["white"] = "white",
    ["blue"] = "blue",
    ["lightblue"] = "lightblue",
    ["green"] = "green",
    ["lightgreen"] = "lightgreen",
    ["cyan"] = "cyan",
    ["lightcyan"] = "lightcyan",
    ["red"] = "red",
    ["lightred"] = "lightred",
    ["magenta"] = "magenta",
    ["lightmagenta"] = "lightmagenta",
    ["yellow"] = "yellow",
    ["brown"] = "brown"}
}

##
## Utils.lua
################################################################################################
{
function withColor(color, str)
  return string.format("<%s>%s</%s>", color, str, color)
end

function rc_out(symbol, color, msg)
  crawl.mpr(string.format("%s <%s>%s</%s>", symbol, color, msg, color))
end
function rc_msg(msg)
  rc_out("🤖", "blue", msg)
end
function rc_scs(msg)
  rc_out("✅", "green", msg)
end
function rc_err(msg)
  rc_out("❌", "lightred", msg)
end


function table_has(table, match)
  for index, value in ipairs(table) do
    if value == match then
      return true
    end
  end

  return false
end
}

##
## DEBUG.lua
################################################################################################
{
-- rc_msg("DEBUG")

-- rc_msg(you.race())
-- rc_msg(tostring(not table_has({"Merfolk", "Octopode"}, you.race())))

-- if not table_has({"Merfolk", "Octopode"}, you.race()) then
--   rc_msg("1 Is NOT deep water walking race")
-- else
--   rc_msg("1 Is deep water walking race")
-- end

-- function colortest()
--   for i, color in pairs(COLORS) do
--     crawl.mpr(string.format("\n>> 🤖 colortest <%s>%s</%s>", color, color, color))
--   end
-- end

-- colortest()

-- rc_out("COLORS", COLORS.brown, COLORS.brown)
}

force_more_message += wielding .* distortion
force_more_message += wielding .* Holy Wrath
force_more_message += You feel your power leaking away.
force_more_message += You feel you are being watched by something.
force_more_message += A sentinel's mark forms upon you
force_more_message += wielding .* acid wand
force_more_message += Your body decomposes!
force_more_message += Uskayaw will force your foes to helplessly watch your dance.

force_more_message += monster_warning:tormentor
force_more_message += monster_warning:fiend
force_more_message += monster_warning:tzitzimi
force_more_message += monster_warning:hell sentinel
force_more_message += monster_warning:lurking horror
force_more_message += monster_warning:shining eye
force_more_message += monster_warning:cacodemon
force_more_message += monster_warning:neqoxec
force_more_message += monster_warning:catoblepas
force_more_message += monster_warning:warmonger
force_more_message += monster_warning:Sigmund
force_more_message += monster_warning:Grinder
force_more_message += monster_warning:Roka
force_more_message += monster_warning:Tiamat
force_more_message += monster_warning:Jorgrun
force_more_message += monster_warning:Khufu

##
## END
################################################################################################



: rc_scs("Successfully initialized magus_ShadowRider38_sobieck.rc [v0.0.7]")
: crawl.enable_more(true)
