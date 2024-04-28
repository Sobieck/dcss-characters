# TEAMNAME Future Player Ghosts
# TEAMMEMBERS benadryl Graveyardigan billy1time ryathie mollymolluskus

##
## magus_ShadowRider38_sobieck.rc
################################################################################################
##
## BEGIN
################################################################################################
: rc_msg("Initializing magus_ShadowRider38_sobieck.rc ...")
: crawl.enable_more(false)


## RC FILE FROM ShadowRider38 who learned a lot from Yermak

note_skill_levels = 1,3,6,9,12,15,18,21,24,27
note_chat_messages = true
dump_message_count = 50
dump_book_spells = false
travel_delay = -1
explore_delay = -1
rest_delay = -1
trapwalk_safe_hp = dart:20,needle:15,arrow:35,bolt:45,spear:40,axe:45,blade:95


### Macros

macros += K1 \{-1018} \{27}

macros += K2 \{-268} +
macros += K2 \{-267} \{32}
macros += K2 \{-266} +
macros += K2 \{-265} .

macros += K3 \{-1018} \{27}

#macros += K4 . ,

macros += M \{-265} iAw\{27}\{27}zA
macros += M \{-266} iAw\{27}\{27}zB
macros += M \{-267} iAw\{27}\{27}zC
macros += M \{-268} iAw\{27}\{27}zD
macros += M \{-269} iBw\{27}\{27}zE
macros += M \{-270} iBw\{27}\{27}zF
macros += M \{-271} iBw\{27}\{27}zG
macros += M \{-272} iBw\{27}\{27}zH
macros += M \{-273} iCw\{27}\{27}zI
macros += M \{-274} iCw\{27}\{27}zJ

macros += M \{-248} ===toggle_autothrow
-- macros += M \{-249} 
macros += M \{-250} ===toggle_autorest
macros += M \{-255} ===toggle_more_mores
macros += M \{-246} ===toggle_zigmode 

## Alert when unsafe when manually exploring

macros += M o ===explore
macros += M \{-1001} ===manual_1
macros += M \{-1002} ===manual_2
macros += M \{-1003} ===manual_3
macros += M \{-1004} ===manual_4
macros += M \{-1006} ===manual_6
macros += M \{-1007} ===manual_7
macros += M \{-1008} ===manual_8
macros += M \{-1009} ===manual_9


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
force_ability_targeter = sanctuary, word of chaos, recite, elemental force, oozemancy, disaster area, corrupt, foxfire swarm
tile_web_mouse_control = false
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
autofight_stop = 60
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

ae := autopickup_exceptions

# nullifying the effect of the most annoying 0.24 commit:
ae += >ring of (poi|resist cor|fli|see)
ae += >amulet of (the acr|fai|the gou|gua|har|mag|rag|ref|reg)

ae += <throwing net
ae += <dart
ae += <javelin 
ae += <stone
ae += <boomerang

ae += >scrolls? of (amn)
ae += >wand of rand
ae += >ring of (protection from (mag|fire|cold)|mag|ste|ice|fire|pos|wil|wiz)
ae += >ring of (dex|int|str)
ae ^= <potions? of (ambr|attr|lign|mut)
ae ^= <scrolls? of (immolation|vulnerability)
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

as ^= End Transfo: t
as ^= Evoke Invis: i
as ^= Turn Visibl: j
as ^= Evoke Fligh: l
as ^= Spit:        q
as ^= Breath:      q
as ^= Rolling:     r

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
is ^= scroll of magic map:M
is ^= potion of flight:l
is ^= potion of curing:Q
is ^= potion of haste:H
is ^= wand of digg:D
is ^= wand of ensl:E
is ^= wand of char:E
is ^= wand of iceb:I
is ^= wand of clou:O
is ^= wand of para:P
is ^= wand of scat:S
is ^= wand of flam:V
is ^= mirror:K
is ^= vane:O
is ^= box:X
is ^= sack:N
is ^= phial:U
is ^= lamp:Y
is ^= tin of t:Y


force_more_message -= You finish merging with the rock

force_more_message += You have reached level
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


### Species, Job, God conditions

: if true and (you.race() == "Spriggan" or you.race() == "Gnoll") then
default_autopickup = false
: else
default_autopickup = true
: end

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

: if you.race() == "Barachi" then
force_more_message += comes? into view
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

force_more_message += (?!.(Here|Aim):).wielding.of (distortion|chaos)

hp_warning = 70

{
  local need_skills_opened = true
  function ready()
    if you.turns() == 0 and need_skills_opened then
      need_skills_opened = false
      manage_skills()
      
      crawl.sendkeys("m")
    end

    if crawl.messages(5):find("Found a gate to the Vaults.") then
      annotate_v5()
    end

    if crawl.messages(5):find("You climb downwards.") and you.depth() == 4 and you.branch() == "D" then
      crawl.sendkeys("r")
    end
  
    fmore_early_threats()
    update_safe()
  end
  
  -- Alert when unsafe when manually exploring
  
  local safe = you.feel_safe()
  exploring = false
  
  function annotate_v5() 
    crawl.sendkeys("!")
    crawl.sendkeys("V")
    crawl.sendkeys("5")
    crawl.sendkeys("! DO NOT GO UNLESS READY. BAD STUFF HAPPENS HERE")
  end
  
  -- https://tavern.dcss.io/t/function-ready-no-longer-works/704/8
  function untrain_all_skills()
    skill_list = {"Fighting","Short Blades","Long Blades","Axes","Maces & Flails",
                  "Polearms","Staves","Unarmed Combat",
                  "Throwing","Slings","Armour","Dodging","Shields","Spellcasting",
                  "Conjurations","Hexes","Charms","Summonings","Necromancy",
                  "Translocations","Transmutations","Fire Magic","Ice Magic",
                  "Air Magic","Earth Magic","Alchemy","Invocations",
                  "Evocations","Stealth"}
    for i, sk in ipairs(skill_list) do
      you.train_skill(sk, 0)
    end
  end
  
  function set_and_train(skillname, amount) 
      you.set_training_target(skillname, amount)
      you.train_skill(skillname, 1)
  end
  
  function set_and_focus(skillname, amount) 
    you.set_training_target(skillname, amount)
    you.train_skill(skillname, 2)
  end
  
  function update_safe()
    local old_safe = safe
    safe = you.feel_safe()
    if (not safe and old_safe) and (not exploring) then
        crawl.mpr("Danger!", "warning")
        crawl.more()
    end
  end
  
  function explore()
    exploring = true
    crawl.sendkeys("o")
  end
  
  function manual_1()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("1")
  end
  
  function manual_2()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("2")
  end
  function manual_3()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("3")
  end
  function manual_4()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("4")
  end
  function manual_6()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("6")
  end
  function manual_7()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("7")
  end
  function manual_8()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("8")
  end
  function manual_9()
    if(exploring == true) then
      exploring = false
    end
    crawl.sendkeys("9")
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


  function MDEE_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Earth Elementalist" then
      set_and_train("Spellcasting", 12)
      set_and_train("Armour", 14)
      set_and_focus("Earth Magic", 18)
    end
  end
  
  function MDFe_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Fire Elementalist" then
      set_and_train("Spellcasting", 6)
      set_and_train("Conjurations", 6)
      set_and_focus("Fire Magic", 10)
      set_and_train("Fighting", 6)
      set_and_train("Armour", 5)
    end
  end

  function OnWp_set_skills()
    if you.race() == "Oni" and you.class() == "Warper" then
      set_and_train("Fighting", 14)
      set_and_focus("Maces & Flails", 15)
      set_and_train("Translocations", 10)
      set_and_train("Spellcasting", 10)
    end
  end

  function OnSh_set_skills() 
    if you.race() == "Oni" and you.class() == "Shapeshifter" then
      set_and_train("Fighting", 12)
      set_and_focus("Unarmed Combat", 12)
      set_and_train("Shapeshifting", 11)
      set_and_train("Dodging", 8)
    end
  end

  function manage_skills()
    untrain_all_skills()
    MDEE_set_skills()
    MDFe_set_skills()
    OnWp_set_skills()
    OnSh_set_skills()
  end

  }

##
## END
################################################################################################



: rc_scs("Successfully initialized magus_ShadowRider38_sobieck.rc [v0.0.33]")
: crawl.enable_more(true)