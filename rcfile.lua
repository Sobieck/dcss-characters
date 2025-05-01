# TEAMNAME Future Player Ghosts
# TEAMMEMBERS bnnuy ryathie espersc billy1time HappinessSam 

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
macros += M \{-249} ===label_weapons_by_damage
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
ae += <sling
ae += <large rock
ae += <a ring of magical power

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
is ^= a ring of willpower:m
is ^= ring of positive energy:n
is ^= ring of poison resistance:o
is ^= ring of see invisible:s
is ^= ring of slaying:y
is ^= of resist corrosion:g
is ^= amulet of regeneration:r
is ^= blowgun:q
is ^= throwing net:Z
is += scroll of noise:W
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
force_more_message += Your blazeheart golem falls apart, revealing its core!
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

function print_table(table) 
  for index, value in ipairs(table) do
    rc_msg(tostring(value))
  end
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
  function annotate_v5(message_buffer) 
    if message_buffer:find("Found a gate to the Vaults.") then 
      crawl.sendkeys("!V5\r! DO NOT GO UNLESS READY. BAD STUFF HAPPENS HERE\r")
    end
  end

  function has_god() 
    return (not (you.god() == "No God")) or you.race() == "Demigod"
  end

  function god_stop(message_buffer)
    if (message_buffer:find("Found a faded altar of an unknown god.") or message_buffer:find("Found a staircase to the Ecumenical Temple")) and has_god() == false then 
      if(not message_buffer:find("GET GOD")) then
        crawl.mpr("GET GOD", "warning")
        crawl.more()
      end 
    end
  end

  function just_went_downwards(message_buffer) 
    return message_buffer:find("You fly downwards.") or message_buffer:find("You climb downwards.")
  end

  function not_in_top_3_levels() 
    return not (you.branch() == "D" and you.depth() < 4)
  end

  function any_un_ided_items(type)
    for index, item in ipairs(items.inventory()) do
      if item:class() == type then 
        if item.is_identified == false then
          return true
        end 
      end
    end
    
    return false
  end

  function has_id_scrolls()
    for index, item in ipairs(items.inventory()) do
      local item_name = item:name()
      if item_name:find("identify") then 
        return true
      end
    end
    
    return false
  end

  function done_exploring(message_buffer)
    return message_buffer:find("Done exploring.") or message_buffer:find("Partly explored") or message_buffer:find("Could not explore")
  end

  function read_id_scrolls(message_buffer) 
    if 
      (just_went_downwards(message_buffer) and not_in_top_3_levels() and has_god() == false and any_un_ided_items("Scrolls")) or
      (done_exploring(message_buffer) and has_god() and any_un_ided_items("Scrolls")) or
      (done_exploring(message_buffer) and any_un_ided_items("Potions") and has_id_scrolls())
      then 
      crawl.sendkeys("r")
    end
  end

  --debug
  function test_function()
    return has_id_scrolls()
  end
  -- end debug

  local need_skills_opened = true
  function ready()
    if you.turns() == 0 and need_skills_opened then
      need_skills_opened = false
      
      manage_skills()

      crawl.sendkeys("Qa") -- quiver spell
    end

    local message_buffer = crawl.messages(5)
    
    god_stop(message_buffer)
    annotate_v5(message_buffer)
    read_id_scrolls(message_buffer)

    fmore_early_threats()
    update_safe()
  end

  -- Alert when unsafe when manually exploring
  
  local safe = you.feel_safe()
  exploring = false
  

  
  -- https://tavern.dcss.io/t/function-ready-no-longer-works/704/8
  function untrain_all_skills()
    skill_list = {"Fighting","Short Blades","Long Blades","Axes","Maces & Flails",
                  "Polearms","Staves","Unarmed Combat",
                  "Throwing","Slings","Armour","Dodging","Shields","Spellcasting",
                  "Conjurations","Hexes","Charms","Summonings","Necromancy",
                  "Translocations","Forgecraft","Fire Magic","Ice Magic",
                  "Air Magic","Earth Magic","Alchemy","Invocations",
                  "Evocations","Stealth", "Shapeshifting"}
    for i, sk in ipairs(skill_list) do
      you.train_skill(sk, 0)
    end
  end
  
  function train(skillname, amount) 
      you.set_training_target(skillname, amount)
      you.train_skill(skillname, 1)
  end
  
  function focus(skillname, amount) 
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

  function label_weapons_by_damage()
    -- for index, item in ipairs(items.inventory()) do
    --   if item:class():find("Weapon") then 
    --     rc_msg(item:class())

        

    --   end
    -- end

    for item in iter.invent_iterator:new(items.inventory()) do
      if item:class():find("Weapon") then 
        -- rc_msg(item:class())
        -- rc_msg(item.plus) -- additional damage
        -- rc_msg(item.damage) -- base damage
      end

      --https://github.com/crawl/crawl/blob/904c1d6a4d5529cfa2839185b4aee08cf38cbe64/crawl-ref/source/describe.cc#L1399

    end
    rc_msg(crawl.messages(5))
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
  
  -- DEBUG.lua
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

  -- rc_msg(tostring(test_function()))

  -- end debug


  function MDEE_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Earth Elementalist" then
      train("Spellcasting", 12)
      train("Armour", 14)
      focus("Earth Magic", 18)
    end
  end
  
  function MDFe_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Fire Elementalist" then
      train("Spellcasting", 6)
      train("Conjurations", 6)
      focus("Fire Magic", 10)
      train("Fighting", 6)
      train("Armour", 5)
    end
  end

  function OnWp_set_skills()
    if you.race() == "Oni" and you.class() == "Warper" then
      train("Fighting", 14)
      focus("Maces & Flails", 15)
      train("Translocations", 10)
      train("Spellcasting", 10)
    end
  end

  function OnSh_set_skills() 
    if you.race() == "Oni" and you.class() == "Shapeshifter" then
      train("Fighting", 12)
      focus("Unarmed Combat", 12)
      train("Shapeshifting", 11)
      train("Dodging", 8)
    end
  end

  function MDHu_set_stills()
    if you.race() == "Mountain Dwarf" and you.class() == "Hunter" then
      train("Fighting", 15)
      focus("Ranged Weapons", 13)
      train("Evocations", 5)
      train("Dodging", 4)   
    end
  end

  function MDFi_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Fighter" then
      train("Fighting", 10)
      train("Axes", 12)
    end
  end

  function MDSu_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Summoner" then
      train("Spellcasting", 8)
      focus("Summonings", 10)
    end
  end

  function MDBe_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Berserker" then
      focus("Axes", 14)
      train("Fighting", 9)
      train("Throwing", 2)
      train("Armour", 7)
      train("Dodging", 2)    
      train("Evocations", 5)     
    end
  end

  function MDMo_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Monk" then
      focus("Axes", 16)
      train("Fighting", 11)
      train("Armour", 4)
      train("Evocations", 4)     
    end
  end

  function MDFw_set_skills()
    if you.race() == "Mountain Dwarf" and you.class() == "Forgewright" then
      focus("Forgecraft", 14)
      train("Fighting", 5)
      train("Armour", 6)
      train("Spellcasting", 5)
    end
  end

  function DgHu_set_skills()
    if you.race() == "Demigod" and you.class() == "Hunter" then
      focus("Ranged Weapons", 10) 
    end
  end

  function DgAr_set_skills()
    if you.race() == "Demigod" and you.class() == "Artificer" then
      focus("Ranged Weapons", 9)
      train("Fighting", 8)
      train("Dodging", 8)
      train("Armour", 3)
      train("Evocations", 3)
    end
  end

  function DgBr_set_skills()
    if you.race() == "Demigod" and you.class() == "Brigand" then
      focus("Ranged Weapons", 14)
    end
  end

  function MiFi_set_skills()
    if you.race() == "Minotaur" and you.class() == "Fighter" then
      train("Fighting", 9)
      train("Axes", 12) 
      train("Shields", 5)
    end
  end

  function MiBr_set_skills()
    if you.race() == "Minotaur" and you.class() == "Brigand" then
      focus("Unarmed Combat", 11)
      train("Fighting", 9)
      train("Dodging", 7)
      train("Armour", 7)
    end
  end

  function MfGl_set_skills() 
    if you.race() == "Merfolk" and you.class() == "Gladiator" then
      train("Fighting", 9)
      focus("Long Blades", 14)
      train("Dodging", 10)
    end
  end

  function MfBr_set_skills()
    if you.race() == "Merfolk" and you.class() == "Brigand" then
      train("Fighting", 9)
      focus("Long Blades", 14)
      train("Dodging", 10)
    end
  end

  function NaAl_set_skills() 
    if you.race() == "Naga" and you.class() == "Alchemist" then
      focus("Alchemy", 10)
      focus("Spellcasting", 8)
      train("Stealth", 9)
      train("Fighting", 5)
    end
  end

  function GgEE_set_skills()
    if you.race() == "Gargoyle" and you.class() == "Earth Elementalist" then
      train("Spellcasting", 9)
      focus("Earth Magic", 10)
      train("Conjurations", 8)
      train("Fighting", 7)
    end
  end

  function GrIE_set_skills() 
    if you.race() == "Gargoyle" and you.class() == "Ice Elementalist" then
      train("Fighting", 3)
      train("Spellcasting", 5)
      focus("Ice Magic", 10)
    end
  end

  function Dj_set_skills()
    if you.race() == "Djinni" then
      train("Stealth", 5)
      train("Fighting", 5)
      train("Dodging", 6)
      focus("Spellcasting", 7)
    end
  end

  function DrAl_set_skills() 
    if you.race() == "Draconian" and you.class() == "Alchemist" then
      train("Stealth", 6)
      train("Spellcasting", 6)
      train("Conjurations", 2)
      focus("Alchemy", 10)
      train("Fighting", 7)
    end
  end

  function VsBr_set_skills()
    if you.race() == "Vine Stalker" and you.class() == "Brigand" then
      train("Stealth", 10)
      train("Short Blades", 10)
    end
  end

  function TrBr_set_skills() 
    if you.race() == "Troll" and you.class() == "Brigand" then
      train("Unarmed Combat", 11)
      train("Dodging", 2)
    end
  end

  function KoBr_set_skills() 
    if you.race() == "Kobold" and you.class() == "Brigand" then
      train("Fighting", 11)
      train("Dodging", 16)
    end
  end

  function DeHW_set_skills() 
    if you.race() == "Deep Elf" and you.class() == "Hedge Wizard" then
      train("Stealth", 5)
      focus("Conjurations", 11)
      train("Summonings", 3)
      focus("Spellcasting", 11)
      train("Alchemy", 7)
      train("Air Magic", 1)
      train("Fighting", 3)
    end
  end

  function DECj_set_skills() 
    if you.race() == "Deep Elf" and you.class() == "Conjurer" then
      focus("Conjurations", 12)
      focus("Spellcasting", 14)
      train("Alchemy", 7)
    end
  end

  function CoHu_set_skills() 
    if you.race() == "Coglin" and you.class() == "Hunter" then
      focus("Ranged Weapons", 12)
    end
  end

  function CoWp_set_skills() 
    if you.race() == "Coglin" and you.class() == "Warper" then
      focus("Axes", 10)
      train("Spellcasting", 3)
      train("Dodging", 4)
      train("Armour", 4)
      train("Translocations", 6)
      train("Fighting", 8)
    end
  end

  function GhWd_set_skills()
    if you.race() == "Ghoul" and you.class() == "Wanderer" then
      focus("Unarmed Combat", 13)
      train("Fighting", 9)
    end
  end

  function SpBe_set_skills()
    if you.race() == "Spriggan" and you.class() == "Berserker" then
      train("Stealth", 10)
      train("Fighting", 8)
      focus("Short Blades", 8)
      train("Dodging", 14)
    end
  end

  function MfSh_set_skills()
    if you.race() == "Merfolk" and you.class() == "Shapeshifter" then
      train("Stealth", 7)
      train("Fighting", 8)
      focus("Unarmed Combat", 7)
      train("Dodging", 9)
      train("Shapeshifting", 9)
    end
  end

  function TrMo_set_skills()
    if you.race() == "Troll" and you.class() == "Monk" then
      train("Fighting", 8)
      focus("Unarmed Combat", 8)
    end
  end

  function DrAr_set_skills()
    if you.race() == "Draconian" and you.class() == "Artificer" then
      train("Fighting", 7)
      focus("Unarmed Combat", 8)
      train("Stealth", 3)
      train("Dodging", 4)
      train("Evocations", 5)
    end
  end

  function DrGl_set_skills()
    if you.race() == "Draconian" and you.class() == "Gladiator" then
      focus("Long Blades", 11)
      train("Dodging", 7)
      train("Fighting", 10)
    end
  end

  function DrHW_set_skills()    
    if you.race() == "Draconian" and you.class() == "Hedge Wizard" then
      train("Necromancy", 2)
      train("Summonings", 4)
      train("Fighting", 10)
      focus("Spellcasting", 10)
  end

  function PoFE_set_skills()    
    if you.race() == "Poltergeist" and you.class() == "Fire Elementalist" then
      focus("Spellcasting", 7)
      
      train("Conjurations", 6)
      train("Fire Magic", 7)
      train("Fighting", 3)
    end
  end

  function PoHs_set_skills()    
    if you.race() == "Poltergeist" and you.class() == "Hexslinger" then
      train("Spellcasting", 5)
      train("Hexes", 10)
      train("Fire Magic", 4)
      train("Fighting", 5)
      focus("Ranged Weapons", 10)
      train("Dodging", 5)
    end
  end

  function PoEn_set_skills()    
    if you.race() == "Poltergeist" and you.class() == "Enchanter" then
      focus("Stealth", 15)
      train("Short Blades", 10)
      focus("Hexes", 10)
      train("Spellcasting", 6)
      train("Fighting", 6)
      train("Dodging", 11)
    end
  end

  function PoIE_set_skills()    
    if you.race() == "Poltergeist" and you.class() == "Ice Elementalist" then
      train("Fighting", 10)
      focus("Ice Magic", 13)
      train("Summonings", 3)
      train("Evocations", 2)
      train("Spellcasting", 10)
      train("Dodging", 10)      
    end
  end

  function ReEE_set_skills()
    if you.race() == "Revenant" and you.class() == "Earth Elementalist" then
      train("Conjurations", 2)
      focus("Earth Magic", 15)
      train("Spellcasting", 13)
    end
  end

  function ReMo_set_skills()
    if you.race() == "Revenant" and you.class() == "Monk" then
      train("Dodging", 18)
      focus("Unarmed Combat", 16)
      train("Fighting", 15)
      train("Evocations", 6)
    end
  end

  function ReRv_set_skills()
    if you.race() == "Revenant" and you.class() == "Reaver" then
      train("Armour", 6)
      focus("Unarmed Combat", 10)
      train("Fighting", 10)
    end
  end

  function ReHu_set_skills()
    if you.race() == "Revenant" and you.class() == "Hunter" then
      focus("Ranged Weapons", 15)
      train("Stealth", 2)
      train("Fighting", 10)
      train("Dodging", 6)
      train("Evocations", 3)
    end
  end

  function ReCk_set_skills()
    if you.race() == "Revenant" and you.class() == "Chaos Knight" then
      focus("Unarmed Combat", 15)
      train("Dodging", 9)
      train("Stealth", 4)
      train("Armour", 8)
      train("Evocations", 8)
    end
  end

  function ReNe_set_skills()
    if you.race() == "Revenant" and you.class() == "Necromancer" then
      focus("Unarmed Combat", 10)
      train("Necromancy", 7)
      train("Spellcasting", 3)
    end
  end

  
end

  function manage_skills()
    untrain_all_skills()

    -- easy combos 
    DgHu_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240216-190345.txt
    GgEE_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240121-222647.txt
    MiFi_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240122-193814.txt
    OnSh_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240428-222549.txt
    MfGl_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240123-185822.txt
    DECj_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20230527-182706.txt
    CoHu_set_skills() -- http://crawl.akrasiac.org/rawdata/duul/morgue-duul-20240803-200444.txt
    MfSh_set_skills() -- http://crawl.akrasiac.org/rawdata/CatfishMan/morgue-CatfishMan-20240828-011936.txt
    
    -- # othersp
    MDEE_set_skills()
    MDHu_set_stills()
    MDFi_set_skills()
    MDFe_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240427-135046.txt
    MDSu_set_skills() -- https://crawl.project357.org/morgue/Wizard1ke/morgue-Wizard1ke-20240219-222605.txt
    MDBe_set_skills() -- https://crawl.akrasiac.org/rawdata/Retrospecter/morgue-Retrospecter-20240307-051219.txt
    MDMo_set_skills() -- https://underhound.eu/crawl/morgue/EnegeticOcto/morgue-EnegeticOcto-20240214-201749.txt 
    MDFw_set_skills() -- https://archive.nemelex.cards/morgue/Tanach/morgue-Tanach-20241116-110232.txt

    
    OnWp_set_skills()

    
    NaAl_set_skills() -- https://cbro.berotato.org/morgue/Lemonizer/morgue-Lemonizer-20240403-035404.txt

    
    GrIE_set_skills() -- https://crawl.xtahua.com/crawl/morgue/Ge0ff/morgue-Ge0ff-20240326-180132.txt

    
    Dj_set_skills() -- https://crawl.xtahua.com/crawl/morgue/seren/morgue-seren-20240122-194555.txt

    
    DrAl_set_skills() -- https://underhound.eu/crawl/morgue/EnegeticOcto/morgue-EnegeticOcto-20240220-235342.txt
    DrAr_set_skills() -- https://crawl.akrasiac.org/rawdata/frimble/morgue-frimble-20240829-222046.txt
    DrGl_set_skills() -- https://cbro.berotato.org/morgue/SuperSeabass/morgue-SuperSeabass-20241014-013901.txt
    DrHW_set_skills() -- https://crawl.akrasiac.org/rawdata/geewiz/morgue-geewiz-20240929-203055.txt


    DgAr_set_skills() -- https://crawl.xtahua.com/crawl/morgue/motkurizz/morgue-motkurizz-20230818-181127.txt
    DgBr_set_skills() -- https://cbro.berotato.org/morgue/AutarchDCSS/morgue-AutarchDCSS-20240324-170250.txt


    VsBr_set_skills() -- https://crawl.akrasiac.org/rawdata/T4S/morgue-T4S-20240119-045652.txt


    TrBr_set_skills() -- https://cbro.berotato.org/morgue/RepHenryClay/morgue-RepHenryClay-20231008-013121.txt


    KoBr_set_skills() -- https://crawl.project357.org/morgue/Kearsarge/morgue-Kearsarge-20240501-074743.txt


    MiBr_set_skills() -- https://crawl.akrasiac.org/rawdata/frimble/morgue-frimble-20240221-213524.txt
  
    
    MfBr_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20240123-185822.txt


    DeHW_set_skills() -- https://webzook.net/soup/morgue/trunk/godot/morgue-godot-20230518-044854.txt

    GhWd_set_skills() -- https://underhound.eu/crawl/morgue/Salticid/morgue-Salticid-20240824-113756.txt

    SpBe_set_skills() -- https://cbro.berotato.org/morgue/Sobieck/morgue-Sobieck-20210623-162328.txt

    TrMo_set_skills() -- https://underhound.eu/crawl/morgue/kuniqs/morgue-kuniqs-20240903-152205.txt

    PoFE_set_skills() -- https://crawl.xtahua.com/crawl/morgue/Ge0ff/morgue-Ge0ff-20250326-210900.txt

    PoHs_set_skills() -- https://cbro.berotato.org/morgue/rbyellow5/morgue-rbyellow5-20250228-182428.txt

    PoEn_set_skills() -- https://underhound.eu/crawl/morgue/SayItsName/morgue-SayItsName-20250308-210031.txt

    PoIE_set_skills() -- https://crawl.dcss.io/crawl/morgue/AutarchDCSS/morgue-AutarchDCSS-20250220-221609.txt

    ReEE_set_skills() -- https://cbro.berotato.org/morgue/greynaab/morgue-greynaab-20250314-163242.txt

    CoWp_set_skills() -- https://crawl.dcss.io/crawl/morgue/cornishon/morgue-cornishon-20240906-164801.txt

    ReMo_set_skills() -- https://crawl.akrasiac.org/rawdata/frimble/morgue-frimble-20250225-063749.txt

    ReRv_set_skills() -- https://crawl.xtahua.com/crawl/morgue/Zigmound/morgue-Zigmound-20250218-152714.txt

    ReHu_set_skills() -- https://crawl.dcss.io/crawl/morgue/particleface/morgue-particleface-20250302-224718.txt

    ReCk_set_skills() -- https://crawl.dcss.io/crawl/morgue/agentgt/morgue-agentgt-20250313-204957.txt

    ReNe_set_skills() -- https://crawl.dcss.io/crawl/morgue/huiren/morgue-huiren-20250326-085738.txt

  end

  }

##
## END
################################################################################################



: rc_scs("Successfully initialized magus_ShadowRider38_sobieck.rc [v0.0.47]")
: crawl.enable_more(true)


### something to try https://underhound.eu/crawl/morgue/cfcfcfcfcf/morgue-cfcfcfcfcf-20240801-212611.txt