# TEAMCAPTAIN benadryl

default_manual_training = true

autofight_stop = 75

show_travel_trail = true

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


##### EN0N's Mini-Map Color Scheme
##
##tile_upstairs_col = green
##tile_downstairs_col = red
##tile_branchstairs_col = #ffa500
##tile_door_col = #c27149
##tile_wall_col = #5a524c
##tile_explore_horizon_col = #aaaaaa
##tile_floor_col = #1e1b1a
##tile_item_col = #1e1b1a
##tile_feature_col = #d4be21
##tile_plant_col = #4b6d39
##tile_water_col = #0b5d79
##tile_deep_water_col = #1212b3
##tile_trap_col = #f447ff
##tile_transporter_col = #ff5656
##tile_transporter_landing_col = #59ff89
##tile_lava_col = #5f0a00
##
##
##use_animations -= hp, player, pickup, branch_entry
##view_delay = 35
##default_show_all_skills = true
##default_manual_training = true
##skill_focus = true
##show_travel_trail = true
##travel_one_unsafe_move = true
##easy_floor_use = true
##action_panel_show = false
##show_game_time = false
##show_god_gift = yes
##cloud_status = true
##simple_targeting = false
##force_spell_targeter = eringya's noxious bog
##force_ability_targeter = sanctuary, word of chaos, recite, elemental force, oozemancy, drain life, disaster area, corrupt, foxfire swarm
##tile_web_mouse_control = false
##tile_show_threat_levels =
##fire_order = launcher, boomerang, rock, poisoned dart, javelin, stone
##
##runrest_ignore_message += blood rots? away
##runrest_ignore_message += Your icy armour
##runrest_ignore_message += Your skin is crawling a little less
##runrest_ignore_message += infusion is running out
##runrest_ignore_message += shroud begins to fray
##runrest_ignore_message += You feel.*sick
##runrest_ignore_message += You howl as the wereblood boils in your veins
##runrest_ignore_message += Your primal bloodlust
##interrupt_eat =
##runrest_safe_poison = 100:100
###interrupt_armour_on -= hp_loss
###interrupt_armour_off -= hp_loss
##interrupt_memorise -= hp_loss
##interrupt_memorise -= monster
##autofight_stop = 40
##explore_auto_rest = true
##explore_stop = items,stairs,shops,altars,portals,branches,runed_doors
##explore_stop += greedy_pickup_smart,artefacts
##tile_show_demon_tier = true
##
##menu_colour += cyan:brand weapon
##menu_colour += cyan:enchant weapon
##menu_colour += cyan:enchant armour
##menu_colour += cyan:recharging
##menu_colour += cyan:magic mapping
##menu_colour += green:potions? of might
##menu_colour += green:potions? of agility
##menu_colour += green:potions? of brilliance
##menu_colour += green:potions? of haste
##menu_colour += green:potions? of resistance
##menu_colour += green:potions? of berserk
##menu_colour += cyan:wand of para
##menu_colour += cyan:wand of conf
##menu_colour += cyan:wand of poly
##menu_colour += cyan:wand of ensl
##menu_colour += cyan:wand of disi
##menu_colour += cyan:wand of char
##menu_colour += cyan:wand of mind
##
##autoinscribe ^= scroll of silence:!r
###: if you.skill("Staves") < 5 then
###  autoinscribe += magical staff:!a
###: end
##
##
##ae := autopickup_exceptions
##
### nullifying the effect of the most annoying 0.24 commit:
##ae += >ring of (poi|resist cor|fli|see)
##ae += >amulet of (the acr|fai|the gou|gua|har|mag|rag|ref|reg)
##
##ae += >scrolls? of (amn|noise)
##ae += >wand of rand
##ae += >ring of (protection from (mag|fire|cold)|mag|ste|ice|fire|pos|wil|wiz)
##ae += >ring of (dex|int|str)
##ae ^= <potions? of (ambr|attr|lign|mut)
##ae ^= <scrolls? of (immolation|vulnerability)
##ae += <(curare|throwing net)
##ae += <(lamp of fire|phial of floods|lightning rod|figurine|condenser vane)
##ae ^= <tin of tremorstones
##ae += <sack of spiders
##ae += <phantom mirror
##ae += <box of beasts
##ae += <deck
##ae += <assassin
##ae += <god gift
##ae += <artefact
##ae += <magical staff
##ae ^= >staff of
##
##as := ability_slot
##
##as ^= End Transfo: t
##as ^= Evoke Invis: i
##as ^= Turn Visibl: j
##as ^= Evoke Fligh: l
##as ^= Fly:         l
##as ^= Stop Flying: m
##as ^= Spit:        q
##as ^= Breath:      q
##
##ss := spell_slot
##
##ss ^= Apportation: g
##ss ^= Blink:       d
##ss ^= Lesser Beck: e
##ss ^= Portal Proj: J
##ss ^= Teleport Ot: t
##ss ^= Warp Weapon: W
##ss ^= Passage of:  z
##ss ^= Phase Shift: p
##ss ^= Summon Fore: F
##ss ^= ontrolled B: C
##ss ^= Control Tel: k
##
##ss ^= Song of Sla: y
##ss ^= Missiles:    f
##ss ^= Flight:      l
##ss ^= Regeneratio: R
##ss ^= Shroud of G: h
##ss ^= Spectral We: W
##ss ^= Ozocubu:     b
##ss ^= Haste:       H
##
##ss ^= Confus:      x
##ss ^= Tukima's Da: t
##ss ^= Invisibilit: i
##ss ^= Enslavement: v
##ss ^= Dazzling Sp: q
##
##ss ^= Animate Ske: h
##ss ^= Sublimation: Z
##ss ^= Corpse Rot:  r
##ss ^= Vampiric Dr: v
##ss ^= Control Und: U
##ss ^= Dispel Unde: u
##ss ^= Animate Dea: E
##ss ^= Borgnjor's : w
##
##ss ^= Sticks to S: s
##ss ^= Spider Form: O
##ss ^= Ice Form:    I
##ss ^= Blade Hands: u
##ss ^= Statue Form: Y
##ss ^= Dragon Form: T
##ss ^= Irradiate:   Q
##
##ss ^= Stone Skin:  s
##ss ^= Passwall:    c
##ss ^= Frozen Ramp: c
##ss ^= Petrify:     p
##ss ^= Lee's Rapid: l
##ss ^= Summon Butt: B
##ss ^= Aura of Abj: A
##ss ^= Summon Ligh: L
##ss ^= Freezing Cl: f
##ss ^= Conjure Fla: j
##ss ^= Mephitic Cl: m
##ss ^= Olgreb's To: t
##ss ^= Cure Poison: w
##ss ^= Bolt:        w
##ss ^= Fireball:    e
##
##is := item_slot
##
###free (in trunk): abdehipCL (qzNSW)
##is ^= ^stone:j
##is ^= poisoned dart:k
##is ^= (^|[0-9] )boomerang:t
##is ^= silver boomerang:u
##is ^= (^|[0-9] )javelin:v
##is ^= large rock:w
##is ^= silver javelin:x
##is ^= curare:F
##is ^= datura:G
##is ^= atropa:J
##is ^= dispersal:K
##is ^= ring of protection from fire:f
##is ^= ring of protection from cold:c
##is ^= ring of protection from magic:m
##is ^= ring of willpower:m
##is ^= ring of positive energy:n
##is ^= ring of poison resistance:o
##is ^= ring of see invisible:s
##is ^= ring of slaying:y
##is ^= of resist corrosion:g
##is ^= amulet of regeneration:r
##is ^= blowgun:q
##is ^= throwing net:Z
##is ^= scroll of remove curse:W
##is ^= scroll of identify:R
##is ^= scroll of teleportation:T
##is ^= scroll of blinking:B
##is ^= scroll of magic map:M
##is ^= potion of flight:l
##is ^= potion of curing:Q
##is ^= potion of haste:H
##is ^= wand of acid:A
##is ^= wand of digg:D
##is ^= wand of ensl:E
##is ^= wand of char:E
##is ^= wand of iceb:I
##is ^= wand of clou:O
##is ^= wand of para:P
##is ^= wand of scat:S
##is ^= wand of flam:V
##is ^= food:z
##is ^= mirror:K
##is ^= vane:O
##is ^= box:X
##is ^= sack:N
##is ^= phial:U
##is ^= lamp:Y
##is ^= tin of t:Y
##
##
##force_more_message -= You finish merging with the rock
##
###force_more_message += You have reached level
##force_more_message += You fall through a shaft
##force_more_message += You enter a teleport trap
##force_more_message += You are suddenly yanked
##force_more_message += interdimensional caravan
##force_more_message += distant snort
##force_more_message += Found a gateway leading out of the Abyss
##force_more_message += Found a gateway leading deeper into the Abyss
##force_more_message += Found .* abyssal rune of Zot
##force_more_message += Careful!
##force_more_message += You are starting to lose your buoyancy
##force_more_message += You miscast Flight
###force_more_message += filled with .* inner flame
###force_more_message += grabs you
##force_more_message += starts rolling
##force_more_message += looks more exp
##force_more_message += vile air hits you
##force_more_message += engulfs you in water
##force_more_message += breathes miasma
##force_more_message += You feel your flesh start
##force_more_message += Found * staircase leading down
##force_more_message += You are engulfed in seething chaos
##force_more_message += You are slowing down
##force_more_message += You are confused
##force_more_message += fire storm spell
##force_more_message += Your guardian golem overheats
##force_more_message += offers itself
##force_more_message += volcano erupts
##force_more_message += Uskayaw prepares the audience for your solo
##force_more_message += Something reaches out for you
##force_more_message += You become entangled in the net
##force_more_message += wield.* blowgun
##force_more_message += (the weather|forecast)
##force_more_message += you cannot.* because
##force_more_message += pie hits you
##force_more_message += goes berserk
##force_more_message += venomous gases
###force_more_message += vanishes in a puff
##force_more_message += weaves a glowing orb
##force_more_message += Your transformation is almost over
##force_more_message += The ironbrand convoker begins to recite a word of recall
##force_more_message += Something unseen opens the door
##force_more_message += Your unholy channel is weakening
##runrest_stop_message += Your unholy channel is weakening
##
##force_more_message += centaur.* comes? into view
##force_more_message += hydra.* comes? into view
###force_more_message += killer bee.* comes? into view
##force_more_message += electric eel.* comes? into view
##
##force_more_message += wielding.* distortion.* comes? into view
##force_more_message += floating eye.* comes? into view
##force_more_message += carrying a wand
##force_more_message += serpent.* comes? into view
##force_more_message += demonologist.* comes? into view
##force_more_message += fiend.* comes? into view
##force_more_message += tzitzi.* comes? into view
##force_more_message += pandemonium lord.* comes? into view
##force_more_message += cacodemon.* comes? into view
##force_more_message += neqoxec.* comes? into view
##force_more_message += wretched star.* comes? into view
##force_more_message += shining eye.* comes? into view
##force_more_message += zyme.* comes? into view
##force_more_message += hellion.* comes? into view
##force_more_message += tormentor.* comes? into view
##force_more_message += orb.* of fire.* comes? into view
##
###force_more_message += (?-i:[A-Z]).* comes? into view
##
##force_more_message += Found a gate leading to another region of Pandemonium
##force_more_message += You found a shaft
##runrest_stop_message += You found a shaft
##
##flash_screen_message += You are slowing down
##flash_screen_message += wielding.* distortion.* comes? into view
##flash_screen_message += Ashenzari invites you to partake
##flash_screen_message += Ru believes you are ready to make a new sacrifice
##flash_screen_message += Vehumet offers you knowledge
##
##: if you.race() ~= "Gargoyle" and you.race() ~= "Ghoul" and you.race() ~= "Mummy" and you.race() ~= "Djinni" then
##  force_more_message += dream sheep.* comes? into view
##:end
##: if you.race() ~= "Gargoyle" then
##force_more_message += plume of calc
##:end
##
##
##### Portals
##
##force_more_message += ticking.*clock
##force_more_message += dying ticks
##force_more_message += distant snort
##force_more_message += coins.*counted
##force_more_message += tolling.*bell
##force_more_message += roar of battle
##force_more_message += creaking.*portcullis
##force_more_message += portcullis is probably
##force_more_message += wave of frost
##force_more_message += crackling.*melting
##force_more_message += hiss.*sand
##force_more_message += sound.*rushing water
##force_more_message += rusting.*drain
##force_more_message += drain falling apart
##force_more_message += heat about you
##force_more_message += falling.*rocks
##force_more_message += rumble.*avalanche of rocks
##force_more_message += crackle.*arcane power
##force_more_message += crackle.*magical portal
##force_more_message += distant wind
##force_more_message += whistling.*wind
##force_more_message += rapidly growing quiet
##
##confirm_action += Death's Door
##
##
##### Messages
##
##msc := message_colour
##
##channel.monster_damage = plain
##channel.god = plain
##channel.monster_spell = plain
##channel.monster_enchant = plain
##channel.friend_spell = darkgrey
##channel.friend_enchant = darkgrey
##channel.monster_warning = yellow
##channel.timed_portal = lightgreen
##
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

### Kills (is there a universal way to colour this?)
##msc ^= brown: you kill
##msc ^= brown: you destroy
##msc ^= brown: dies
##msc ^= brown: you blow up
##msc ^= brown: is destroyed
##msc ^= brown: is incinerated
##msc ^= brown: drowns
##
### Misc
##msc ^= green: more experienced
##msc ^= green: you have finished your manual
##msc ^= darkgrey: you are exhausted
##msc ^= yellow: is nearby
##msc ^= yellow: there are.* nearby
##msc ^= darkgrey: You now have
##
### mute useless messages
### todo
##
##msc ^= mute: begin reading
##
##
##### Squelch stupid prompts
##
##{
##function c_answer_prompt(prompt)
##  if prompt == "Annotate level on other end of current stairs?" then
##    return false
##  end
##end
##}
##{
##function c_answer_prompt(prompt)
##  if prompt == "Are you sure you want to leave the Dungeon? This will make you lose the game!" then
##    return false
##  end
##end
##}
##
##
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

: if you.god() == "Cheibriados"then
default_autopickup = false
force_more_message += comes? into view
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
   
  macros += M {-270} ===toggle_zigmode 


-- ### Magus

-- ##
-- ## Globals.rc
-- ################################################################################################
-- # PAUSE variable for ForceMorePrompts.rc
-- $PAUSE_MORE := PAUSE

-- {
--   -- Pause for AnnounceDamage.lua
--   PAUSE_MORE = "PAUSE"

--   -- Standard Colors (ignoring black, not visible)
--   COLORS = {
--     ["darkgrey"] = "darkgrey",
--     ["lightgrey"] = "lightgrey",
--     ["white"] = "white",
--     ["blue"] = "blue",
--     ["lightblue"] = "lightblue",
--     ["green"] = "green",
--     ["lightgreen"] = "lightgreen",
--     ["cyan"] = "cyan",
--     ["lightcyan"] = "lightcyan",
--     ["red"] = "red",
--     ["lightred"] = "lightred",
--     ["magenta"] = "magenta",
--     ["lightmagenta"] = "lightmagenta",
--     ["yellow"] = "yellow",
--     ["brown"] = "brown"}
-- }

-- ##
-- ## Utils.lua
-- ################################################################################################
-- {
-- function withColor(color, str)
--   return string.format("<%s>%s</%s>", color, str, color)
-- end

-- function rc_out(symbol, color, msg)
--   crawl.mpr(string.format("%s <%s>%s</%s>", symbol, color, msg, color))
-- end
-- function rc_msg(msg)
--   rc_out("🤖", "blue", msg)
-- end
-- function rc_scs(msg)
--   rc_out("✅", "green", msg)
-- end
-- function rc_err(msg)
--   rc_out("❌", "lightred", msg)
-- end


-- function table_has(table, match)
--   for index, value in ipairs(table) do
--     if value == match then
--       return true
--     end
--   end

--   return false
-- end
-- }



-- ##
-- ## Lua Setup
-- ################################################################################################
-- ##
-- ## AnnounceDamage.lua
-- ################################################################################################
-- {
-- local Messages = {
--   ["HPSimple"] = function(delta)
--     return withColor(COLORS.white,
--       string.format("HP[%s]", delta_color(0 - delta))
--     )
--   end,
--   ["HPMax"] = function (color, hp, hpm, delta)
--     crawl.mpr(
--       withColor(COLORS.lightgreen,
--         string.format("You now have %s max hp (%s).", hpm, delta_color(delta))
--       )
--     )
--   end,
--   ["HPLoss"] = function (color, hp, hpm, loss)
--     crawl.mpr(
--       string.format("%s%s",
--         withColor(COLORS.red, string.format("You take %s damage,", loss)),
--         withColor(color, string.format(" and now have %s/%s hp.", hp, hpm))
--       )
--     )
--   end,
--   ["HPGain"] = function (color, hp, hpm, gain)
--     crawl.mpr(
--       string.format("%s%s",
--         withColor(COLORS.lightgreen, string.format("You regained %s hp,", gain)),
--         withColor(color, string.format(" and now have %s/%s hp.", hp, hpm))
--       )
--     )
--   end,
--   ["HPFull"] = function (color, hp)
--     crawl.mpr(
--       withColor(COLORS.lightgreen,
--         string.format("Your hp is fully restored (%s).", hp)
--       )
--     )
--   end,
--   ["HPMassivePause"] = function ()
--     crawl.mpr(
--       withColor(COLORS.lightred,
--         string.format("MASSIVE DAMAGE!! (%s)", PAUSE_MORE)
--       )
--     )
--   end,
--   ["MPSimple"] = function(delta)
--     return withColor(COLORS.white,
--       string.format("MP[%s]", delta_color(0 - delta))
--     )
--   end,
--   ["MPLoss"] = function (color, mp, mpm, loss)
--     crawl.mpr(
--       string.format("%s%s",
--         withColor(COLORS.cyan, string.format("You lost %s mp,", loss)),
--         withColor(color, string.format(" and now have %s/%s mp.", mp, mpm))
--       )
--     )
--   end,
--   ["MPGain"] = function (color, mp, mpm, gain)
--     crawl.mpr(
--       string.format("%s%s",
--         withColor(COLORS.cyan, string.format("You regained %s mp,", gain)),
--         withColor(color, string.format(" and now have %s/%s mp.", mp, mpm))
--       )
--     )
--   end,
--   ["MPFull"] = function (color, mp)
--     crawl.mpr(
--       withColor(COLORS.cyan, string.format("Your mp is fully restored (%s).", mp))
--     )
--   end,
-- [""]=""}

-- local prev_hp = 0
-- local prev_hp_max = 0
-- local prev_mp = 0
-- local prev_mp_max = 0

-- function delta_color(delta)
--   local color = delta < 0 and COLORS.red or COLORS.green
--   local signDelta = delta < 0 and delta or "+"..delta
--   return string.format("<%s>%s</%s>", color, signDelta, color)
-- end

-- -- Simplified condensed HP and MP output
-- -- Print a single condensed line showing HP & MP change
-- -- e.g.😨 HP[-2] MP[-1]
-- function simple_announce_damage(curr_hp, max_hp, hp_diff, mp_diff)
--   local emoji = ""
--   local message = nil

--   -- MP[-1]
--   if hp_diff == 0 and mp_diff ~= 0 then
--     message = Messages.MPSimple(mp_diff)
--   -- HP[-2]
--   elseif hp_diff ~= 0 and mp_diff == 0 then
--     message = Messages.HPSimple(hp_diff)
--   -- HP[-2] MP[-1]
--   elseif hp_diff ~= 0 and mp_diff ~= 0 then
--     message = string.format("%s %s", Messages.HPSimple(hp_diff), Messages.MPSimple(mp_diff))
--   else
--     -- No changes
--   end

--   if message ~= nil then
--     if curr_hp <= (max_hp * 0.25) then
--       emoji = "😱"
--     elseif curr_hp <= (max_hp * 0.50) then
--       emoji = "😨"
--     elseif curr_hp <= (max_hp *  0.75) then
--       emoji = "😮"
--     elseif curr_hp < max_hp then
--       emoji = "😕"
--     else
--       emoji = "😎"
--     end

--     crawl.mpr(string.format("\n%s %s", emoji, message))
--   end
-- end

-- -- Try to sync with colors defined in Interface.rc
-- function color_by_max(message_func, curr, max, diff)
--   if curr <= (max * 0.25) then
--     message_func(COLORS.red, curr, max, diff)
--   elseif curr <= (max * 0.50) then
--     message_func(COLORS.lightred, curr, max, diff)
--   elseif curr <= (max *  0.75) then
--     message_func(COLORS.yellow, curr, max, diff)
--   else
--     message_func(COLORS.lightgrey, curr, max, diff)
--   end
-- end

-- function announce_damage()
--   -- TODO Define Colors.Red, Colors.Green, etc.

--   -- TODO Move current/previous into array pair
--   -- Save previous as last_hp
--   -- Shift current into previous
--   -- Early return if last_hp was == 0

--   local curr_hp, max_hp = you.hp()
--   local curr_mp, max_mp = you.mp()

--   --Skips message on initializing game
--   if prev_hp > 0 then
--     local hp_diff = prev_hp - curr_hp
--     local max_hp_diff = max_hp - prev_hp_max
--     local mp_diff = prev_mp - curr_mp
--     local max_mp_diff = max_mp - prev_mp_max

--     -- Simplified condensed HP and MP output
--     simple_announce_damage(curr_hp, max_hp, hp_diff, mp_diff)

--     -- HP Max
--     if max_hp_diff > 0 then
--       Messages.HPMax(COLORS.green, curr_hp, max_hp, max_hp_diff)
--     elseif max_hp_diff < 0 then
--       Messages.HPMax(COLORS.yellow, curr_hp, max_hp, max_hp_diff)
--     end

--     -- HP Loss
--     -- Ensure we lost MORE than the change in max hp
--     -- i.e. a change in max hp should not be considered damage
--     if (hp_diff > 0 and hp_diff > math.abs(max_hp_diff)) then
--       color_by_max(Messages.HPLoss, curr_hp, max_hp, hp_diff)

--       if hp_diff > (max_hp * 0.20) then
--         Messages.HPMassivePause()
--       end
--     end

--     -- HP Gain
--     -- More than 1 HP gained
--     if (hp_diff < 0) then
--       -- Remove the negative sign by taking absolute value
--       local hp_gain = math.abs(hp_diff)

--       if (hp_gain > 1) and not (curr_hp == max_hp) then
--         color_by_max(Messages.HPGain, curr_hp, max_hp, hp_gain)
--       end

--       if (curr_hp == max_hp) then
--         Messages.HPFull(nil, curr_hp)
--       end
--     end

--     -- MP Gain
--     -- More than 1 MP gained
--     if (mp_diff < 0) then
--       -- Remove the negative sign by taking absolute value
--       local mp_gain = math.abs(mp_diff)

--       if (mp_gain > 1) and not (curr_mp == max_mp) then
--         color_by_max(Messages.MPGain, curr_mp, max_mp, mp_gain)
--       end

--       if (curr_mp == max_mp) then
--         Messages.MPFull(nil, curr_mp)
--       end
--     end

--     -- MP Loss
--     -- Ensure we lost MORE than the change in max mp
--     -- i.e. a change in max mp should not be considered loss
--     if (mp_diff > 0 and mp_diff > math.abs(max_mp_diff)) then
--       color_by_max(Messages.MPLoss, curr_mp, max_mp, mp_diff)
--     end

--   end

--   --Set previous hp/mp and form at end of turn
--   prev_hp = curr_hp
--   prev_hp_max = max_hp
--   prev_mp = curr_mp
--   prev_mp_max = max_mp
-- end
-- }

-- ##
-- ## NoteVersion.lua
-- ################################################################################################
-- {
-- local didRun = false
-- function note_version()
--   if didRun then
--     return
--   end

--   local version = "magus.rc [v1.9.6]"
--   crawl.take_note(version)
--   didRun = true
-- end
-- }

-- ##
-- ## TurnReady.lua
-- ################################################################################################
-- {
-- -- Run every player turn
-- function ready()
--   -- rc_msg("Running ready function...")

--   -- Display damage taken in log
--   announce_damage()

--   note_version()
-- end
-- }



-- ##
-- ## RC Options (http://crawl.akrasiac.org/docs/options_guide.txt)
-- ################################################################################################
-- ##
-- ## Init.rc
-- ################################################################################################
-- # When set to `true` or `full`, the game will pregenerate the entire
-- # connected dungeon when starting a new character. This leads to
-- # deterministic dungeon generation relative to a particular game seed, at
-- # the cost of a slow game start. If set to `incremental`, the game will
-- # generate levels as needed so that it always generates them in the same
-- # order, also producing a deterministic dungeon. You still may encounter
-- # variation in bazaars, the abyss, pandemonium, and ziggurats, and for
-- # incremental pregeneration, artefacts. When set to `false` or `classic`,
-- # the game will generate all levels on level entry, as was the rule before
-- # 0.23. Some servers may disallow full pregeneration.
-- # https://github.com/crawl/crawl/blob/master/crawl-ref/docs/options_guide.txt#L421
-- #
-- # `incremental` produces deterministic results and `full` is not supported
-- # by webtiles, so we set this to `incremental` here for the best result
-- pregen_dungeon = incremental

-- ##
-- ## Travel.rc
-- ################################################################################################
-- autofight_stop = 75
-- autofight_caught = true

-- # Prevent travel from routing through deep water.
-- # By default, this option is commented out. For merfolk and/or characters with
-- # permanent levitation, this will prevent travel or explore from going through any water
-- # travel_avoid_terrain = deep water

-- # Wait until your HP and MP are both at rest_wait_percent before moving
-- rest_wait_percent = 100
-- explore_auto_rest = true

-- # Adjusts how much autoexplore favours attempting to discover room perimeters and corners.
-- # At higher values, autoexplore will more heavily favour visiting squares that are next to walls;
-- # at 0 it will not favour them at all.
-- explore_wall_bias = 3

-- # auto explore stop defaults
-- explore_stop  = stairs,shops,altars,portals,branches,runed_doors,runes
-- explore_stop += artefacts,glowing_items,greedy_pickup_smart,greedy_visited_item_stack

-- # stop exploring for transformation ending
-- # activity_interrupt_names
-- # https://github.com/crawl/crawl/blob/9bf6f1401de0176e0e695ad85b3e9fc7e42da3ab/crawl-ref/source/delay.cc#L1306
-- runrest_stop_message += Your transformation is almost over.

-- ##
-- ## Interface.rc
-- ################################################################################################
-- # hp and mp bar coloring
-- hp_colour = 100:lightgreen, 99:lightgray, 75:yellow, 50:lightred, 25:red
-- mp_colour = 100:cyan, 99:lightgray, 75:yellow, 50:lightred, 25:red
-- hp_warning = 50

-- # monster colors
-- monster_list_colour =
-- monster_list_colour += friendly:green,neutral:brown
-- monster_list_colour += good_neutral:brown,strict_neutral:brown
-- monster_list_colour += trivial:darkgrey,easy:lightgrey
-- monster_list_colour += tough:yellow,nasty:lightred

-- # new characters start with manual skill (instead of automatic)
-- default_manual_training = true
-- # Unequip already equipped items by selecting in equip menus (i.e. w, W, P)
-- equip_unequip = true
-- # Cannot target self with risky magic
-- allow_self_target = no
-- # mini map size, [X] pixels per tile
-- tile_map_pixels = 8

-- # Zot count status
-- # If you spend the indicated number of turns in this branch without descending to
-- # a new floor, Zot will find and consume you.
-- # always_show_zot determines whether to show the "Zot" status light at all times
-- # even when you've got plenty of time left. defaults to `false`
-- always_show_zot = true

-- ##
-- ## Bindkey.rc
-- ################################################################################################
-- # All commands and their key binds
-- # https://github.com/jmbjr/dcss/blob/master/crawl-ref/docs/keybind.txt

-- # CTRL+N will autofight without moving
-- bindkey = [^N] CMD_AUTOFIGHT_NOMOVE

-- ##
-- ## AutoInscribe.rc
-- ################################################################################################
-- show_god_gift = unident

-- ai := autoinscribe

-- # Inscribe forbidden items for PickupEquipment
-- ai += forbidden:forbidden

-- ai += (bad|dangerous)_item.*potion:!q
-- ai += (bad|dangerous)_item.*scroll:!r
-- ai += potions? of berserk rage:!q
-- ai += scrolls? of (blinking|immolation|magic mapping|silence|vulnerability):!r

-- ai += of faith:!P
-- ai += manual of:!d

-- # Inscribe distortion weapons if you are not worshipping Lugonu
-- : if you.god() ~= "Lugonu" then
-- ai += distortion:!w
-- ai += (Sonja|Psyche):!w
-- : end

-- # Prevent melee with all staves;
-- # If we want to melee with one, it's safe to require removing the annotation.
-- ai += magical staff:!a

-- # Prevent auto quivering and cycling ammo
-- ai += (large rock|throwing net|curare|of dispersal):=f

-- # Warn before throwing
-- ai += (throwing net|of dispersal):!f

-- # Convenient shortcuts
-- ai += curing:@q1
-- ai += potions? of heal wounds:@q2
-- ai += potions? of haste:@q3
-- ai += scrolls? of teleportation:@r4
-- ai += identify:@r1
-- ai += remove curse:@r2
-- ai += chunks of flesh:@e1
-- # match ration but not wand of disinteg(ration)
-- ai += (?<!disinteg)ration:@e2

-- # Automated inscription for sorting armor & weapons
-- # e.g. `mace` to find any mace
-- ai += (dagger|quick blade|short sword|rapier):short
-- ai += (falchion|long sword|scimitar|demon blade|eudemon blade|double sword|great sword|triple sword):long
-- ai += (hand axe|war axe|broad axe|battleaxe|executioner's axe):axe
-- ai += (whip|club|mace|flail|morningstar|demon whip|sacred scourge|dire flail|eveningstar|great mace|giant club|giant spiked club):mace
-- ai += (spear|trident|halberd|scythe|demon trident|trishula|glaive|bardiche):polearm
-- ai += (staff|quarterstaff|lajatang):staff
-- # throwing match tests (https://regexr.com/5cs44)
-- # should match
-- #   - stone
-- #   - dart
-- #   - throwing net
-- #   - boomerang
-- #   - javelin
-- #   - large rock
-- #   - ...and plurals of all above
-- # should not match
-- #   - dart slug
-- #   - a chunk of flesh
-- #   - moonstone
-- #   - soapstone
-- #   - a stone giant corpse
-- ai += (dart(?! slug)|throwing net|(?<!moon|soap)stone(?!(\s(giant|golem)))|boomerang|javelin|large rock)s?:throwing
-- ai += (hunting sling|fustibalus):sling
-- ai += (shortbow|longbow):bow
-- ai += (hand crossbow|arbalest|triple crossbow):crossbow


-- # Rare items
-- ai += (executioner's axe|double sword|triple sword|eveningstar|quick blade):rare=g
-- ai += (storm dragon scales|quicksilver dragon scales|shadow dragon scales|pearl dragon scales|gold dragon scales|crystal plate):rare
-- ai += (pearl dragon scales|crystal plate):=g

-- ##
-- ## AutoPickup.rc
-- ################################################################################################
-- : if you.race() == "Mummy" then
-- autopickup = (/?"+|0}$
-- : elseif you.race() == "Vampire" then
-- autopickup = (/?"!+|0}$
-- # Felids are hard.
-- : elseif you.race() == "Felid" then
-- autopickup = /?"!+0}$
-- : else
-- autopickup = (/?"!+|0}$
-- : end
-- # )       Weapons
-- # (       Missiles
-- # [       Armour
-- # /       Wands
-- # ?       Scrolls
-- # " or =  Jewellery
-- # !       Potions
-- # + or :  Books
-- # |       Staves
-- # 0       Orbs
-- # }       Miscellaneous
-- # $       Gold
-- # Note that _whether_ items are picked up automatically or not, is
-- # controlled by the in-game toggle Ctrl-A. Also note that picking
-- # up takes a turn, but only one turn (regardless of the number of
-- # items). If you teleport or blink onto a square with interesting
-- # items, these will not be picked up.

-- ae := autopickup_exceptions

-- # Reset all autopickup exceptions
-- ae =

-- # Small & Little races cannot carry javelins
-- : if table_has({"Halfling", "Kobold", "Felid", "Spriggan"}, you.race()) then
-- ae += >javelin
-- : end

-- # Only Troll & Ogre pickup large rocks
-- : if not table_has({"Ogre", "Troll"}, you.race()) then
-- ae += >large rock
-- : end

-- # Jewellery
-- ae += >amulets? of (inaccuracy)
-- ae += >rings? of (teleportation|attention)
-- : if table_has({"Gargoyle", "Vampire", "Mummy", "Ghoul"}, you.race()) then
-- ae += >rings? of (poison resistance)
-- : end
-- : if table_has({"Deep Dwarf"}, you.race()) then
-- ae += >amulets? of (regeneration)
-- : end

-- # Scrolls
-- : if table_has({"Vampire", "Mummy", "Ghoul"}, you.race()) then
-- ae += >scrolls? of (holy word)
-- : else
-- ae += <scrolls? of (holy word)
-- :end

-- : if table_has({"Formicid"}, you.race()) then
-- ae += >scrolls? of (teleportation)
-- : else
-- ae += <scrolls? of (teleportation)
-- :end

-- ae += <scrolls? of (vulnerability|immolation|torment)
-- ae += >scrolls? of (amnesia|noise|random uselessness)

-- ae += <potions? of (mutation|lignification)
-- ae += >potions? of (degeneration|stabbing)

-- # Miscellaneous
-- ae += <(tins of tremorstones)

-- # Pickup runes but not 'runed' anything
-- ae += <rune(s)?[^d]

-- ##
-- ## ItemColors.rc
-- ################################################################################################
-- ## Menu & Item colors should match exactly when possible.
-- ## For menu_colour, the first match ignores subsequent matches.
-- ## For item_glyph, subsequent matches override previous ones.
-- ## Many of the entries below come from dat/defaults/menu_colours.txt,
-- ## which we have to duplicate here since we want only some of the
-- ## entries from that file.

-- # Enable use of darkgrey
-- bold_brightens_foreground=true

-- # Set alias
-- item := item_glyph
-- menu := menu_colour

-- # Clear default
-- menu =

-- menu += notes:white:Reached XP level

-- ### General Inventory ###

-- ## Reasonable defaults
-- item += potion:lightgrey
-- item += scroll:lightgrey
-- item += wand:lightgrey
-- item += dangerous_item:blue
-- item += useless_item:darkgrey

-- # Items currently not affecting you.
-- menu += darkgrey:(melded)
-- # Items disliked by your god.
-- menu += red:forbidden
-- # Useless items, comes here to override artefacts etc.
-- menu += darkgrey:.*useless.*
-- # Handle cursed and equipped items early to override other colour settings.
-- menu += lightred:.*equipped.* cursed
-- menu += red: (a|the) cursed
-- menu += inventory:lightgreen:.*equipped.*
-- # Colouring of autoinscribed god gifts
-- menu += pickup:cyan:god gift
-- # Highlight (partly) selected items
-- menu += inventory:white:\w \+\s
-- menu += inventory:white:\w \#\s

-- ### Food ###
-- ## Color chunks, put ordinary ones on lightgrey.

-- menu += red:evil_eating.*chunk
-- item += evil_eating.*chunk:red
-- menu += blue:mutagenic.*chunk
-- item += mutagenic.*chunk:blue
-- menu += lightgrey:chunks?.*flesh
-- item += chunks?.*flesh:lightgrey
-- menu += green:( ration)
-- item += ( ration):green

-- ### Potions ###

-- menu += lightgrey:potions? of.*(flight|stabbing)
-- item += potions? of.*(flight|stabbing):lightgrey
-- menu += brown:potions? of.*berserk
-- item += potions? of.*berserk:brown
-- menu += yellow:potions? of.*might
-- item += potions? of.*might:yellow
-- menu += cyan:potions? of.*cancellation
-- item += potions? of.*cancellation:cyan
-- menu += blue:potions? of.*(lignification|ambrosia)
-- item += potions? of.*(lignification|ambrosia):blue
-- menu += lightred:potions? of.*experience
-- item += potions? of.*experience:lightred
-- menu += white:potions? of.*(heal wounds|curing)
-- item += potions? of.*(heal wounds|curing):white
-- menu += green:potions? of.*resistance
-- item += potions? of.*resistance:green
-- menu += lightgreen:potions? of.*(haste|invisibility)
-- item += potions? of.*(haste|invisibility):lightgreen
-- menu += lightcyan:potions? of.*mutation
-- item += potions? of.*mutation:lightcyan
-- menu += magenta:potions? of.*brilliance
-- item += potions? of.*brilliance:magenta
-- menu += lightmagenta:potions? of.*magic
-- item += potions? of.*magic:lightmagenta

-- ### Scrolls ###

-- : if table_has({"Vampire", "Mummy", "Ghoul"}, you.race()) then
--   menu += darkgrey:scroll.*holy word
--   item += scroll.*holy word:darkgrey
--   menu += brown:scroll.*torment
--   item += scroll.*torment:brown
-- : else
--   menu += brown:scroll.*holy word
--   item += scroll.*holy word:brown
--   menu += darkgrey:scroll.*torment
--   item += scroll.*torment:darkgrey
-- : end
-- menu += white:scroll.*acquirement
-- item += scroll.*acquirement:white
-- menu += yellow:scroll.*(summoning)
-- item += scroll.*(summoning):yellow
-- menu += cyan:scroll.*identify
-- item += scroll.*identify:cyan
-- menu += lightcyan:scroll.*magic mapping
-- item += scroll.*magic mapping:lightcyan
-- menu += blue:scroll.*(noise|silence|vulnerability|immolation)
-- item += scroll.*(noise|silence|vulnerability|immolation):blue
-- menu += lightgrey:scroll.*remove curse
-- item += scroll.*remove curse:lightgrey
-- menu += green:scroll.*(fog|teleport)
-- item += scroll.*(fog|teleport):green
-- menu += lightgreen:scroll.*(fear|blink)
-- item += scroll.*(fear|blink):lightgreen
-- menu += lightmagenta:scroll.*(enchant|brand weapon)
-- item += scroll.*(enchant|brand weapon):lightmagenta

-- ### Wands ###

-- # Sometimes can be dangerous or harmful
-- menu += blue:wand of.*random effects
-- item += wand of.*random effects:blue

-- # Single target piercing
-- menu += brown:wand of.*lightning
-- item += wand of.*lightning:brown
-- menu += yellow:wand of.*acid
-- item += wand of.*acid:yellow

-- menu += lightgrey:wand of.*flame
-- item += wand of.*flame:lightgrey
-- menu += white:wand of.*clouds
-- item += wand of.*clouds:white

-- menu += green:wand of.*digging
-- item += wand of.*digging:green

-- # Single-turn AOE
-- menu += cyan:wand of.*iceblast
-- item += wand of.*iceblast:cyan
-- menu += lightcyan:wand of.*scattershot
-- item += wand of.*scattershot:lightcyan

-- # MR-checking
-- menu += magenta:wand of.*(disintegration|confusion|polymorph)
-- item += wand of.*(disintegration|confusion|polymorph):magenta
-- menu += lightmagenta:wand of.*(paralysis|enslavement)
-- item += wand of.*(paralysis|enslavement):lightmagenta

-- ### General identification ###

-- menu += cyan:manual of
-- item += manual of:cyan
-- menu += lightcyan:manual
-- item += manual:lightcyan
-- menu += lightblue:unidentified .*(potion|scroll|wand|jewellery|book|rod|magical staff)
-- item += unidentified.*(potion|scroll|wand|jewellery|book|rod|magical staff).*:lightblue

-- ### Gear ###

-- menu += magenta:.*known .*(ring of (dexterity|strength|intelligence|slaying|evasion|protection(?! from))|amulet of reflection)
-- item += known.*(ring of (dexterity|strength|intelligence|slaying|evasion|protection(?! from))|amulet of reflection):magenta

-- menu += inventory:lightgray:.*(book|jewellery|magical staff)
-- item += (identified|known).*(book|jewellery|magical staff):lightgray

-- menu += lightmagenta:unidentified.*artefact.*
-- item += unidentified.*artefact.*(jewellery).*:lightmagenta
-- menu += white:.*artefact.*
-- item += identified.*artefact.*(jewellery):white

-- # Ego items
-- menu += lightblue:unidentified.*weapon.*(runed|glowing|enchanted)
-- menu += lightblue:unidentified.*armour.*(runed|glowing|embroidered|shiny|dyed)

-- # Want this to override anything above
-- item += (a )?stones?$:lightgray
-- item += useless:darkgrey
-- # Only mark these types when forbidden; for other types it looks odd.
-- item += forbidden.*(potion|scroll|food):red

-- ##
-- ## ForceMorePrompts.rc
-- ################################################################################################
-- show_more = false

-- # 1. Dungeon Features
-- # 2. Failure
-- # 3. Bad Things
-- # 4. Translocations
-- # 5. Expiring Effects
-- # 6. Religion
-- # 7. Hell Effects
-- # 8. Monsters

-- # Set alias
-- more := force_more_message
-- stop := runrest_stop_message

-- ####################
-- # Dungeon Features #
-- ####################

-- # Abyssal Rune
-- more += Found .* abyssal rune of Zot

-- # Entrances, Exits, and Arrivals
-- more += Found a frozen archway
-- more += Found a gateway leading out of the Abyss
-- more += Found a labyrinth entrance
-- more += Found a staircase to the Ecumenical Temple
-- more += The mighty Pandemonium lord.*resides here

-- # Portal Timers
-- more += distant snort
-- more += interdimensional caravan
-- more += invites you to visit
-- more += oppressive heat
-- more += roar of battle
-- more += sound of rushing water
-- more += The drain falls to bits
-- more += There is an entrance to a bailey on this level
-- more += tolling of a bell
-- more += wave of frost
-- more += You hear the drain falling apart
-- more += You hear.*crackle.*magical portal
-- more += You hear.*crackling.*archway
-- more += You hear.*creaking.*(oriflamme|portcullis)
-- more += You hear.*hiss.*sand
-- more += You hear.*rumble.*avalanche
-- more += You hear.*rusting.*drain
-- more += You hear.*ticking.*clock

-- # Traps
-- more += (blundered into a|invokes the power of) Zot
-- more += A huge blade swings out and slices into you
-- stop += An alarm trap emits a blaring wail
-- stop += found a zot trap
-- stop += hear a soft click
-- more += The power of Zot is invoked against you
-- more += You (become entangled|are caught) in (a|the) (web|net)
-- more += You fall through a shaft
-- more += You stumble into the trap

-- # Other
-- more += Another plant grows acid sacs
-- more += One of the plants suddenly grows acid sacs
-- more += The walls and floor vibrate strangely for a moment
-- more += You are suddenly pulled into a different region
-- more += You have a vision of.*gates?

-- ###########
-- # Failure #
-- ###########

-- more += do not work when you're silenced
-- more += sense of stasis
-- more += Something interferes with your magic
-- more += The rod doesn't have enough magic points
-- more += The spell fizzles
-- more += The writing blurs in front of your eyes
-- more += The.*is unaffected
-- more += This potion can/'t work under stasis
-- more += This wand has no charges
-- more += too hungry
-- more += You are held in a net
-- more += You are too injured to fight blindly
-- more += You can't gag anything down
-- more += You can't unwield
-- more += You cannot cast spells when silenced
-- more += You cannot cast spells while unable to breathe
-- more += You cannot teleport right now
-- more += You don't have any such object
-- more += You don't have enough magic
-- more += You don't.* that spell
-- more += You fail to use your ability
-- more += You have no appropriate body parts free
-- more += You have no means to grasp a wand firmly enough
-- more += You haven't enough magic at the moment
-- more += You miscast
-- more += Your amulet of stasis
-- more += Your attempt to break free
-- more += Your body armour is too heavy

-- #############################
-- # Bad and Unexpected Things #
-- #############################

-- # announce_damage
-- more += $PAUSE_MORE

-- # Bad things happening to you
-- more += corrodes your equipment
-- more += Your corrosive artefact corrodes you
-- more += are blown away by the wind
-- more += dispelling energy hits you
-- more += infuriates you
-- more += lose consciousness
-- more += mark forms upon you
-- more += Ouch! That really hurt!
-- more += silver sears you
-- more += Space bends around you
-- more += Space warps horribly around you
-- more += surroundings become eerily quiet
-- more += Terrible wounds (open|spread) all over you
-- more += The acid corrodes your
-- more += The air around.*erupts in flames
-- more += The air twists around and violently strikes you in flight
-- more += You shudder from the earth-shattering force
-- more += The arrow of dispersal hits you[^r]
-- more += The barbed spikes become lodged in your body
-- more += The barbed spikes dig painfully into your body as you move
-- more += The blast of calcifying dust hits you[^r]
-- more += The poison in your body grows stronger
-- more += The pull of.*song draws you forwards
-- more += The.*engulfs you in water
-- more += The.*grabs you[^r]
-- more += You (are|feel) drained
-- more += You are (blasted|electrocuted)
-- more += You are blown backwards
-- more += You are burned terribly
-- more += You are encased in ice
-- more += You are engulfed in calcifying dust
-- more += You are engulfed in dark miasma
-- more += You are engulfed in mutagenic fog
-- more += You are knocked back
-- more += You are mesmerised
-- more += You are slowing down
-- more += You are trampled
-- more += You convulse
-- more += You feel a (horrible|terrible) chill
-- more += You feel haunted
-- more += You feel less vulnerable to poison
-- more += You feel your attacks grow feeble
-- more += You feel your flesh.*rot
-- more += You feel your power drain away
-- more += You feel your power leaking away
-- more += You feel yourself grow more vulnerable to poison
-- more += You stumble backwards
-- more += You.*re (confused|more confused|too confused)
-- more += You.*re (poisoned|more poisoned|lethally poisoned)
-- more += Your body is wracked with pain
-- more += Your damage is reflected back at you
-- more += Your limbs are stiffening
-- more += Your magical defenses are stripped away
-- more += Your?.*suddenly stops? moving

-- # Monsters doing bad things
-- more += A tree reaches out and hits you!
-- more += Agitated ravens fly out from beneath the
-- more += begins to recite a word of recall
-- more += Being near the torpor snail leaves you feeling lethargic
-- more += blows on a signal horn
-- more += cast banishment
-- more += cast paralyse
-- more += cast Torment
-- more += goes berserk
-- more += The moth of wrath goads something on
-- more += is duplicated
-- more += is no longer invulnerable
-- more += Its appearance distorts for a moment
-- more += Mara seems to draw the.*out of itself
-- more += Mara shimmers
-- more += Miasma billows from the
-- more += shoots a curare
-- more += stands defiantly in death's doorway
-- more += steals.*your
-- more += swoops through the air toward you
-- more += The forest starts to sway and rumble
-- more += The jumping spider pounces on you [^but]
-- more += The octopode crusher throws you
-- more += The shadow imp is revulsed by your support of nature
-- more += The water nymph flows with the water
-- more += The.*offers itself to Yredelemnul
-- more += The.*seems to speed up
-- more += The.*shudders
-- more += There is a horrible\, sudden wrenching feeling in your soul
-- more += Vines fly forth from the trees!
-- more += You are hit by a branch
-- more += You feel you are being watched by something
-- more += Your magical defenses are stripped away
-- more += \'s.*reflects

-- # Unexpected situations
-- more += A magical barricade bars your way
-- more += Done waiting
-- more += doors? slams? shut
-- more += It doesn't seem very happy
-- more += Mutagenic energies flood into your body
-- more += Some monsters swap places
-- more += (are starving|devoid of blood)
-- more += (The|Your).*falls away!
-- more += The divine light dispels your darkness!
-- more += The walls disappear
-- more += There is a sealed passage
-- more += You are wearing\:
-- more += You cannot afford.*fee
-- # more += You feel (dopey|clumsy|weak)
-- more += You feel a genetic drift
-- more += You feel monstrous
-- more += You feel your rage building
-- more += You have disarmed
-- more += You have finished your manual
-- more += You need to eat something NOW
-- more += You smell decay. (^Yuck!)
-- more += You stop (a|de)scending the stairs
-- more += You turn into a fleshy mushroom
-- more += Your body shudders with the violent release of wild energies
-- more += Your guardian golem overheats
-- more += your magic stops regenerating
-- more += Your scales start
-- more += your.*devoured
-- more += Green shoots are pushing up through the earth

-- # Things getting better
-- stop += contamination has completely
-- more += You can move again
-- more += You slip out of the net
-- more += You.*and break free
-- more += Your fit of retching subsides
-- more += seems mollified

-- # Ghouls
-- : if you.race() == "Ghoul" then
-- 	stop += smell.*(rott(ing|en)|decay)
-- 	stop += something tasty in your inventory
-- : end

-- ##################
-- # Translocations #
-- ##################

-- # Teleporting
-- more += You blink
-- more += You.*teleport [^f]
-- more += You feel strangely (unstable|stable)
-- more += You feel your translocation being delayed
-- more += Your surroundings flicker
-- more += Your surroundings seem slightly different
-- more += Your surroundings suddenly seem different
-- # -Tele
-- more += You cannot blink right now
-- more += You cannot teleport right now
-- more += You feel.*firmly anchored in space
-- more += You are no longer firmly anchored in space
-- # -cTele
-- more += You feel your control is inadequate

-- ####################
-- # Expiring Effects #
-- ####################

-- # God Abilities
-- # Divine Shield (The Shining One)
-- more += Your divine shield starts to fade.
-- more += Your divine shield fades away.
-- # Jelly Prayer (Jiyva)
-- more += Your prayer is over.
-- # Mirror Damage (Yredelemnul)
-- more += dark mirror aura disappears

-- # Player Spells
-- # Aura of Abjuration
-- stop += Your aura of abjuration expires
-- # Control Teleport
-- stop += you feel uncertain
-- # Death's Door
-- more += time is quickly running out
-- more += life is in your own
-- # Enslavement
-- more += is no longer charmed
-- # Flight
-- more += You are starting to lose your buoyancy
-- stop += You lose control over your flight
-- # Haste
-- more += Your extra speed is starting to run out
-- more += You feel yourself slow down
-- # Invisibility
-- more += You feel more conspicuous
-- more += You flicker for a moment
-- more += You flicker back
-- # Ozocubu's Armour and Condensation Shield
-- more += Your icy (shield|armour) evaporates
-- more += Your.*(shield|armour) melts away
-- # Phase Shift
-- more += You feel closer to the material plane
-- more += You are firmly grounded in the material plane once more
-- # Repel/Deflect
-- stop += missiles spell is about to expire
-- more += You feel less protected from missiles
-- # Shroud of Golubria
-- stop += shroud begins to fray
-- stop += shroud unravels
-- more += Your shroud falls apart
-- # Silence
-- more += Your hearing returns
-- # Swiftness
-- stop += start to feel a little slower
-- more += You feel sluggish
-- # Transmutations
-- more += Your transformation is almost over
-- more += You have a feeling this form
-- more += Your skin feels tender
-- more += You feel yourself come back to life

-- # Other
-- # Potion of Resistance
-- more += You start to feel less resistant.
-- more += Your resistance to elements expires

-- ############
-- # Religion #
-- ############

-- # Gifts or abilities are ready
-- # Dithmenos
-- more += You are shrouded in an aura of darkness
-- more += You now sometimes bleed smoke
-- more += You.*no longer.*bleed smoke
-- more += Your shadow no longer tangibly mimics your actions
-- more += Your shadow now sometimes tangibly mimics your actions
-- # Gozag
-- more += will now duplicate a non-artefact item
-- # Jiyva
-- more += will now unseal the treasures of the Slime Pits
-- # Kikubaaqudgha
-- more += Kikubaaqudgha will now enhance your necromancy
-- # Lugonu
-- more += Lugonu will now corrupt your weapon
-- # Qazlal
-- more += resistances upon receiving elemental damage
-- more += You are surrounded by a storm which can block enemy attacks
-- # Ru
-- more += you are ready to make a new sacrifice
-- # Sif Muna
-- more += Sif Muna is protecting you from the effects of miscast magic
-- # The Shining One
-- more += The Shining One will now bless
-- # Zin
-- more += will now cure all your mutations

-- # You Screwed Up
-- more += is no longer ready

-- # Poor Decisions
-- more += You really shouldn't be using

-- # Gaining new abilities
-- : if you.god() ~= "Uskayaw" then
-- more += You can now
-- more += Your?.*can no longer
-- : end

-- # Wrath
-- more += Nemelex gives you another card to finish dealing
-- more += Fedhas invokes the elements against you
-- more += Lugonu sends minions to punish you
-- more += Okawaru sends forces against you
-- more += wrath finds you

-- # Xom Effects
-- more += staircase.*moves
-- more += is too large for the net to hold

-- # Other
-- more += Jiyva alters your body
-- : if you.god() == "Xom" then
-- more += god:
-- : end

-- : if not string.find(you.god(), "Jiyva") then
-- more += splits in two
-- :end

-- ################
-- # Hell Effects #
-- ################

-- more += A gut-wrenching scream fills the air
-- more += Brimstone rains from above
-- more += Die\, mortal
-- more += Leave now\, before it is too late
-- more += Something frightening happens
-- more += Trespassers are not welcome here
-- more += We do not forgive those who trespass against us
-- more += We have you now
-- more += You do not belong in this place
-- more += You feel a terrible foreboding
-- more += You feel lost and a long\, long way from home
-- more += You hear diabolical laughter
-- more += You hear words spoken in a strange and terrible language
-- more += You sense a hostile presence
-- more += You sense an ancient evil watching you
-- more += You shiver with fear
-- more += You smell brimstone
-- more += You suddenly feel all small and vulnerable
-- more += You will not leave this place
-- more += You have reached level
-- more += You rejoin the land of the living

-- ############
-- # Monsters #
-- ############

-- # Arriving Unexpectedly
-- more += appears in a shower of sparks
-- more += appears out of thin air
-- more += comes (up|down) the stairs
-- more += Something appears in a flash of light
-- more += The.*is a mimic
-- more += You sense the presence of something unfriendly
-- more += The.*answers the.*call
-- more += Wisps of shadow swirl around
-- more += Shadows whirl around

-- # Item Use
-- more += drinks a potion
-- more += evokes.*(amulet|ring)
-- more += reads a scroll
-- more += zaps a (wand|rod)

-- # Dangerous monsters we force_more when first seen.
-- # Things with ranged (or extremely fast), irresistable effects.
-- more += ((floating|shining) eye|dream sheep|death drake).*into view
-- more += (wretched star|apocalypse crab|death drake).*into view
-- more += (entropy weaver|torpor snail|spriggan druid).*into view
-- more += (vault (warden|sentinel)|merfolk (avatar|siren)).*into view
-- more += (guardian serpent|draconian shifter|convoker|death cob).*into view
-- more += (phantasmal warrior|air elemental).*into view
-- # Distortion
-- more += distortion
-- # Malmutate
-- more += (cacodemon|neqoxec).*into view
-- # Paralysis/Petrify/Banish
-- more += (orc sorcerer|(?<!orc )wizard|ogre mage|great orb of eyes|sphinx).*into view
-- more += (vampire knight|basilisk|deep elf (sorcerer|demonologist)).*into view
-- # Torment/flay or hellfire
-- more += (flayed ghost|greater mummy|mummy priest|fiend|tzitzimitl).*into view
-- more += (tormentor|curse toe|curse skull|hell sentinel|hellion).*into view
-- more += (deep elf (sorcerer|high priest)|draconian scorcher).*into view
-- # Things that can hit for over 90+ damage in a turn that is either ranged or very fast.
-- more += ((deep elf|draconian) annihilator|tengu reaver).*into view
-- more += (lich|orb of fire|executioner|juggernaut|shrike).*into view

-- # Any uniques and any pan lords
-- more += (?-i:[A-Z]).* comes? into view

-- ##
-- ## Morgue.rc
-- ################################################################################################

-- note_hp_percent = 25
-- user_note_prefix = >>

-- note_items += artefact
-- note_items += experience,of Zot,acquirement,Archmagi
-- note_items += crystal plate,pearl dragon scales,gold dragon scales

-- # note some auto inscribes
-- # do not match curare
-- note_messages += (?<!cu)rare

-- note_messages += You feel monstrous
-- note_messages += You pass through the gate
-- note_messages += [bB]anish.*Abyss
-- note_messages += cast .* Abyss
-- note_messages += protects you from harm
-- note_messages += You fall through a shaft

-- # note when things come into view with unrands
-- # unrands are not identified properly in notes
-- # see https://github.com/crawl/crawl/issues/1580

-- # hardcode note_messages for unrands as a temporary work around
-- # http://crawl.chaosforge.org/List_of_unrands
-- #short blades
-- note_messages += wielding.*?Vampire's Tooth
-- note_messages += wielding.*?dagger "Morg"
-- note_messages += wielding.*?Spriggan's Knife
-- note_messages += wielding.*?arc blade
-- note_messages += wielding.*?captain's cutlass
-- note_messages += wielding.*?quick blades "Gyre" and "Gimble"
-- # long blades
-- note_messages += wielding.*?Singing Sword
-- note_messages += wielding.*?sword of Zonguldrok
-- note_messages += wielding.*?Maxwell's thermic engine
-- note_messages += wielding.*?autumn katana
-- note_messages += wielding.*?demon blade "Leech"
-- note_messages += wielding.*?zealot's sword
-- note_messages += wielding.*?sword of Power
-- note_messages += wielding.*?sword of Cerebov
-- note_messages += wielding.*?plutonium sword
-- # staves
-- note_messages += wielding.*?staff of Dispater
-- note_messages += wielding.*?sceptre of Asmodeus
-- note_messages += wielding.*?staff of Olgreb
-- note_messages += wielding.*?Elemental Staff
-- note_messages += wielding.*?staff of Wucad Mu
-- note_messages += wielding.*?staff of Battle
-- note_messages += wielding.*?Majin-Bo
-- note_messages += wielding.*??lajatang of Order
-- # axes
-- note_messages += wielding.*?mithril axe "Arga"
-- note_messages += wielding.*?obsidian axe
-- note_messages += wielding.*?Wrath of Trog
-- note_messages += wielding.*?frozen axe "Frostbite"
-- note_messages += wielding.*?Axe of Woe
-- # polearms
-- note_messages += wielding.*?lance "Wyrmbane"
-- note_messages += wielding.*?trident of the Octopus King
-- note_messages += wielding.*?demon trident "Rift"
-- note_messages += wielding.*?glaive of the Guard
-- note_messages += wielding.*?glaive of Prune
-- note_messages += wielding.*?scythe of Curses
-- note_messages += wielding.*?scythe "Finisher"
-- # maces & flails
-- note_messages += wielding.*?shillelagh "Devastator"
-- note_messages += wielding.*?whip "Snakebite"
-- note_messages += wielding.*?morningstar "Eos"
-- note_messages += wielding.*?demon whip "Spellbinder"
-- note_messages += wielding.*?sceptre of Torment
-- note_messages += wielding.*?great mace "Undeadhunter"
-- note_messages += wielding.*?great mace "Firestarter"
-- note_messages += wielding.*?mace of Variability
-- note_messages += wielding.*?giant club "Skullcrusher"
-- note_messages += wielding.*?dark maul
-- # ranged weapons
-- note_messages += wielding.*?sling "Punk"
-- note_messages += wielding.*?longbow "Zephyr"
-- note_messages += wielding.*?storm bow
-- note_messages += wielding.*?arbalest "Damnation"
-- note_messages += wielding.*?heavy crossbow "Sniper"
-- # armours
-- note_messages += wearing.*?robe of Folly
-- note_messages += wearing.*?robe of Misfortune
-- note_messages += wearing.*?robe of Augmentation
-- note_messages += wearing.*?robe of Night
-- note_messages += wearing.*?robe of Clouds
-- note_messages += wearing.*?robe of Vines
-- note_messages += wearing.*?skin of Zhor
-- note_messages += wearing.*?salamander hide armour
-- note_messages += wearing.*?Cigotuvi's embrace
-- note_messages += wearing.*?moon troll leather armour
-- note_messages += wearing.*?Kryia's mail coat
-- note_messages += wearing.*?faerie dragon scales
-- note_messages += wearing.*?Lear's hauberk
-- note_messages += wearing.*?Maxwell's patent armour
-- note_messages += wearing.*?scales of the Dragon King
-- note_messages += wearing.*?orange crystal plate armour
-- # shields
-- note_messages += wearing.*?warlock's mirror
-- note_messages += wearing.*?shield of Resistance
-- note_messages += wearing.*?shield of the Gong
-- note_messages += wearing.*?tower shield of Ignorance
-- # cloaks
-- note_messages += wearing.*?cloak of the Thief
-- note_messages += wearing.*?ratskin cloak
-- note_messages += wearing.*?cloak of Starlight
-- note_messages += wearing.*?dragonskin cloak
-- # headgear
-- note_messages += wearing.*?hat of the Bear Spirit
-- note_messages += wearing.*?crown of Dyrovepreva
-- note_messages += wearing.*?mask of the Dragon
-- note_messages += wearing.*?hat of the Alchemist
-- note_messages += wearing.*?hat of Pondering
-- note_messages += wearing.*?hood of the Assassin
-- # gloves
-- note_messages += wearing.*?gauntlets of War
-- note_messages += wearing.*?fencer's gloves
-- # bardings
-- note_messages += wearing.*?Black Knight's barding
-- note_messages += wearing.*?lightning scales
-- # rings
-- note_messages += wearing.*?ring of Shadows
-- note_messages += wearing.*?ring of the Hare
-- note_messages += wearing.*?ring of the Mage
-- note_messages += wearing.*?ring of the Octopus King
-- note_messages += wearing.*?ring of the Tortoise
-- # amulets
-- note_messages += wearing.*?brooch of Shielding
-- note_messages += wearing.*?necklace of Bloodlust
-- note_messages += wearing.*?amulet of the Four Winds
-- note_messages += wearing.*?amulet of the Air
-- note_messages += wearing.*?macabre finger necklace
-- note_messages += wearing.*?amulet of Vitality


-- # note treasure troves and requirements for parsing
-- # https://regexr.com/5fqgo
-- note_messages += This trove
-- note_messages += This portal proclaims the superiority

-- # record spellbook and spell locations
-- note_messages += You pick up a book
-- note_messages += You add the spells

-- # Noteable monsters
-- # Undead
-- note_monsters += ancient lich,curse skull,curse toe,greater mummy
-- # Depths
-- note_monsters += caustic shrike
-- # Special hall_of_zot spawns
-- note_monsters += killer klown,electric golem,orb of fire
-- # Other
-- note_monsters += silver star,pearl dragon

-- ##
-- ## Messages.rc
-- ################################################################################################
-- # Variables for message highlighting
-- $danger   := lightred
-- $item_dmg := red
-- $warning  := yellow
-- $boring   := darkgrey
-- $negative := brown
-- $good     := lightblue
-- $positive := green
-- $verypositive := lightgreen
-- $awesome := lightmagenta
-- $interface := cyan
-- $takesaction := blue
-- $godaction := magenta
-- $mp := lightcyan

-- ## Channels

-- # channel.plain =
-- channel.prompt = $interface
-- channel.god = $godaction
-- channel.duration = $warning
-- channel.danger = $danger
-- channel.warning = $danger
-- channel.recovery = $verypositive
-- channel.talk = $warning
-- channel.talk_visual = $boring
-- channel.timed_portal = $warning
-- # channel.sound =
-- channel.intrinsic_gain = $awesome
-- # channel.mutation = --either danger/warning/awesome
-- channel.monster_spell = $takesaction
-- # channel.monster_enchant = --either danger/warning/boring/takesaction
-- channel.friend_spell = $takesaction
-- # channel.friend_enchant = --either danger/warning/boring/takesaction
-- channel.friend_action = $takesaction
-- channel.monster_damage = mute
-- # monster_target = --currently unused by the game
-- # channel.banishment = --either positive or danger
-- channel.equipment = $interface
-- # channel.floor =
-- channel.multiturn = $boring
-- # channel.examine =
-- # channel.examine_filter =
-- # channel.diagnostics =
-- # channel.error =
-- # channel.tutorial =
-- channel.orb = $awesome
-- # channel.hell_effect = -either danger/warning/boring

-- # Set alias
-- ignore := runrest_ignore_message

-- # Annoyances
-- ignore += melds into your body
-- ignore += unmelds from your body
-- ignore += grinding sound
-- ignore += contamination has completely
-- ignore += your breath back
-- ignore += feeling hungry
-- ignore += near starving

-- ignore += pray:
-- ignore += talk:
-- ignore += talk_visual:
-- ignore += friend_spell:
-- ignore += friend_enchant:
-- ignore += friend_action:
-- ignore += sound:

-- # Set Alias
-- msc := message_colour
-- # Clear defaults
-- msc =

-- msc += $mp:You feel your power returning

-- #msc += $danger:
-- msc += $danger:The entropy weaver begins to chant a word of entropy
-- msc += $danger:Your corrosive artefact corrodes you
-- msc += $danger:cannot move out of your way
-- msc += $danger:Tentacles burst from Mnoleg
-- msc += $danger:tentacle flies out from Mnoleg
-- msc += $danger:roused to righteous anger
-- msc += $danger:is roused by the hymn
-- msc += $danger:A magical barricade bars your way
-- msc += $danger:is repulsed
-- msc += $danger:seems less drained
-- msc += $danger:preventing you from leaping
-- msc += $danger:shrugs off the wave
-- msc += $danger:Your unholy channel expires
-- msc += $danger:Being near the torpor snail leaves you feeling lethargic
-- msc += $danger:The amulet engulfs you in a massive magical discharge
-- msc ^= $danger:Your.*appears confused
-- msc ^= $danger:You open a gate to Pandemonium
-- msc += $danger:Some icy apparitions appear
-- msc += $danger:You feel less empathic
-- msc ^= $danger:Qazlal is no longer ready to protect you from an element
-- msc ^= $danger:Your divine halo fades away
-- msc ^= $danger:Your divine shield disappears
-- msc ^= $danger:The orb of electricity explodes
-- msc ^= $danger:Your divine shield fades away
-- msc += $danger:visions of slaying
-- msc += $danger:You.*no longer.*bleed smoke
-- msc += $danger:Your shadow no longer tangibly mimics your actions
-- msc += $danger:You are even more entangled
-- msc += $danger:You have drawn Pain
-- msc += $danger:Your magical shield disappears
-- msc ^= $danger:Your.*drowns
-- msc += $danger:creates some ice likenesses
-- msc += $danger:soul is no longer ripe for the taking
-- msc += $danger:You are no longer magically infusing your attacks
-- msc += $danger:The ambient light returns to normal
-- msc += $danger:An iron grate slams shut
-- msc += $danger:begins to accept
-- msc += $danger:begins to recite a word of recall
-- msc += $danger:begins to radiate toxic energy
-- msc += $danger:The shadow imp is revulsed by your support of nature
-- msc += $danger:Careful! You are starting to lose your buoyancy
-- msc ^= $danger:plants?.*suddenly grows? acid sacs
-- msc ^= $danger:Your.*is devoured by a tear in reality
-- msc += $danger:Your body is bloodless
-- msc += $danger:Your unliving flesh cannot be transformed in this way
-- msc += $danger:You feel less resistant to cold
-- msc += $danger:You can't disarm
-- msc += $danger:You feel strangely static
-- msc += $danger:A powerful magic interferes with your control of the blink
-- msc += $danger:burns you terribly
-- msc += $danger:You are no longer teleporting projectiles to their destination
-- msc += $danger:Water floods your area
-- msc += $danger:You feel the presence of a powerless spirit
-- msc += $danger:You feel less resistant to (cold|fire)
-- msc += $danger:You feel less protected from
-- msc += $danger:You hear a crashing sound
-- msc += $danger:The tree smolders and burns
-- msc ^= $danger:You are contaminated with residual magics
-- msc += $danger:is duplicated
-- msc += $danger:You sense a malign presence
-- msc += $danger:The deck only has
-- msc += $danger:blocks your orb of destruction
-- msc += $danger:There are no remains here to animate
-- msc += $danger:Your ring of flames gutters out
-- msc += $danger:The elephant guardians awaken
-- msc += $danger:slides away
-- msc += $danger:moves from beneath you
-- msc += $danger:A powerful magic prevents control of your teleportation
-- msc += $danger:There's only.*cards? left!
-- msc += $danger:A huge vortex of air appears
-- msc += $danger:you're silenced
-- msc += $danger:Your hands slow down
-- msc += $danger:Your shroud falls apart
-- msc += $danger:Not with that terrain in the way
-- msc += $danger:Your teleport is interrupted
-- msc += $danger:Your.*revert to.*normal proportions
-- msc += $danger:Its appearance distorts for a moment
-- msc += $danger:A shaft opens up in the floor
-- msc += $danger:You are held in a net
-- msc += $danger:(The|Your).*falls away!
-- msc += $danger:The orbs collide in a blinding explosion
-- msc += $danger:You feel the power of the Abyss delaying your translocation
-- msc += $danger:Mara shimmers
-- msc += $danger:Your.*is blown up
-- msc += $danger:seems to grow more fierce
-- msc += $danger:attacks!
-- msc += $danger:You sense the presence of something unfriendly
-- msc += $danger:Your.*falls into the water
-- msc += $danger:Something unseen opens the huge gate
-- msc += $danger:changes into something you cannot see
-- msc += $danger:The rod doesn't have enough magic points
-- msc += $danger:The power of the Abyss keeps you in your place
-- msc += $danger:Your.*is destroyed
-- msc += $danger:You feel your control is inadequate
-- msc += $danger:A great vortex of raging winds appears
-- msc += $danger:You blow up your
-- msc += $danger:The sixfirhy seems to be charged up
-- msc += $danger:You feel your power drain away
-- msc += $danger:You cannot cast spells when silenced
-- msc += $danger:You feel hot and cold all over
-- msc += $danger:You don't have the energy to cast that spell
-- msc += $danger:and don't expect to remain undetected
-- msc += $danger:but the box appears empty
-- msc += $danger:your gold pieces vanish
-- msc += $danger:Your.*dies
-- msc += $danger:You cannot teleport right now
-- msc += $danger:You feel your power drawn to a protective spirit
-- msc += $danger:your magic stops regenerating
-- msc += $danger:Some monsters swap places
-- msc += $danger:You turn into a spiny porcupine
-- msc += $danger:Your limbs have turned to stone
-- msc += $danger:Your skin feels tender
-- msc += $danger:You turn into a fleshy mushroom
-- msc += $danger:The sound of falling rocks suddenly begins to subside
-- msc += $danger:The walls and floor vibrate strangely for a moment
-- msc += $danger:Your.*(armour|shield) melts away
-- msc += $danger:drains you
-- msc += $danger:You need to eat something NOW
-- msc += $danger:feel drained
-- msc += $danger:strangely unstable
-- msc += $danger:curare-tipped.*hits you
-- msc += $danger:Space warps.* around you
-- msc += $danger:Space bends around you
-- msc += $danger:Space bends sharply around you!
-- msc += $danger:sense of stasis
-- msc += $danger:clumsily bash
-- msc += $danger:goes berserk
-- msc += $danger:Forgetting.* will destroy the book
-- msc += $danger:The blast of calcifying dust hits you
-- msc += $danger:You are engulfed in calcifying dust
-- msc += $danger:^It .* you
-- msc += $danger:[^f]Something.*you[^r]
-- msc += $danger:grabs you[^r]
-- msc += $danger:you convulse
-- msc += $danger:is unaffected
-- msc += $danger:blinks into view
-- msc += $danger:seems to speed up
-- msc += $danger:You feel yourself slow down
-- msc += $danger:The alarm trap emits a blaring wail
-- msc += $danger:The mark upon you grows brighter.
-- msc += $danger:flickers (and vanishes|out of sight)
-- msc += $danger:Terrible wounds (open|spread)
-- msc += $danger:The acid burns
-- msc += $danger:The.*is recalled
-- msc += $danger:The.*blows on a signal horn!
-- msc += $danger:You miscast
-- msc += $danger:zaps a wand
-- msc += $danger:You are no longer berserk
-- msc += $danger:You suddenly lose the ability to move
-- msc += $danger:Your.*glows black for a moment
-- msc += $danger:You are caught in a web
-- msc += $danger:You are knocked back by the lance of force
-- msc += $danger:You are knocked back by the blast of cold
-- msc += $danger:You are knocked back by the great wave of water
-- msc += $danger:You feel very sick
-- msc += $danger:Your.*falls away
-- msc += $danger:splits in two
-- msc += $danger:assumes the form|sacrifices itself
-- msc += $danger:Necromantic energies
-- msc += $danger:You feel an extremely numb sensation
-- msc += $danger:You feel jittery for a moment
-- msc += $danger:You are caught in (a|the) (net|web)
-- msc += $danger:You become entangled in (a|the) (net|web)
-- msc += $danger:You fall asleep
-- msc += $danger:The forest starts to sway and rumble
-- msc += $danger:Vines fly forth from the trees!
-- msc += $danger:Roots grasp at your
-- msc += $danger:Roots rise up from beneath you and drag you back to the ground
-- msc += $danger:The.*picks up a wand
-- msc += $danger:You struggle against (a|the) (net|web)
-- msc += $danger:You struggle to escape the net
-- msc += $danger:The.*engulfs you in water
-- msc += $danger:Your magical defenses are stripped away
-- msc += $danger:appears out of thin air
-- msc += $danger:You feel less protected from missiles
-- msc += $danger:The power of Zot is invoked against
-- msc += $danger:you fail to dodge
-- msc += $danger:Death has come for you
-- msc += $danger:Your body is wracked with pain
-- msc += $danger:You sense an overwhelmingly malignant aura
-- msc += $danger:Space twists in upon itself
-- msc += $danger:Strange energies course through your body
-- msc += $danger:You feel haunted
-- msc += $danger:Your.*suddenly stops moving
-- msc += $danger:You feel incredibly sick
-- msc += $danger:You don't have enough magic
-- msc += $danger:You haven't enough magic at the moment
-- msc += $danger:You fall through a shaft
-- msc += $danger:seems to grow stronger
-- msc += $danger:Dowan seems to find hidden reserves of power
-- msc += $danger:Oops, that.*feels deathly cold
-- msc += $danger:You struggle to resist
-- msc += $danger:You barely resist
-- msc += $danger:You turn into an animated tree
-- msc += $danger:Your roots penetrate the ground
-- msc += $danger:is no longer charmed
-- msc += $danger:You try to slip out of the net
-- msc += $danger:You become entangled in the net
-- msc += $danger:You feel a build-up of mutagenic energy
-- msc += $danger:You cannot pacify this monster
-- msc += $danger:You feel a (horrible|terrible) chill
-- msc += $danger:You are burned terribly
-- msc += $danger:moth of wrath (goads|infuriates) the
-- msc += $danger:you trip and fall back down the stairs
-- msc += $danger:the glow from your corona prevents you from becoming completely invisible
-- msc += $danger:A red film seems to cover your vision as you go berserk
-- msc += $danger:Your limbs are stiffening
-- msc += $danger:You have turned to stone
-- msc += $danger:Draining that being is not a good idea
-- msc += $danger:You feel.*ill
-- msc += $danger:You can't gag anything down
-- msc += $danger:Something feeds on your intellect
-- msc += $danger:The barbed spikes become lodged in your body
-- msc += $danger:You feel your translocation being delayed
-- msc += $danger:You fail to use your ability
-- msc += $danger:Oh no! You have blundered into a Zot trap
-- msc += $danger:Wisps of shadow swirl around
-- msc += $danger:The.*grows two more
-- msc += $danger:There is a sealed passage
-- msc += $danger:doors? slams? shut
-- msc += $danger:A basket of spiders falls from above
-- msc += $danger:is bolstered by the flame
-- msc ^= $danger:Mennas' surroundings become eerily quiet
-- msc += $danger:attempts to bespell you
-- msc += $danger:You feel horribly lethargic
-- msc += $danger:firmly anchored in space
-- msc += $danger:You stop (a|de)scending the stairs
-- msc += $danger:You tear a large gash into the net
-- msc += $danger:reflects
-- msc += $danger:The walls disappear
-- msc += $danger:You cannot afford.*fee
-- msc += $danger:This weapon is already enchanted
-- msc += $danger:You feel.*sluggish
-- msc += $danger:You no longer adapt resistances upon receiving elemental damage
-- msc += $danger:The storm surrounding you is now too weak to repel missiles
-- msc += $danger:You feel extremely strange
-- msc += $danger:This meat tastes really weird
-- msc += $danger:You finish putting on your cursed
-- msc += $danger:It was a potion of paralysis
-- msc += $danger:You feel rather ponderous
-- msc += $danger:That seemed strangely inert
-- msc += $danger:You can't unwield your weapon to draw a new one
-- msc += $danger:the volcano erupts with a roar
-- msc += $danger:too hungry
-- msc += $danger:Your guardian golem overheats
-- msc += $danger:burn any scroll you tried to read
-- msc += $danger:You are blown backwards
-- msc += $danger:It is caustic
-- msc += $danger:Not only inedible but also greatly harmful
-- msc += $danger:evokes.*(amulet|ring)
-- msc += $danger:take too long for a potion to reach your roots
-- msc += $danger:There was something very wrong with that liquid
-- msc += $danger:You cannot move
-- msc += $danger:stands defiantly in death's doorway
-- msc += $danger:zaps a rod
-- msc += $danger:twongs alarmingly
-- msc += $danger:You feel yourself grow more vulnerable to poison
-- msc += $danger:The poison in your body grows stronger
-- msc += $danger:You are being crushed by all of your possessions
-- msc += $danger:You are carrying too much
-- msc += $danger:You draw Wild Magic
-- msc += $danger:You draw the Helix
-- msc += $danger:This potion can/'t work under stasis
-- msc += $danger:Your icy (armour|shield) evaporates
-- msc += $danger:You struggle to detach yourself from the web
-- msc += $danger:You are more confused
-- msc += $danger:You are confused
-- msc += $danger:breaks free
-- msc += $danger:(You are|You're) too confused
-- msc += $danger:Your skin stops crawling
-- msc += $danger:Your attempt to break free
-- msc += $danger:Your resistance to elements expires
-- msc += $danger:You are blasted by holy energy
-- msc += $danger:You feel uncertain
-- msc += $danger:You are firmly grounded in the material plane once more
-- msc += $danger:The writing blurs in front of your eyes
-- msc += $danger:You cannot cast spells while unable to breathe
-- msc += $danger:You feel your rage building
-- msc += $danger:You feel a little less
-- msc += $danger:You are wearing\:.*cursed
-- msc += $danger:This card doesn't seem to belong here
-- msc += $danger:You flicker back
-- msc += $danger:something.*blocking the
-- msc += $danger:You slice into (a|the) (net|web)
-- msc += $danger:It doesn't seem very happy
-- msc += $danger:You have been turned into a pig
-- msc += $danger:comes? into view
-- msc += $danger:You feel quite a bit less full
-- msc += $danger:Your unstable footing causes you to fumble your attack
-- msc += $danger:You are being weighed down by all of your possessions
-- msc += $danger:flinch away in fear
-- msc += $danger:is completely unfazed by your meager offer of peace
-- msc += $danger:deflects the
-- msc += $danger:The blink frog basks in the distortional energy
-- msc += $danger:appears unharmed
-- msc ^= $danger:You and your allies can no longer gain power from killing the unholy and evil
-- msc += $danger:You have lost your religion
-- msc += $danger:Your shroud unravels
-- msc += $danger:Your attacks are no longer magically infused
-- msc += $danger:You feel your attacks grow feeble
-- msc += $danger:Magical energy is drained from your
-- msc += $danger:A chorus of chattering voices calls out to you
-- msc += $danger:You can no longer
-- msc += $danger:The.*shudders
-- msc ^= $danger:Your unholy and evil allies forsake you
-- msc += $danger:Your transformation has ended
-- msc += $danger:Nothing appears to have answered your call
-- msc += $danger:The grasping roots prevent you from becoming airborne
-- msc += $danger:You kill your
-- msc += $danger:You feel less regenerative
-- msc += $danger:Lernaean hydra knocks down a tree
-- msc += $danger:You are caught in an explosion of electrical discharges
-- msc += $danger:bends your attack away
-- msc += $danger:Your song has ended
-- msc += $danger:goes into a battle-frenzy
-- msc += $danger:Your aura of abjuration expires
-- msc += $danger:Your.*is blown up
-- msc += $danger:There's only one card left
-- msc += $danger:You deal a card
-- msc += $danger:darts out from under the net
-- msc += $danger:You wield the.*\'s
-- msc += $danger:dips into the water
-- msc += $danger:You destroy your
-- msc += $danger:You're too exhausted to jump
-- msc += $danger:Your battlesphere expends the last of its energy and dissipates
-- msc += $danger:You feel your bond with your battlesphere wane
-- msc += $danger:Your battlesphere wavers and loses cohesion
-- msc += $danger:You lose concentration completely
-- msc += $danger:go into a battle-frenzy
-- msc += $danger:You can't jump while in water
-- msc += $danger:staircase.*moves
-- msc += $danger:You wield
-- msc += $danger:is filled with.*inner flame
-- msc += $danger:You feel guilty
-- msc += $danger:You feel extremely guilty
-- msc += $danger:picks up.*throwing net
-- msc += $danger:You feel less protected from physical attacks
-- msc ^= $danger:Your.*falters for a moment
-- msc += $danger:Mutagenic energy flows through the plutonium sword
-- msc += $danger:Your spectral weapon fades away
-- msc += $danger:Your.*is incinerated
-- msc ^= $danger:begins absorbing vital energies
-- msc += $danger:Blessed fire suddenly surrounds you
-- msc ^= $danger:Your.*is poisoned
-- msc ^= $danger:Your.*looks even sicker
-- msc ^= $danger:Your.*is no longer beserk
-- msc += $danger:You swing wildly
-- msc += $danger:You lose your focus
-- msc += $danger:You feel threatened and lose the ability
-- msc += $danger:is too large for the net to hold
-- msc ^= $danger:Your.*looks rather confused
-- msc += $danger:The moth of wrath goads something on
-- msc += $danger:The net passes right through
-- msc += $danger:A tornado forms
-- msc ^= $danger:burns? away your fire resistance

-- # Item Destruction, gaining bad mutations, or losing good ones, penance, and gong
-- msc += $item_dmg:You feel your body start to fall apart
-- msc += $item_dmg:Your teeth shrink to normal size
-- msc += $item_dmg:Your.*scales disappear
-- msc += $item_dmg:You feel a strong urge to (yell|scream|shout)
-- msc += $item_dmg:Your wild genetic ride slows down
-- msc += $item_dmg:The barb on your tail disappears
-- msc += $item_dmg:Your wings shrivel and weaken
-- msc += $item_dmg:You feel very strange
-- msc += $item_dmg:You feel conductive
-- msc += $item_dmg:A chill runs up and down your throat
-- msc += $item_dmg:You feel forlorn
-- msc += $item_dmg:Your skin no longer functions as natural camouflage
-- msc += $item_dmg:Your natural healing is weakened
-- msc += $item_dmg:Your rate of healing slows
-- msc += $item_dmg:Your talons dull and shrink into feet
-- msc += $item_dmg:You feel genetically unstable
-- msc += $item_dmg:The horns on your head shrink a bit
-- msc += $item_dmg:You feel an ache in your throat
-- msc += $item_dmg:You feel yourself wasting away
-- msc += $item_dmg:You feel angry
-- msc += $item_dmg:You feel a little pissed off
-- msc += $item_dmg:You feel extremely angry at everything
-- msc += $item_dmg:Your hooves look more like feet
-- msc += $item_dmg:Your hooves expand and flesh out into feet
-- msc += $item_dmg:You feel a little hungry
-- msc += $item_dmg:A piece of fruit is consumed
-- msc += $item_dmg:pieces of fruit are consumed
-- msc += $item_dmg:You feel slightly disoriented
-- msc += $item_dmg:Your system partially rejects artificial healing
-- msc += $item_dmg:You feel even more weirdly uncertain
-- msc += $item_dmg:You feel weirdly uncertain
-- msc += $item_dmg:The drain falls to bits
-- msc += $item_dmg:acid corrodes
-- msc += $item_dmg:The rust devil corrodes your equipment
-- msc += $item_dmg:catch(es)? fire
-- msc ^= $item_dmg:freezes? and shatters?
-- msc += $item_dmg:covered with spores
-- msc += $item_dmg:devours some of your food
-- msc += $item_dmg:rots? away
-- msc += $item_dmg:It has a very clean taste
-- msc += $item_dmg:You feel your flesh rotting away
-- msc += $item_dmg:You are engulfed in dark miasma
-- msc += $item_dmg:You feel very guilty
-- msc += $item_dmg:Done waiting
-- msc += $item_dmg:That really hurt
-- msc += $item_dmg:You fall into the water
-- msc += $item_dmg:PTOANNNG
-- msc += $item_dmg:PANG
-- msc += $item_dmg:GONNNNG
-- msc += $item_dmg:BOUMMMMG
-- msc += $item_dmg:SHROANNG
-- msc += $item_dmg:BONNNG
-- msc ^= $item_dmg:This attack would place you under penance
-- msc += $item_dmg:You will pay for your transgression\, mortal
-- msc += $item_dmg:You hear a distant slurping noise
-- msc ^= $item_dmg:picks up.*(potions?|scrolls?|wand)
-- msc += $item_dmg:drinks a potion
-- msc += $item_dmg:You hear a zap
-- msc += $item_dmg:reads a scroll
-- msc += $item_dmg:Mutagenic energies flood into your body
-- msc += $item_dmg:your body twists? and deforms?
-- msc += $item_dmg:You really shouldn't be using
-- msc += $item_dmg:You die.
-- msc += $item_dmg:You are engulfed in mutagenic fog
-- msc += $item_dmg:Your vision blurs
-- msc += $item_dmg:You feel frail
-- msc += $item_dmg:the book crumbles to dust
-- msc += $item_dmg:Your thinking seems confused
-- msc += $item_dmg:You are heavily infused with residual magics
-- msc += $item_dmg:You no longer feel (cold|heat) resistant
-- msc += $item_dmg:You feel less (cold|heat) resistant
-- msc += $item_dmg:You feel vulnerable to (cold|heat)
-- msc += $item_dmg:You feel less resistant to poisons
-- msc += $item_dmg:You no longer feel resistant to poison
-- msc += $item_dmg:Your vision seems duller
-- msc += $item_dmg:You feel less energetic
-- msc += $item_dmg:You shed all your fur
-- msc += $item_dmg:You begin to rot
-- msc += $item_dmg:Your tentacle spike disappears
-- msc += $item_dmg:You feel less repulsive
-- msc += $item_dmg:The jelly growth is reabsorbed into your body
-- msc += $item_dmg:Your pseudopods become smaller

-- # Warning Messages
-- msc ^= $warning:Creating passages of Golubria requires sufficient empty space
-- msc += $warning:You yowl
-- msc += $warning:You scream at
-- msc += $warning:is no longer covered in acid
-- msc += $warning:is no longer distracted by gold
-- msc += $warning:boulder beetle smashes into something
-- msc += $warning:grate falls apart
-- msc += $warning:Your passage of Golubria closes with a snap
-- msc += $warning:is no longer weakened
-- msc += $warning:Something blocks
-- msc += $warning:You feel jittery
-- msc += $warning:Your aim is not that steady anymore
-- msc += $warning:You feel strangely alone
-- msc += $warning:You feel the tide rushing in
-- msc += $warning:Failed to move towards target
-- msc += $warning:Your protection from physical attacks is fading
-- msc ^= $warning:The Screaming Sword
-- msc += $warning:A large net falls onto you
-- msc += $warning:You stop recalling your allies
-- msc += $warning:You feel a little guilty
-- msc += $warning:snaps.*out of.*fear
-- msc += $warning:Your stasis keeps you stable
-- msc += $warning:You retract your mandibles
-- msc += $warning:The boots cling to your feet
-- msc ^= $warning:Your ring of flames is guttering out
-- msc += $warning:reforms as a
-- msc += $warning:You draw the first five cards.*and discard the rest
-- msc += $warning:You have damaged your brain
-- msc += $warning:A thin mist springs up around you
-- msc += $warning:The mangrove smolders and burns
-- msc += $warning:You feel your anger subside
-- msc += $warning:You feel nervous for a moment
-- msc += $warning:Your.*is burned terribly
-- msc += $warning:Your.*is frozen
-- msc += $warning:There is nothing there\, so you fail to move
-- msc += $warning:You enter the passage of Golubria
-- msc += $warning:You start to feel a little slower
-- msc += $warning:drowns your?
-- msc += $warning:puts on a
-- msc += $warning:Faint laughter comes from somewhere
-- msc += $warning:shroud bends your.*attack away
-- msc += $warning:shadowy figures dance through the air in front of you
-- msc += $warning:This room is filled with shadowy figures
-- msc += $warning:You feel spirits watching over you
-- msc += $warning:You feel a genetic drift
-- msc += $warning:You return to the normal time flow
-- msc ^= $warning:The corpse rots
-- msc += $warning:reappears nearby
-- msc += $warning:I'll put it outside for you
-- msc += $warning:A pair of horns grows on your head
-- msc += $warning:is held in a (net|web)
-- msc += $warning:Smoke pours forth from your.*of chaos
-- msc += $warning:You cannot go berserk while under stasis
-- msc += $warning:You feel less woody
-- msc += $warning:is no longer paralysed
-- msc += $warning:The antennae on your head shrink away
-- msc += $warning:You feel less stealthy
-- msc += $warning:falls into the lava
-- msc ^= $warning:Your spellforged servitor disappears
-- msc += $warning:This weapon is vampiric, and you must be Full or above to equip it
-- msc += $warning:The shock serpent's electric aura discharges
-- msc += $warning:The air sparks with electricity
-- msc += $warning:The cursed.*is stuck to you
-- msc += $warning:You cannot enchant this weapon
-- msc += $warning:You sense an evil presence
-- msc += $warning:Jory draws you further into his thrall
-- msc += $warning:grabs your
-- msc += $warning:You shudder from the earth-shattering force
-- msc += $warning:Smoke pours from your
-- msc += $warning:curses noisily
-- msc += $warning:is no longer blind
-- msc += $warning:Lightning arcs down from a storm cloud
-- msc += $warning:You feel strangely numb
-- msc += $warning:You feel less sure on your feet
-- msc += $warning:The air around you crackles with electrical energy
-- msc += $warning:The vortex of raging winds lifts you up
-- msc += $warning:creates a blast of rain
-- msc += $warning:shimmers and seems to become two
-- msc += $warning:Your ball lightning explodes
-- msc += $warning:There is a sudden explosion of flames
-- msc += $warning:You feel extremely nervous for a moment
-- msc += $warning:The orb fizzles
-- msc += $warning:A film of ice covers the
-- msc += $warning:That ambrosia tasted strange
-- msc += $warning:orb of destruction hits.*wall
-- msc += $warning:Something tries to affect you
-- msc += $warning:You block its attack
-- msc += $warning:A large net falls down
-- msc += $warning:You have made a black mistake
-- msc += $warning:You are stuck in your current form
-- msc += $warning:You feel like a pig
-- msc += $warning:Your hearing returns
-- msc += $warning:You feel less in control of your magic
-- msc += $warning:You feel your magical power running wild
-- msc += $warning:are frozen
-- msc += $warning:Something hits you but does no damage
-- msc += $warning:You turn into a bat
-- msc += $warning:A demon appears
-- msc += $warning:twists and deforms
-- msc += $warning:There is a sudden blast of acid
-- msc += $warning:Die\, mortal
-- msc += $warning:You choke on the stench
-- msc += $warning:Your summoned allies are left behind
-- msc += $warning:You feel that your aim is more steady
-- msc += $warning:There's a creature in the
-- msc += $warning:They are\:
-- msc += $warning:A card falls out of the deck
-- msc += $warning:(dart|javelin|large rock|stone|tomahawk) disappears in a puff of smoke
-- msc += $warning:You can't close doors while held in a net
-- msc += $warning:A slime creature suddenly
-- msc += $warning:You feel closer to the material plane
-- msc += $warning:leaps out from its hiding place
-- msc += $warning:The cursed.*is stuck to your body
-- msc += $warning:You stop removing your armour
-- msc += $warning:You smell decay
-- msc += $warning:You feel a malignant aura surround you
-- msc += $warning:briefly surrounded by a scintillating aura of random colours
-- msc += $warning:looks stronger
-- msc += $warning:You have difficulty breathing
-- msc += $warning:The heat melts your.*(armour|shield)
-- msc += $warning:You are engulfed in a cloud of spores
-- msc += $warning:You feel less perceptive
-- msc += $warning:A profound silence engulfs you
-- msc += $warning:An unnatural silence engulfs you
-- msc ^= $warning:Hurry and find it before the entrance collapses
-- msc += $warning:Your memory of.*unravels
-- msc += $warning:You speak a Word of immense power
-- msc += $warning:seems to move somewhat quicker
-- msc += $warning:steals.*your
-- msc += $warning:A tentacle flies out from the starspawn's body
-- msc += $warning:The explosive bolt releases an explosion
-- msc += $warning:There is a Zot trap here
-- msc += $warning:You enter a teleport trap
-- msc += $warning:You need to enable at least one skill for training
-- msc += $warning:You (resume|stop) training
-- msc += $warning:You feel slightly jumpy
-- msc += $warning:You are splashed with acid
-- msc += $warning:ticking.*clock
-- msc += $warning:dying ticks
-- msc += $warning:distant snort
-- msc += $warning:odd grinding sound
-- msc += $warning:creaking of ancient gears
-- msc += $warning:floor suddenly vibrates
-- msc += $warning:a sudden draft
-- msc += $warning:coins.*counted
-- msc += $warning:tolling.*bell
-- msc += $warning:fails to return
-- msc += $warning:Something appears in a flash of light
-- msc += $warning:you turn into a fiery being
-- msc += $warning:no longer ripe
-- msc += $warning:The wave splashes down
-- msc += $warning:The spell fizzles
-- msc += $warning:Your body armour is too heavy
-- msc += $warning:The crackling of melting ice is subsiding rapidly
-- msc += $warning:seems to gain new vigour
-- msc += $warning:You feel strangely stable
-- msc += $warning:(asks|barks|bellows|boasts|brags|breathes|buzzes|cackles|calls|caws|chants|cheers)
-- msc += $warning:(chilling moan|complains|cries|croak|curses loudly|embarks|explains|Floosh|gibbers|giggles)
-- msc += $warning:(grits|groans|growls|grumbles|grunts|gurgles|hisses|jeers|keens|laughs|launches|makes a sound)
-- msc += $warning:(mewls|moans|mumbles|murmurs|mutters|pleads|prattles|preaches|queries|recites|roars|says)
-- msc += $warning:(scowls|screams|screeches|shout|shriek|sighs|sings|snarls|sneers|snorts|threatens|trumpets)
-- msc += $warning:(utters an oath|wail|wails|whimpers|whisper|yells)
-- msc += $warning:you (roar|yell|hiss)
-- msc += $warning:imitates the bagpipes
-- msc += $warning:looks more energetic
-- msc += $warning:suddenly curses
-- msc += $warning:Dowan breathes
-- msc += $warning:Dowan shakes his head\, saying\, \"No\, no\, no!\"
-- msc += $warning:You hear strange voices
-- msc += $warning:You hear
-- msc += $warning:You drop
-- msc += $warning:You hear an irritating high-pitched whine
-- msc += $warning:You hear snatches of song
-- msc += $warning:seems more stable
-- msc += $warning:opens the (door|gate|large door|huge gate)
-- msc += $warning:dissolves into sparkling lights
-- msc += $warning:[^un]wields
-- msc += $warning:There is a portal leading out of here
-- msc += $warning:Natasha's spirit plunges in to the ground
-- msc += $warning:Natasha's spirit rises from its lifeless body
-- msc += $warning:wears
-- msc += $warning:You are.*contaminated
-- msc += $warning:blinks
-- msc += $warning:You are starting to lose your buoyancy
-- msc += $warning:You float gracefully downwards
-- msc += $warning:Your surroundings suddenly seem different
-- msc += $warning:You feel your bond with your spectral weapon wane
-- msc += $warning:It (begins to drip with poison|bursts into flame|glows with a cold blue light|softly glows with a divine radiance|stops glowing)
-- msc += $warning:Your.*drips with poison
-- msc += $warning:You sense an unholy aura
-- msc += $warning:It is covered in frost
-- msc += $warning:The shock serpent begins to gather electrical charge
-- msc += $warning:moves out of view
-- msc += $warning:basks in the mutagenic energy
-- msc += $warning:Several doors burst open
-- msc += $warning:Flickering shadows surround you
-- msc += $warning:You found a.*trap
-- msc += $warning:You.*one of the.*heads off
-- msc += $warning:slime creatures merge
-- msc += $warning:roars a battle-cry
-- msc += $warning:The.*is healed
-- msc += $warning:You stumble backwards
-- msc += $warning:Are you sure you want to stumble around while confused
-- msc += $warning:it creaks loudly
-- msc += $warning:The.*explodes
-- msc += $warning:You are caught in (a fiery explosion|an explosion of ice and frost)
-- msc += $warning:stops burning
-- msc += $warning:(The |.*)is healed
-- msc += $warning:You feel less studious
-- msc += $warning:(corpses?|macabre mass) merges with
-- msc += $warning:You start to feel a little uncertain
-- msc += $warning:corpses? begins to drag
-- msc += $warning:corpses meld into an agglomeration of writhing flesh
-- msc += $warning:beckons forth a restless soul
-- msc += $warning:Something reaches out for you
-- msc += $warning:Something tries to feed on your intellect
-- msc += $warning:You feel a brief urge to hack something to bits
-- msc += $warning:Pain shudders through your
-- msc += $warning:The.*passes through your shield
-- msc += $warning:draws strength from your injuries
-- msc += $warning:The.*pierces through
-- msc += $warning:The forest fire spreads
-- msc += $warning:The tree burns like a torch
-- msc += $warning:magical defenses are stripped away
-- msc += $warning:You blink
-- msc += $warning:You teleport
-- msc += $warning:You step into.*shadow
-- msc += $warning:Grasping roots rise from the ground around the
-- msc += $warning:The winds start to flow at the.*will
-- msc += $warning:The .*(are|is) blown away
-- msc += $warning:goes into a frenzy at the smell of blood
-- msc += $warning:Something picks up
-- msc += $warning:You smell burning wood
-- msc += $warning:stumbles backwards
-- msc += $warning:looks slightly unstable
-- msc += $warning:slips into darkness
-- msc += $warning:The air around.*erupts in flames
-- msc += $warning:hops backward while attacking
-- msc += $warning:violent explosion of flames
-- msc += $warning:turns its malign attention towards you
-- msc += $warning:Splash!
-- msc += $warning:Harold gasps with his last breath
-- msc += $warning:You enter the shallow water
-- msc += $warning:You see a puff of smoke
-- msc += $warning:pour from your
-- msc += $warning:Tentacles burst out of the water
-- msc += $warning:calls forth a grand avatar
-- msc += $warning:focuses on the pain
-- msc += $warning:suddenly seems more agile
-- msc += $warning:regenerates before your eyes
-- msc += $warning:You feel corrupt for a moment
-- msc += $warning:Send 'em back where they came from
-- msc += $warning:The net rips apart
-- msc += $warning:Your surroundings seem slightly different
-- msc += $warning:You are under the weather
-- msc += $warning:You are standing in the rain
-- msc += $warning:The rain has left you waist-deep in water
-- msc += $warning:We do not forgive those who trespass against us
-- msc += $warning:A.*appears from out of thin air
-- msc += $warning:looks more healthy
-- msc += $warning:A mysterious force pulls you upwards
-- msc += $warning:punctures the fabric of the universe
-- msc += $warning:degenerates into a cloud
-- msc += $warning:wounds heal themselves
-- msc += $warning:is no longer moving slowly
-- msc += $warning:is completely healed
-- msc += $warning:You heal
-- msc += $warning:It is briefly surrounded by a scintillating aura of random colours
-- msc += $warning:Partly explored
-- msc += $warning:There is a shaft here
-- msc += $warning:Dowan seems overcome with grief, but rights himself reflexively soon after
-- msc += $warning:You feel that this wand is rather unreliable
-- msc += $warning:You feel less protected
-- msc += $warning:You hear a crashing sound
-- msc += $warning:shatters
-- msc += $warning:apparitions take form around you
-- msc += $warning:You feel your magic capacity is already quite full
-- msc += $warning:You feel vulnerable
-- msc += $warning:pulls away from the web
-- msc += $warning:withdraws into its
-- msc += $warning:is no longer petrified
-- msc += $warning:You remove
-- msc += $warning:Your.*dissolves into shadows
-- msc += $warning:Your.*stops moving altogether
-- msc += $warning:hides itself under the floor
-- msc += $warning:puts on a burst of speed
-- msc += $warning:decay slows
-- msc += $warning:Your.*is caught in
-- msc += $warning:Thorny briars emerge from the ground!
-- msc += $warning:You flicker for a moment
-- msc += $warning:There is a.*altar.*here
-- msc += $warning:You kneel at the altar
-- msc += $warning:You start to feel less resistant
-- msc += $warning:You feel a strong urge to attack something
-- msc += $warning:You cannot move away from
-- msc += $warning:The pull of.*song draws you forwards
-- msc += $warning:Shadowy forms rise from the deep
-- msc += $warning:You feel as though you will be slow longer
-- msc += $warning:disappears!
-- msc += $warning:Your.*is no longer moving quickly
-- msc += $warning:You feel your magic capacity decrease
-- msc += $warning:drains the heat from the surrounding environment
-- msc += $warning:pounces on you
-- msc += $warning:A tentacle rises from the water
-- msc += $warning:comes (down|up) the stairs
-- msc += $warning:You catch a bit of a chill
-- msc += $warning:A ballistomycete grows in the wake of the spore
-- msc += $warning:A fungus suddenly grows
-- msc += $warning:A toadstool grows
-- msc += $warning:then quickly surges around you
-- msc += $warning:There is a sudden explosion of frost
-- msc += $warning:That was not very filling
-- msc += $warning:You failed to disarm the trap
-- msc += $warning:is covered with a thin layer of ice
-- msc += $warning:draws out.*weapon's spirit
-- msc += $warning:You are pushed out
-- msc ^= $warning:Your.*seems to slow down
-- msc += $warning:thirsts for the lives of mortals
-- msc += $warning:emits a brilliant flash of light
-- msc += $warning:is firebranded into
-- msc += $warning:is no longer bleeding
-- msc += $warning:The dungeon rumbles around Jorgrun!
-- msc += $warning:evaporates and reforms as
-- msc += $warning:You turn into a venomous arachnid creature
-- msc += $warning:infuriates you
-- msc += $warning:Your extra speed is starting to run out
-- msc += $warning:Your skin is crawling a little less now
-- msc += $warning:You stumble into the trap
-- msc += $warning:Your transformation is almost over
-- msc += $warning:You feel magic leave you
-- msc += $warning:You feel magic returning to you
-- msc += $warning:Your (horns|talons) disappear
-- msc += $warning:Tentacles burst from the starspawn
-- msc += $warning:you must find a gate leading back
-- msc += $warning:You fall off the wall
-- msc += $warning:Blech - you need (greens|meat)
-- msc += $warning:A starcursed mass splits
-- msc += $warning:You draw the Sage
-- msc += $warning:You feel a wave of frost pass over you
-- msc += $warning:The creatures around you are filled with an inner flame
-- msc += $warning:is filled with an inner flame
-- msc += $warning:You feel less healthy
-- msc += $warning:summons a great blast of wind
-- msc += $warning:You feel less resistant to hostile enchantments
-- msc += $warning:Your attack snaps.*out of its fear
-- msc += $warning:You feel blessed for a moment
-- msc += $warning:You draw a card
-- msc += $warning:Walls emerge from the floor
-- msc += $warning:You feel like more of a target
-- msc += $warning:is knocked back by the flood of elemental water
-- msc += $warning:blown away by the wind
-- msc += $warning:is surrounded by Orcish apparitions
-- msc += $warning:The.*reappears nearby
-- msc += $warning:The deck of cards disappears
-- msc += $warning:The.*looks more experienced
-- msc += $warning:There is a rocky tunnel leading out of this place here
-- msc += $warning:Your icy (armour|shield) starts to melt
-- msc += $warning:Your legs become a tail
-- msc += $warning:You feel the effects of Trog's Hand fading
-- msc += $warning:You slam the door shut with a bang
-- msc += $warning:This armour is.*for you
-- msc += $warning:magical effects unravel
-- msc += $warning:You awkwardly throw
-- msc += $warning:You erupt
-- msc += $warning:The flames covering.*go out
-- msc += $warning:bleats in terror
-- msc += $warning:seems to regain.*courage
-- msc += $warning:You have a feeling of ineptitude
-- msc += $warning:falls through a shaft
-- msc += $warning:You cannot throw anything while held in a net
-- msc += $warning:furiously retaliates
-- msc += $warning:The blast of chaos engulfs your?
-- msc += $warning:You are engulfed in seething chaos
-- msc += $warning:Your song is almost over
-- msc += $warning:is in the way
-- msc += $warning:You are too berserk
-- msc += $warning:The tentacle pulls you backwards
-- msc += $warning:starcursed mass shudders and
-- msc += $warning:The kraken squirts a massive cloud of ink
-- msc += $warning:Wisps of shadow whirl around
-- msc += $warning:You are too injured to fight recklessly
-- msc += $warning:shakes off its lethargy
-- msc += $warning:I don't know how to get there
-- msc += $warning:Your.*warbles
-- msc += $warning:chimes melodiously
-- msc += $warning:erupts into laughter
-- msc += $warning:makes a deep moaning sound
-- msc += $warning:raves incoherently
-- msc += $warning:speaks gibberish
-- msc += $warning:belts out
-- msc += $warning:yelps
-- msc += $warning:goes tick-tock
-- msc += $warning:gives off a wolf whistle
-- msc ^= $warning:[e] your.* of resist
-- msc += $warning:phases out as you
-- msc += $warning:momentarily phases out
-- msc += $warning:cracks jokes
-- msc += $warning:Your orb of destruction dissipates
-- msc += $warning:regales you with its life story
-- msc += $warning:parrots the noises around you
-- msc += $warning:lets out a mournful sigh
-- msc += $warning:tootles away
-- msc += $warning:makes a horrible noise
-- msc += $warning:burps loudly
-- msc += $warning:You are caught in a violent explosion
-- msc += $warning:pulses with an eldritch light
-- msc += $warning:the glow from your magical contamination prevents you from becoming completely invisible
-- msc += $warning:appears from out of your range of vision
-- msc += $warning:You stop putting on your armour
-- msc += $warning:We have you now
-- msc += $warning:You do not belong in this place
-- msc += $warning:before it is too late
-- msc += $warning:There is a sudden explosion of magical energy
-- msc += $warning:Something forms from out of thin air
-- msc += $warning:You sense a hostile presence
-- msc += $warning:Trespassers are not welcome here
-- msc += $warning:You feel a terrible foreboding
-- msc += $warning:You will not leave this place
-- msc += $warning:wrenching scream
-- msc += $warning:Leave now/, before it is too late
-- msc += $warning:picks up
-- msc += $warning:Nothing appears to happen
-- msc += $warning:The dead are
-- msc += $warning:The boulder beetle hits a closed door
-- msc += $warning:begin to drag.*along the ground
-- msc += $warning:merge to form a (large abomination|macabre mass|small abomination)
-- msc += $warning:Two macabre masses merge
-- msc += $warning:falls through the shaft
-- msc += $warning:There is a crawl-hole back to the Lair here
-- msc += $warning:There is a hole to the Spider Nest here
-- msc += $warning:You create a pond
-- msc += $warning:Mennas becomes audible again
-- msc += $warning:That was extremely unsatisfying
-- msc += $warning:The wind howls around you
-- msc += $warning:You are feeling less magically infused
-- msc += $warning:Something invisible bursts forth from the water
-- msc += $warning:Something.*misses
-- msc += $warning:There is a cloud of mutagenic fog here
-- msc += $warning:howls
-- msc += $warning:You part the fleshy orifice with a squelch
-- msc += $warning:The orb of energy explodes
-- msc += $warning:The air shimmers briefly around you
-- msc += $warning:You are much too full right now
-- msc += $warning:turns to fight
-- msc += $warning:You feel transcendent for a moment
-- msc += $warning:You're too terrified to move while being watched
-- msc += $warning:The weapon returns to the
-- msc += $warning:The queen bee calls on the killer bee to defend her
-- msc += $warning:You turn into a bat
-- msc += $warning:Your.*looks incredibly listless
-- msc += $warning:The mass is resisting your pull
-- msc += $warning:Moving in this stuff is going to be slow
-- msc += $warning:escapes
-- msc += $warning:The silence causes your song to end
-- msc += $warning:You feel (slightly|somewhat) less full
-- msc += $warning:The light of Elyvilon fails to reach
-- msc += $warning:The light of Elyvilon almost touches upon
-- msc += $warning:[^r]pulls free of the water
-- msc += $warning:Your piety has decreased
-- msc += $warning:struggles to resist
-- msc += $warning:You feel.*more hungry
-- msc += $warning:You are outlined in light
-- msc += $warning:Your.*is outlined in light
-- msc += $warning:You feel momentarily disoriented
-- msc += $warning:You are now empty
-- msc += $warning:(prevent|prevents) you from hitting
-- msc += $warning:The water nymph flows with the water
-- msc += $warning:summons a
-- msc += $warning:cannot make way for you
-- msc += $warning:The horns on your head shrink away
-- msc += $warning:Your shroud begins to fray at the edges
-- msc += $warning:You'd need three hands to do that
-- msc += $warning:Your.*disappears
-- msc += $warning:That's too.*for you
-- msc += $warning:The dungeon trembles and rubble falls from the walls
-- msc += $warning:Finesse? Hah! Time to rip out guts
-- msc += $warning:You fail to extend your transformation any further
-- msc += $warning:This spell does not affect your current form
-- msc += $warning:You can't wield anything in your present form
-- msc += $warning:Your.*revert to their normal proportions
-- msc += $warning:Suddenly Natasha's spirit rises from her lifeless body
-- msc += $warning:Your.*shudders
-- # Demonspawn gaining a mutation they already have
-- msc += $warning:Your mutations feel more permanent
-- msc += $warning:Roots rise up from beneath.*and drag it to the ground
-- msc ^= $warning:You feel a sudden chill
-- msc += $warning:You feel hot for a moment
-- msc += $warning:stop glowing
-- msc += $warning:The water foams
-- msc += $warning:The satyr's allies are stirred to greatness
-- msc += $warning:Mushrooms sprout up around you
-- msc += $warning:seems less confused
-- msc += $warning:You could not reach far enough
-- msc ^= $warning:The golden flame engulfs you
-- msc += $warning:You shudder
-- msc += $warning:The giant firefly flashes a warning beacon
-- msc += $warning:vibrate crazily for a second
-- msc += $warning:Harold falls down\, and clutches his wounds
-- msc += $warning:You finish recalling your allies
-- msc += $warning:Your.*wears
-- msc += $warning:Something (bites|hits) your?
-- msc += $warning:You feel more confident with your borrowed prowess
-- msc += $warning:Your hands get new energy
-- msc += $warning:You squeal for attention
-- msc ^= $warning:changes into
-- msc += $warning:The crackle of the magical portal is almost imperceptible now
-- msc += $warning:blocks (the|you)
-- msc += $warning:You start to feel a little faster
-- msc += $warning:You meow for attention
-- msc += $warning:The lightning arc arcs out of your line of sight
-- msc += $warning:The lightning arc suddenly appears
-- msc += $warning:The bush is engulfed in roaring flames
-- msc += $warning:A yell rips itself from your throat
-- msc += $warning:Purgy wonders\, \"What am I doing in here\?\"
-- msc += $warning:Your spectral.*fades into mist
-- msc += $warning:You create some ball lightning
-- msc += $warning:dances into the air
-- msc += $warning:appears
-- msc += $warning:Your divine protection wanes
-- msc += $warning:The sheep \"Baaaas\" balefully
-- msc += $warning:is blown backwards by the freezing wind
-- msc += $warning:Your connection to magic feels (subdued|more subdued|nearly dormant)
-- msc += $warning:You feel a numb sensation
-- msc += $warning:Your skull pulses and throbs
-- msc += $warning:Seething terrors besiege your sanity
-- msc += $warning:your eldritch tentacle is severed
-- msc += $warning:You sink to the bottom

-- # Boring Messages
-- msc += $boring:Your tentacles glow momentarily
-- msc += $boring:tentacles wither and die
-- msc += $boring:You feel a little dazed
-- msc += $boring:You feel mildly nauseous
-- msc += $boring:looks momentarily confused
-- msc += $boring:Motes of dust swirl before your eyes
-- msc ^= $boring:You squeeze the fleshy orifice shut
-- msc += $boring:Gastronok glows a brilliant shade of cerise
-- msc += $boring:fingertips start to glow
-- msc += $boring:eyes start to glow
-- msc += $boring:You smell tea
-- msc += $boring:Your ghoul eats
-- msc += $boring:seems to dim momentarily
-- msc += $boring:The net is caught on your fulminant prism
-- msc += $boring:The shadows disperse without effect
-- msc += $boring:You feel woody for a moment
-- msc += $boring:Your vision is briefly tinged with green
-- msc ^= $boring:Sigmund is suddenly surrounded by pale red light
-- msc += $boring:has a weird expression for a moment
-- msc += $boring:You feel roots moving beneath the ground
-- msc += $boring:This spell is already in effect
-- msc ^= $boring:You displace your
-- msc ^= $boring:whispers something so quietly that you cannot hear
-- msc ^= $boring:for a moment.*blends into the shadows
-- msc ^= $boring:picks up a beetle and eats it
-- msc += $boring:Everything looks hazy for a moment
-- msc += $boring:There is a strange surge of energy around
-- msc += $boring:orc priest shimmers for a moment
-- msc += $boring:orc priest's eyes start to glow
-- msc += $boring:The weapon returns to your
-- msc += $boring:Your bandages flutter
-- msc += $boring:The water in the fountain briefly bubbles
-- msc += $boring:The bush looks momentarily different
-- msc += $boring:Dowan's feet meld with the ground\, briefly
-- msc += $boring:briefly looks nauseous
-- msc += $boring:twitches
-- msc += $boring:Jessica looks very angry
-- msc += $boring:You fall off the door
-- msc += $boring:as though insubstantial
-- msc += $boring:The Killer Klown sprays water
-- msc += $boring:The Killer Klown honks
-- msc += $boring:wriggles its tentacles
-- msc += $boring:You reach down and part the fleshy orifice
-- msc += $boring:orb spider pulsates with a strange energy
-- msc += $boring:orb spider begins to weave its threads into a brightly glowing ball
-- msc += $boring:Your eyebrows briefly feel incredibly bushy
-- msc += $boring:briefly appears rusty
-- msc += $boring:Your.*stops glowing
-- msc += $boring:Your.*briefly vibrates
-- msc += $boring:You feel gritty
-- msc += $boring:You briefly become tangled in your
-- msc += $boring:Your eyebrows wriggle
-- msc += $boring:You detect nothing
-- msc += $boring:Your.*shimmers for a moment
-- msc += $boring:Your.*eyes start to glow
-- msc += $boring:Your.*spins!
-- msc += $boring:grins madly
-- msc += $boring:You lose your grip on
-- msc += $boring:The water engulfing you falls away
-- msc += $boring:The disc glows for a moment
-- msc += $boring:Your.*briefly glows
-- msc += $boring:You feel numb
-- msc += $boring:The chaos spawn grows dozens of eye stalks in order to get a better look at you
-- msc += $boring:Jory stares carefully at you
-- msc += $boring:seems to be having trouble coordinating.*its legs
-- msc += $boring:Your.*flashes
-- msc += $boring:You create a blast of thin mist
-- msc ^= $boring:then vanish
-- msc += $boring:avoids triggering.*trap
-- msc += $boring:Terence looks scornfully at you
-- msc += $boring:Sigmund looks at you with fury
-- msc += $boring:holds.*ground
-- msc += $boring:The door collapses
-- msc += $boring:You smell baking bread
-- msc += $boring:The lightning arc grounds out
-- msc += $boring:Fannar glares icily
-- msc ^= $boring:A poisoned needle shoots out and hits your shield
-- msc += $boring:ghost twirls its
-- msc += $boring:You attack empty space
-- msc += $boring:Eustachio twirls his moustache
-- msc += $boring:is briefly tinged with black
-- msc += $boring:The dust glows
-- msc += $boring:Crazy Yiuf scratches his head thoughtfully
-- msc += $boring:Crazy Yiuf counts something out on his finger
-- msc += $boring:You aren't quite hungry enough to eat that
-- msc += $boring:The crystal guardian glitters
-- msc += $boring:The wizard's fingertips start to glow
-- msc += $boring:You are already empty-
-- msc ^= $boring:the.*shaped block of ice
-- msc ^= $boring:briefly gains? a (green|red|yellow) sheen
-- msc += $boring:The great wave of water passes through the water elemental
-- msc += $boring:shimmers and vanishes
-- msc += $boring:You do an impromptu tapdance
-- msc += $boring:You feel uncomfortable
-- msc ^= $boring:The shadow imp breathes mist at you
-- msc += $boring:That snozzcumber tasted truly putrid
-- msc += $boring:The reaper draws a finger across its throat
-- msc += $boring:Your.*seems to dim momentarily
-- msc += $boring:Your.*is briefly tinged with black
-- msc += $boring:Your.*shivers with cold
-- msc += $boring:Your.*has a weird expression for a moment
-- msc += $boring:A malignant aura surrounds your
-- msc += $boring:Your.*twitches violently
-- msc += $boring:The world appears momentarily distorted
-- msc += $boring:The iron imp grinds its teeth
-- msc += $boring:unwise to walk into this
-- msc += $boring:The tree breaks and falls down
-- msc += $boring:Nessos tries to tell you a complicated story about hydras
-- msc += $boring:You feel blessed for a moment
-- msc += $boring:The boulder beetle hits.*wall
-- msc += $boring:A root reaches out and grasps at passing movement
-- msc += $boring:Tangled roots snake along the ground
-- msc += $boring:You smell coffee
-- msc += $boring:The white imp grinds its teeth
-- msc += $boring:Your.*imp grins impishly at you
-- msc += $boring:Your hooves feel warm
-- msc += $boring:Your.*jumps up and down with excitement
-- msc += $boring:Strange appendages sprout from
-- msc += $boring:Suppurating sores blossom under
-- msc += $boring:That beef jerky was jerk
-- msc += $boring:A dozen eyes blink open in the
-- msc += $boring:You part the fleshy orifice
-- msc += $boring:There is an open fleshy orifice here
-- msc += $boring:Your hair momentarily turns into snakes
-- msc += $boring:The crimson imp grinds its teeth
-- msc ^= $boring:The crimson imp spits at you
-- msc += $boring:then rights herself and shakes her weapon
-- msc += $boring:You smell burning hair
-- msc += $boring:Your nose twitches suddenly
-- msc += $boring:You are wearing that object
-- msc += $boring:You can't wield jewellery
-- msc += $boring:There is an abandoned shop here
-- msc += $boring:You don't have any such object
-- msc += $boring:Mennas is caught in a moment of prayer
-- msc += $boring:You spin around
-- msc += $boring:Aizul coils and then uncoils
-- msc += $boring:The tide is released from Ilsuiw's call
-- msc += $boring:Polyphemus seems to be sizing you up for his next meal
-- msc += $boring:You can't read that
-- msc += $boring:You can't drink that
-- msc += $boring:Your.*falls into the water
-- msc += $boring:A large abomination twists grotesquely
-- msc += $boring:collapse into pulpy
-- msc ^= $boring:You reach to attack
-- msc += $boring:avoids the shaft
-- msc += $boring:Your bones ache
-- msc += $boring:Thank you for shopping
-- msc += $boring:Your ears itch
-- msc += $boring:Prince Ribbit hops awkwardly around
-- msc += $boring:You pass into a different region of Pandemonium
-- msc += $boring:You smell brimstone
-- msc += $boring:Something frightening happens
-- msc += $boring:Multicoloured lights dance before your eyes
-- msc += $boring:Some snowflakes condense on Fannar
-- msc += $boring:shape twists and changes as it dies
-- msc += $boring:No such ability
-- msc += $boring:The plume of ash settles
-- msc += $boring:You feel uncomfortably hot
-- msc += $boring:You can't wield that with a shield
-- msc ^= $boring:The blast of magma explodes
-- msc += $boring:Crazy Yiuf glowers
-- msc += $boring:Crazy Yiuf flaps his cloak
-- msc += $boring:Crazy Yiuf waves his quarterstaff at you
-- msc += $boring:You feel lost and a long
-- msc += $boring:The world around you seems to dim momentarily
-- msc += $boring:tears through a web
-- msc += $boring:Pikel waves his whip at you
-- msc += $boring:Wisps of condensation drift from your
-- msc += $boring:A chill runs through your body
-- msc += $boring:Frost covers your body
-- msc += $boring:numb with cold
-- msc += $boring:That.*was very bland
-- msc += $boring:That lemon was rather sour
-- msc += $boring:You call on the dead to rise
-- msc += $boring:You can't wear that
-- msc += $boring:vibrates crazily for a second
-- msc ^= $boring:The crimson imp breathes (mist|steam) at you
-- msc += $boring:showing sharp teeth
-- msc += $boring:Branches wave dangerously above you
-- msc += $boring:A root lunges up near you
-- msc += $boring:Maurice looks sneaky
-- msc += $boring:Suddenly you are surrounded with a pale green light
-- msc += $boring:really hit the spot
-- msc += $boring:Mmmm... Yummy
-- msc += $boring:Grum bares his teeth
-- msc += $boring:Grum sniffs the air and quickly glances around
-- msc += $boring:The shadow imp grinds its teeth
-- msc += $boring:looks to the heavens
-- msc += $boring:beckons to you
-- msc += $boring:Your.*struggles to escape
-- msc += $boring:Your.*struggles against
-- msc += $boring:Your.*struggles to get unstuck from
-- msc += $boring:fades away
-- msc += $boring:You feel electric
-- msc += $boring:sharp shower of sparks
-- msc += $boring:pulsates ominously
-- msc += $boring:You feel earthy
-- msc += $boring:Sparks of electricity dance between your
-- msc += $boring:Edmund gestures with his flail
-- msc += $boring:You feel very uncomfortable
-- msc += $boring:tastes (good|great|unpleasant|very good)
-- msc += $boring:is not very appetising
-- msc += $boring:was delicious
-- msc += $boring:Xtahua glares at you
-- msc += $boring:You pass through the gate
-- msc += $boring:The starspawn's tentacles wither and die
-- msc += $boring:Trunks creak and shift
-- msc += $boring:unmelds from your body
-- msc += $boring:The air around.*crackles with energy
-- msc += $boring:Something.*the (bush|plant)
-- msc += $boring:There's nothing there!
-- msc += $boring:You briefly turn translucent
-- msc += $boring:unborn seems to be listening
-- msc += $boring:You can only put on jewellery
-- msc ^= $boring:You smell decay. Yuck!
-- msc += $boring:Ouch!
-- msc += $boring:There isn't anything here
-- msc += $boring:The air around you briefly surges with heat
-- msc += $boring:Your skin glows momentarily
-- msc += $boring:You draw two cards from the deck
-- msc += $boring:You shuffle the cards back into the deck
-- msc += $boring:The drowned soul returns to the deep
-- msc += $boring:Your.*stays? behind
-- msc += $boring:You prostrate yourself
-- msc += $boring:You shiver with cold
-- msc += $boring:glows? (bright chartreuse|bright red|brightly|brilliant black|brilliant cobalt blue) for a moment
-- msc += $boring:glows? (brilliant magenta|brilliant silver|dark black|dark umber|dull charcoal|dull rubric) for a moment
-- msc += $boring:glows? (dull silver|faint lavender|faint lime green|mottled black|pale dun|pale gold|pale silver) for a moment
-- msc += $boring:glows? (pale yellow|shimmering blue|shimmering brown|shimmering rubric|shining black|shining brown|silvery red) for a moment
-- msc += $boring:Waves of light ripple over
-- msc += $boring:Your skin tingles
-- msc += $boring:looks braver
-- msc += $boring:You enjoyed that
-- msc += $boring:Your brain hurts
-- msc += $boring:becomes somewhat translucent
-- msc += $boring:generates a fountain of clear water
-- msc += $boring:You cannot attack while caught
-- msc += $boring:You cannot throw anything while caught
-- msc += $boring:grinds (her|his) teeth
-- msc += $boring:bristles in rage as it notices you
-- msc += $boring:You feel forgetful for a moment
-- msc += $boring:The briar patch crumbles away
-- msc += $boring:You feel momentarily lethargic
-- msc += $boring:...but nothing happens
-- msc += $boring:Wisps of smoke drift from your
-- msc += $boring:You smell salt
-- msc += $boring:tries to hide in the shadows
-- msc += $boring:stops crackling
-- msc ^= $boring:Your.*is no longer covered in acid
-- msc += $boring:You momentarily stiffen
-- msc += $boring:waves its rhizomes
-- msc += $boring:The flesh is too rotten for a proper zombie
-- msc += $boring:You smell (smoke|something weird)
-- msc += $boring:The floor shifts beneath you alarmingly
-- msc += $boring:The reaper smiles without lips
-- msc += $boring:great wave of water passes through
-- msc += $boring:crushes a nearby insect and laughs
-- msc += $boring:Welcome back to the Dungeon
-- msc += $boring:You are blasted with air
-- msc ^= $boring:There is a collapsed entrance here
-- msc += $boring:You feel slightly nauseous
-- msc += $boring:You can't see any susceptible monsters within range! (Use Z to cast anyway.)
-- msc += $boring:You can't go (down|up) here
-- msc += $boring:Your hair stands on end
-- msc += $boring:Wisps of vapour drift from your
-- msc += $boring:The Killer Klown smiles at you
-- msc += $boring:the (bush|fungus|plant)
-- msc += $boring:You are momentarily dazzled by a (brilliant|flash of) light
-- msc ^= $boring:(flickers out of sight|flickers and vanishes|slips into darkness) for a moment
-- msc += $boring:The golden flame engulfs your?
-- msc += $boring:The shaft crumbles and collapses
-- msc += $boring:An air elemental (forms|merges) itself (from|into) the air
-- msc += $boring:A corpse collapses into a pulpy mess
-- msc += $boring:You start (resting|waiting)
-- msc += $boring:Unknown command
-- msc += $boring:but (do no|doesn't do any|does no) damage
-- msc += $boring:miss
-- msc += $boring:Wisps of poison gas drift from your
-- msc += $boring:You walk carefully through
-- msc += $boring:grow from
-- msc += $boring:withers and dies
-- msc += $boring:There is nothing on the other side of the stone arch
-- msc += $boring:misses you
-- msc += $boring:You are waved at by a branch
-- msc += $boring:The trees move their gnarly branches around
-- msc += $boring:You swap
-- msc += $boring:The smell of rotting flesh
-- msc += $boring:Ugh! There is something really disgusting
-- msc += $boring:Heat runs through your body
-- msc += $boring:Lukewarm flames ripple over your body
-- msc += $boring:stops (dripping with poison|flaming)
-- msc += $boring:Press } to see all runes
-- msc += $boring:There is a.*(door|gate)
-- msc += $boring:(antennae|eye-stalks|whiskers)
-- msc += $boring:You feel troubled
-- msc += $boring:You feel a wave of unholy energy pass over you
-- msc += $boring:grins evilly
-- msc += $boring:A huge blade swings just past you
-- msc += $boring:(The|Something).*disappears
-- msc += $boring:The.*glitters chillingly
-- msc += $boring:You feel a strange surge of energy
-- msc += $boring:There are no unholy or evil weapons here to destroy
-- msc += $boring:close doors on yourself
-- msc += $boring:Your.*falls off the wall
-- msc += $boring:stops rolling
-- msc += $boring:(gazes forward|pauses|quivers|skips|sputters|stops to sniff|summons a swarm of flies)
-- msc += $boring:turns its.*gaze
-- msc += $boring:Your summoned ally is left behind
-- msc += $boring:That felt strangely unrewarding
-- msc += $boring:The air around you crackles with energy
-- msc += $boring:in your inventory have.*rotted away
-- msc += $boring:(drops|unwields)
-- msc += $boring:The battlesphere dissipates
-- msc += $boring:(The|Your?).*(passes|pick your way) through a web
-- msc += $boring:passes through a web
-- msc += $boring:You feel extremely cold
-- msc += $boring:You feel terrible
-- msc += $boring:You sense a malignant aura
-- msc += $boring:You (hold|stand) your ground
-- msc += $boring:Your.*(holds|stands) its ground
-- msc += $boring:The.*eats the
-- msc += $boring:The winds cease moving at the.*will
-- msc += $boring:The ground creaks as gnarled roots bulge its surface
-- msc += $boring:rages
-- msc += $boring:Your acid blob dissolves into a puddle of slime
-- msc += $boring:You feel a wrenching sensation
-- msc += $boring:The.*falls off the wall
-- msc += $boring:The.*jiggles
-- msc += $boring:The.*looks excited
-- msc += $boring:Pikel cracks his whip
-- msc += $boring:Press } to see all the runes you have collected
-- msc += $boring:slime creature splits
-- msc += $boring:stops glowing
-- msc += $boring:splashes around in the water
-- msc += $boring:tentacles slide back into the water
-- msc += $boring:The.*dissolves into shadows
-- msc += $boring:You smell something rotten
-- msc += $boring:You (close|open) the.*(door|gate)
-- msc += $boring:reach down and (close|open) the.*(door|gate)
-- msc += $boring:You (climb|fly) (down|up)wards
-- msc += $boring:You go (down|up)
-- msc += $boring:You fly (down|up) through the gate
-- msc += $boring:You must enter the number of times for the command to repeat
-- msc += $boring:Use Z to cast anyway
-- msc += $boring:There are no items here
-- msc += $boring:it crumbles to dust
-- msc += $boring:The hatch slams shut behind you
-- msc += $boring:There is an empty arch of ancient stone here
-- msc += $boring:The world spins around you as you enter the gateway
-- msc += $boring:This spell is.*dangerous to cast
-- msc += $boring:There is a web.*here
-- msc += $boring:You pick your way through the web
-- msc += $boring:You hold your ground
-- msc += $boring:The floor vibrates
-- msc += $boring:Sand pours from your
-- msc += $boring:Strange energies run through your body
-- msc += $boring:You smell something strange
-- msc += $boring:ghost tries to sneak away
-- msc += $boring:evades a web
-- msc += $boring:The.*goes (down|up) the
-- msc += $boring:jumps into the shaft
-- msc += $boring:Found.*gold
-- msc += $boring:You now have.*gold
-- msc += $boring:Why would you want to do that
-- msc += $boring:you're not good enough to have a special ability
-- msc += $boring:holds its.*at the ready
-- msc += $boring:There is a.*fountain.*here
-- msc += $boring:Little bolts of electricity crackle over the disc
-- msc += $boring:tries to grin evilly
-- msc += $boring:The corpses? collapses? into a pulpy mess
-- msc += $boring:There is an empty arch of ancient stone
-- msc += $boring:The runic seals? fades? away
-- msc += $boring:looks hungrier
-- msc += $boring:Something drops
-- msc += $boring:tears the web
-- msc += $boring:lashes its tail
-- msc += $boring:smirks and points a slender finger
-- msc += $boring:The orb of destruction dissipates
-- msc += $boring:spectral weapon stumbles backwards
-- msc += $boring:Your (claws|elbows|hands|wings) glow momentarily
-- msc += $boring:Weird images run through your mind
-- msc += $boring:safely over a trap
-- msc += $boring:avoid triggering a
-- msc += $boring:A net swings high above you
-- msc += $boring:Natasha extends her claws
-- msc += $boring:The shadow imp breathes steam at you
-- msc += $boring:You can't see any susceptible monsters within range
-- msc += $boring:You are momentarily dazzled by a brilliant light
-- msc += $boring:You feel momentarily weightless
-- msc += $boring:You feel uncomfortably cold
-- msc += $boring:Your fire elemental sizzles in the rain
-- msc += $boring:Nessos pounds the earth with his hooves
-- msc += $boring:Frost spreads across the the floor
-- msc += $boring:You sense an ancient evil watching you
-- msc += $boring:Your.*(looks|smiles) at you
-- msc += $boring:You experience a momentary feeling of inescapable doom
-- msc += $boring:Something in your inventory has become rotten
-- msc += $boring:There is something rotten in your inventory
-- msc += $boring:assumes a wrestling stance
-- msc += $boring:feints to the
-- msc += $boring:Purgy looks around nervously
-- msc += $boring:You smell pepper
-- msc += $boring:You feel faint for a moment
-- msc += $boring:You suddenly feel all small and vulnerable
-- msc += $boring:takes off
-- msc += $boring:There is a rock-blocked tunnel here
-- msc += $boring:falls off the
-- msc += $boring:The bat flutters around in erratic circles
-- msc += $boring:You swing at nothing
-- msc += $boring:This raw flesh tastes delicious
-- msc += $boring:electric golem crackles and sizzles
-- msc += $boring:ghost ripples
-- msc += $boring:Maud (frowns|looks upset)
-- msc += $boring:There is an ice choked empty arch of ancient stone here
-- msc += $boring:Sparks fly from your
-- msc += $boring:crimson imp breathes smoke at you
-- msc += $boring:Distant voices call out to you
-- msc += $boring:You are showered with tiny particles of grit
-- msc += $boring:The scroll reassembles itself in your
-- msc += $boring:You feel uncomfortably hot
-- msc += $boring:Nergalle blows her nose
-- msc += $boring:You release your grip on
-- msc += $boring:Nergalle looks more energetic
-- msc += $boring:stampedes away
-- msc += $boring:fails to trigger a.*trap
-- msc += $boring:You can't eat that
-- msc += $boring:You smell sulphur
-- msc += $boring:There's nothing to (close|open) nearby
-- msc += $boring:Your.*stumbles backwards
-- msc += $boring:ghost takes a fighting stance
-- msc += $boring:You shiver with fear
-- msc += $boring:Your.*falls like a stone
-- msc += $boring:You feel a surge of energy from the ground
-- msc += $boring:You release your grip on
-- msc += $boring:Your head hurts
-- msc += $boring:The lightning grounds out
-- msc += $boring:Your.*feel warm
-- msc += $boring:This isn't a weapon
-- msc += $boring:You feel as though nothing has changed
-- msc += $boring:Blork the orc's eyes start to glow
-- msc += $boring:Blork the orc shakes
-- msc += $boring:You smell wet wool
-- msc += $boring:You create a blast of rain
-- msc += $boring:There is a rose-covered archway here
-- msc += $boring:becomes larger for a moment
-- msc += $boring:falls out of your pack
-- msc += $boring:leaps into the air
-- msc += $boring:body glows momentarily
-- msc += $boring:shimmers violently
-- msc += $boring:makes a popping sound
-- msc ^= $boring:eyestalks stretch out
-- msc += $boring:You feel off-balance for a moment
-- msc ^= $boring:consumed by the void

-- # Enemies taking damage
-- msc += $good:You (batter|beat|bite|bludgeon|burn|carve|chomp|chop|claw|constrict|crush|cut|devastate|dice|drain|electrocute|eviscerate)
-- msc += $good:You (flatten|fracture|freeze|grab|gouge|hammer|headbutt|hit|impale|kick|mangle|maul|nip|open|peck|perforate|pierce|pound)
-- msc += $good:You (pulverise|pummel|punch|puncture|punish|scratch|sears|shatter|shave|shred|skewer|slash|slice|smack|sock)
-- msc += $good:You (spit|splatter|squash|squeeze|stick|strike|tail-slap|tentacle-slap|thrash|thump|touch|trample|whack)
-- msc += $good:(attacks|bites|burns|carves|chops|claws|constricts|crushes|cuts|drains|draws|electrocutes|engulfs) [^y]
-- msc += $good:(eviscerates|freezes|gores|grabs|headbutts|hits|hits|kicks|mauls|melts|opens|pecks|perforates) [^y]
-- msc += $good:(poisons|pulverises|pummels|punches|punctures|sears|shocks|shreds|skewers|slashes|slices|smacks) [^y]
-- msc += $good:(spits|squashes|sticks|stings|strikes|tail-slaps|tentacle-slaps|touches|tramples|trunk-slaps) [^y]
-- msc += $good:(twists|pulls at|violently warps) [^y]
-- msc += $good:You smite
-- msc ^= $good:Your fire elemental burns
-- msc += $good:is flooded with distortional energies
-- msc += $good:is electrocuted
-- msc += $good:You draw life from
-- msc += $good:is struck by the twisting air
-- msc += $good:burns!
-- msc += $good:Asterion shares his spectral weapon's damage
-- msc += $good:is struck by lightning
-- msc += $good:A guardian golem appears
-- msc += $good:is covered in liquid flames
-- msc += $good:is engulfed in
-- msc += $good:Your.*tramples the
-- msc += $good:The orb of electricity engulfs the
-- msc += $good:The (.*hellfire|blast of flame|blast of lightning|blast of magma|explosion) engulfs [^y]
-- msc += $good:The (explosion of.*fragments|explosion of spores|fiery explosion|fireball|ghostly fireball) engulfs [^y]
-- msc += $good:The (great blast of fire|plume of ash|stinking cloud) engulfs [^y]
-- msc += $good:is smitten
-- msc += $good:struck by your spines
-- msc += $good:There is a sudden explosion of sparks
-- msc += $good:is drained
-- msc += $good:You drain (her|his|its) (magic|power)
-- msc += $good:You drain the
-- msc += $good:Something (bites|hits)
-- msc += $good:is blasted
-- msc += $good:is burned by your radiant heat
-- msc += $good:The boulder beetle smashes into the
-- msc += $good:The golden flame engulfs
-- msc += $good:The eldritch tentacle writhes
-- msc ^= $good:The.*pierces through the
-- msc += $good:Space (bends|warps horribly) around
-- msc += $good:(convulses|writhes in agony)
-- msc += $good:is splashed with acid
-- msc += $good:You feel life coursing into your body
-- msc += $good:is struck by lightning
-- msc += $good:is burned by acid
-- msc += $good:seems to burn from within
-- msc += $good:Space warps around
-- msc ^= $good:statue shatters
-- msc += $good:Your eldritch tentacle slaps
-- msc += $good:collides with
-- msc += $good:slams into the

-- # Non-damage combat messages
-- msc += $positive:the.*corpse armour sloughs away
-- msc += $positive:You grow two more
-- msc += $positive:You draw.*blood
-- msc += $positive:You feel.*less thirsty
-- msc += $positive:You feel a lot less hungry
-- msc += $positive:You.*devour
-- msc += $positive:You pounce on
-- msc += $positive:but is stunned by your will
-- msc += $positive:Your rust devil corrodes
-- msc += $positive:by your wave of power
-- msc += $positive:is stunned by your will and fails to attack
-- msc += $positive:The sticky flame splashes onto
-- msc ^= $positive:Your orcs go into a battle-frenzy
-- msc += $positive:falters in the face of your power
-- msc += $positive:in retribution by your aura
-- msc += $positive:Your slowness suddenly goes away
-- msc ^= $positive:Your.*seems less confused
-- msc += $positive:is no longer regenerating
-- msc += $positive:You repair your equipment
-- msc += $positive:You extend your infusion
-- msc += $positive:You draw the Helm
-- msc += $positive:You draw Dowsing
-- msc += $positive:You shrug off the repeated paralysis
-- msc ^= $positive:You begin infusing your attacks with magical energy
-- msc += $positive:It gets dark
-- msc += $positive:is outlined in light
-- msc += $positive:A mana viper appears with a sibilant hiss
-- msc += $positive:moth of wrath (goads|infuriates) your
-- msc += $positive:Some water evaporates in the bright sunlight
-- msc += $positive:You become one with your weapon
-- msc += $positive:Your bond becomes stronger
-- msc += $positive:A magical shield forms in front of you
-- msc += $positive:Your attacks no longer feel as feeble
-- msc += $positive:You feel odd
-- msc += $positive:The shadowy forms in the deep grow still as others approach
-- msc += $positive:You renew your portal
-- msc += $positive:You begin teleporting projectiles to their destination
-- msc += $positive:is no longer invulnerable
-- msc += $positive:blocks its attack
-- msc += $positive:sizzles in the rain
-- msc += $positive:gets badly buffeted
-- msc += $positive:Your legs become a tail as you enter the water
-- msc += $positive:You feel a sudden desire to slay dragons
-- msc += $positive:You feel weakened for a moment
-- msc += $positive:Your stone body feels more resilient
-- msc += $positive:You feel less vulnerable to hostile enchantments
-- msc += $positive:You swoop lightly up into the air
-- msc += $positive:You feel very comfortable in the air
-- msc += $positive:The air around you leaps into flame
-- msc += $positive:is knocked back by the great wave of water
-- msc += $positive:Your.*wounds heal themselves
-- msc += $positive:is recalled
-- msc += $positive:You renew your shroud
-- msc += $positive:One of your tentacles grows a vicious spike
-- msc += $positive:A mana viper appears with a sibilant hiss
-- msc += $positive:melts!
-- msc += $positive:You extend your mandibles
-- msc ^= $positive:Your?.*appears? unharmed
-- msc += $positive:You finish merging with the rock
-- msc += $positive:You gain the combat prowess of a mighty hero
-- msc += $positive:shroud falls apart
-- msc += $positive:Your.*glows blue
-- msc += $positive:your mind becomes perfectly clear
-- msc += $positive:You create a blast of noxious fumes!
-- msc += $positive:Roots rise up to grasp you
-- msc += $positive:is no longer moving.*quickly
-- msc += $positive:You create a snake
-- msc += $positive:apparition takes form in the air
-- msc += $positive:The rubble rises up and takes form
-- msc += $positive:You begin to abjure the creatures around you
-- msc += $positive:You extend your aura of abjuration
-- msc += $positive:A divine shield forms around you
-- msc += $positive:Your attacks no longer feel as feeble
-- msc += $positive:Your shroud bends.*attack away
-- msc += $positive:illusion disappears in a puff of smoke
-- msc += $positive:A beastly little devil appears in a puff
-- msc += $positive:Your.*is no longer encased in ice
-- msc += $positive:You deflect
-- msc += $positive:The lightning arcs
-- msc += $positive:is knocked back by the lance of force
-- msc += $positive:is dazzled
-- msc += $positive:is doused terribly
-- msc += $positive:An electric hum fills the air
-- msc += $positive:You summon a servant imbued with your destructive magic
-- msc += $positive:You are suffused with power
-- msc += $positive:The sheep.*panic
-- msc += $positive:The sheep turns to a blind rush
-- msc += $positive:Smoke pours from your nose
-- msc += $positive:The trap is out of ammunition
-- msc += $positive:You dart out from under the net
-- msc += $positive:The manticore spikes snap loose
-- msc += $positive:Your jumping spider.*pounces on the
-- msc += $positive:You are unaffected
-- msc += $positive:no longer looks unusually strong
-- msc += $positive:The area is filled with flickering shadows
-- msc += $positive:You block
-- msc += $positive:flinches away
-- msc += $positive:The.*is (deflected|repelled)
-- msc += $positive:Your.*is no longer paralysed.
-- msc += $positive:Your.*seems less confused
-- msc += $positive:You feel less contaminated with magical energies
-- msc += $positive:Your.*breaks free
-- msc += $positive:You feel momentarily confused
-- msc += $positive:That potion was really gluggy
-- msc += $positive:You resist
-- msc += $positive:You (easily|partially) resist
-- msc += $positive:Your skin crawls
-- msc += $positive:You draw out your weapon's spirit
-- msc += $positive:You catch the
-- msc += $positive:fails to defend (herself|himself|itself)
-- msc += $positive:falters for a moment
-- msc += $positive:You feel invigorated
-- msc += $positive:flops around on dry land
-- msc += $positive:You escape
-- msc += $positive:glows a violent red
-- msc += $positive:You emit a cloud
-- msc += $positive:icy envelope dissipates
-- msc += $positive:appears confused
-- msc += $positive:looks drowsy
-- msc += $positive:is caught in a (net|web)
-- msc += $positive:struggles to get unstuck from the (net|web)
-- msc += $positive:loses its grip on you
-- msc += $positive:looks rather.*confused
-- msc ^= $positive:The sentinel's mark upon you fades away
-- msc += $positive:The lost soul (fades away|flickers out)
-- msc += $positive:You turn into a creature of crystalline ice
-- msc ^= $positive:The.*dark mirror aura disappears
-- msc += $positive:is no longer berserk
-- msc += $positive:You wake up
-- msc += $positive:The grasping roots settle back into the ground
-- msc += $positive:The forest abruptly stops moving
-- msc += $positive:You feel more buoyant
-- msc += $positive:You fly up into the air
-- msc += $positive:You gasp with relief as air once again reaches your lungs
-- msc += $positive:A film of ice covers your body
-- msc += $positive:Your.*has recharged
-- msc += $positive:you pull free of the water engulfing you
-- msc += $positive:You feel a surge of unholy energy
-- msc += $positive:your?.*stops? burning
-- msc += $positive:begins to rapidly decay
-- msc += $positive:Your possessions no longer seem quite so burdensome
-- msc += $positive:You feel in control
-- msc += $positive:You feel odd for a moment
-- msc += $positive:suddenly stops moving
-- msc += $positive:is poisoned
-- msc += $positive:looks even sicker
-- msc += $positive:A film of ice covers your body
-- msc += $positive:is stunned!
-- msc += $positive:is flash-frozen
-- msc += $positive:seems to slow down
-- msc += $positive:is moving more slowly
-- msc += $positive:stops moving altogether
-- msc += $positive:Your skin hardens
-- msc += $positive:Your new body merges with your stone armour
-- msc += $positive:gives you a mild electric shock
-- msc += $positive:Eating
-- msc += $positive:the sound returns
-- msc += $positive:Your amulet of stasis gives you a mild electric shock
-- msc += $positive:You finish eating
-- msc += $positive:Your icy armour thickens
-- msc += $positive:The naga ritualist's toxic aura wanes
-- msc += $positive:Your.*pulls away from the web
-- msc += $positive:A chill wind blows around you
-- msc += $positive:You become transparent for a moment
-- msc += $positive:is charmed
-- msc += $positive:Your skin feels harder
-- msc += $positive:Shadowy shapes form in the air around you
-- msc += $positive:is burned terribly
-- msc += $positive:[^y].*is frozen
-- msc += $positive:You furiously retaliate
-- msc += $positive:The scroll dissolves into smoke
-- msc ^= $positive:Your.*reflects
-- msc ^= $positive:You reflect
-- msc += $positive:is no longer unusually agile
-- msc += $positive:struggles to blink free from constriction
-- msc += $positive:You pull the items towards yourself
-- msc += $positive:the former slaves? thanks? you
-- msc += $positive:Something gets caught in the net
-- msc += $positive:[^y].*rots
-- msc += $positive:the hog turns into a human
-- msc += $positive:the hogs revert to their human forms
-- msc += $positive:Your new body merges with your icy armour
-- msc += $positive:You feel the strange sensation of being on two planes at once
-- msc += $positive:A flood of magical energy pours into your mind
-- msc += $positive:You feel the material plane grow further away
-- msc += $positive:You momentarily phase out as.*passes through you
-- msc += $positive:You feel less exhausted
-- msc ^= $positive:Your.*(resist[^a]|resists|unaffected)
-- msc += $positive:The flame cauterises the wound
-- msc += $positive:the.*last head off
-- msc += $positive:You carefully extract the manticore spikes from your body
-- msc += $positive:You melt the
-- msc += $positive:has finally been put to rest
-- msc += $positive:begins to bleed from.*wounds
-- msc += $positive:Your.*draws strength from
-- msc += $positive:You feel yourself moving faster
-- msc += $positive:looks sick
-- msc += $positive:Your feet morph into talons
-- msc += $positive:You grow a pair of large bovine horns
-- msc += $positive:You extend your transformation
-- msc += $positive:Your.*turns? into razor-sharp scythe blades?
-- msc += $positive:You conjure a globe of magical energy
-- msc += $positive:You imbue your battlesphere with additional charge
-- msc += $positive:You feel resistant
-- msc += $positive:You are no longer poisoned
-- msc += $positive:looks frightened
-- msc += $positive:The.*is outlined in light
-- msc += $positive:You feel quick
-- msc += $positive:You no longer feel sluggish
-- msc += $positive:You feel odd for a moment
-- msc += $positive:returns to your pack
-- msc += $positive:Space distorts slightly along a thin shroud covering your body
-- msc += $positive:You are covered in a thin layer of ice
-- msc += $positive:You feel (clumsy|dopey|weak) for a moment
-- msc += $positive:stops singing
-- msc += $positive:and things crawl out
-- msc += $positive:You feel more catlike
-- msc += $positive:A crackling disc of dense vapour forms in the air
-- msc += $positive:icy armour evaporates
-- msc += $positive:Your.*looks invigorated
-- msc += $positive:repels the curse
-- msc += $positive:Yoink! You pull the item towards yourself
-- msc += $positive:but delicious nonetheless
-- msc += $positive:The disc of vapour around you crackles
-- msc += $positive:turns into a zombie
-- msc += $positive:You summon
-- msc += $positive:hydra's last head off
-- msc += $positive:You feel a.*surge of power
-- msc += $positive:magic leaks into the air
-- msc += $positive:You focus on the pain
-- msc += $positive:Your.*darts out from under the net
-- msc += $positive:struggles to escape constriction
-- msc += $positive:submits to your will
-- msc += $positive:You channel some magical energy
-- msc += $positive:is caught in the net
-- msc += $positive:struggles (against|to escape) the net
-- msc += $positive:Your fit of retching subsides
-- msc += $positive:Your magic seems less tainted
-- msc += $positive:You shudder from the blast and a jelly pops out
-- msc += $positive:looks weaker
-- msc += $positive:falls into the water
-- msc += $positive:You fade into the shadows
-- msc += $positive:life force is offered up
-- msc += $positive:is calmed by your holy aura
-- msc ^= $positive:You fade into invisibility
-- msc ^= $positive:grand avatar fades into the ether
-- msc ^= $positive:Your attacks are magically infused
-- msc ^= $positive:You feel protected from missiles
-- msc ^= $positive:You feel a little less hungry
-- msc ^= $positive:Your.*is no longer moving slowly
-- msc ^= $positive:You are no longer (entranced|glowing)
-- msc ^= $positive:You feel as if something is helping you
-- msc += $positive:appears in a shower of sparks
-- msc += $positive:Malign forces permeate your being
-- msc += $positive:A glowing mist starts to gather
-- msc ^= $positive:begin to glow red
-- msc ^= $positive:begin to glow brighter

-- #msc += $verypositive:
-- msc += $verypositive:You are bolstered by the flame
-- msc ^= $verypositive:The.*zombie.*rots away
-- msc += $verypositive:You feel buoyant
-- msc ^= $verypositive:You feel very safe from missiles
-- msc ^= $verypositive:You are no longer firmly anchored in space
-- msc += $verypositive:Magical energy flows into your mind!
-- msc ^= $verypositive:The terrible wounds on your body vanish
-- --amulet of stasis
-- msc += $verypositive:Your.*rumbles
-- msc += $verypositive:You feel life flooding into your body
-- msc += $verypositive:You feel purified
-- msc += $verypositive:You feel more resilient
-- msc += $verypositive:You get a glimpse of the first card
-- msc += $verypositive:You turn into a swirling mass of dark shadows
-- msc += $verypositive:You feel nimbler
-- msc += $verypositive:the tentacle is hauled back through the portal
-- msc += $verypositive:You feel more in control of your magic
-- msc += $verypositive:releases its grip on you
-- msc += $verypositive:You feel magically charged
-- msc += $verypositive:You turn to flesh and can move again
-- msc += $verypositive:Your magma supply has returned
-- msc += mute:HP restored
-- msc += mute:Magic restored
-- msc += $verypositive:You (blow up|destroy|kill)
-- msc += $verypositive:is blown up
-- msc += $verypositive:dies
-- msc += $verypositive:is destroyed
-- msc += $verypositive:is killed
-- msc += $verypositive:is incinerated
-- msc += $verypositive:is devoured by a tear in reality
-- msc += $verypositive:turns neutral
-- msc += $verypositive:The spatial vortex dissipates
-- msc += $verypositive:Your magical contamination has.*faded
-- msc += $verypositive:drowns
-- msc += $verypositive:The.*falls from the air
-- msc += $verypositive:The.*simulacrum vapourises
-- msc += $verypositive:more experienced
-- msc ^= $verypositive:rots away and dies
-- msc ^= $verypositive:You.*and break free
-- msc += $verypositive:The web tears apart
-- msc += $verypositive:You disentangle yourself
-- msc += $verypositive:Saving game... please wait
-- msc += $verypositive:You finish memorising
-- msc += $verypositive:You may choose your destination
-- msc += $verypositive:You feel yourself speed up
-- msc += $verypositive:You feel stealthy
-- msc += $verypositive:You feel less vulnerable to poison
-- msc += $verypositive:Your skill with magical items lets you calculate the power of this device
-- msc += $verypositive:You can move again
-- msc += $verypositive:The fungal colony is destroyed
-- msc ^= $verypositive:The starcursed mass shudders and is absorbed by its neighbour
-- msc ^= $verypositive:The starcursed mass shudders and withdraws
-- msc += $verypositive:You are no longer firmly anchored in space
-- msc += $verypositive:Magic courses through your body
-- msc += $verypositive:You have disarmed the trap
-- msc += $verypositive:You are healed
-- msc += $verypositive:Pain shudders through your arm
-- msc += $verypositive:You slip out of the net
-- msc += $verypositive:You break free from the net
-- msc += $verypositive:Your life force is being protected
-- msc += $verypositive:It is a scroll of recharging
-- msc += $verypositive:is converted
-- msc += $verypositive:It is a scroll of enchant
-- msc += $verypositive:That put a bit of spring back into your step
-- msc += $verypositive:You feel vaguely more buoyant than before
-- msc += $verypositive:You feel (better|faster|mighty|much better|protected|refreshed)
-- msc += $verypositive:You feel.* mighty all of a sudden
-- msc += $verypositive:You feel.*agile all of a sudden
-- msc += $verypositive:You feel aware of your surroundings
-- msc += $verypositive:You detect (creatures|items)
-- msc += $verypositive:You feel the corruption within you wane
-- msc += $verypositive:You feel perceptive
-- msc ^= $verypositive:You feel less confused
-- msc += $verypositive:You feel a little better
-- msc += $verypositive:You feel studious about
-- msc += $verypositive:You feel telepathic
-- msc += $verypositive:You feel your magic capacity increase
-- msc += $verypositive:You feel the abyssal rune guiding you out of this place
-- msc += $verypositive:You feel fantastic
-- msc += $verypositive:Found.*altar
-- msc += $verypositive:Found a one-way gate to the infinite horrors of the Abyss
-- msc += $verypositive:Found a glowing drain
-- msc += $verypositive:Found a gate leading back out of here
-- msc += $verypositive:Found a hole to the Spider Nest
-- msc += $verypositive:Found a frozen archway
-- msc += $verypositive:Found an ice covered gate leading
-- msc += $verypositive:Found a dark tunnel
-- msc += $verypositive:Found a labyrinth entrance
-- msc += $verypositive:Found a flagged portal
-- msc += $verypositive:Found an exit through the horrors of the Abyss
-- msc += $verypositive:Found a gateway leading out of the Abyss
-- msc += $verypositive:Found a gateway leading deeper into the Abyss
-- msc += $verypositive:Found a gate leading out of Pandemonium
-- msc += $verypositive:Found a gate leading to another region
-- msc += $verypositive:Found a gate to the Vaults
-- msc += $verypositive:Found a gateway
-- msc += $verypositive:Found a rocky tunnel leading out of this place
-- msc += $verypositive:Found a portal to a secret trove of treasure
-- msc += $verypositive:Found a magical portal
-- msc += $verypositive:Found a flickering gateway to a bazaar
-- msc += $verypositive:Found a one-way gate leading to the halls of Pandemonium
-- msc += $verypositive:Found a portal leading out of here
-- msc += $verypositive:Found.*staircase
-- msc += $verypositive:Found.*(Accessories|Antiques|Boutique|Distillery|Elixirs|Emporium|shop|Smithy|store)
-- msc += $verypositive:You feel your magical essence form a protective shroud around your flesh
-- msc += $verypositive:You feel your.*returning
-- msc += $verypositive:It is a scroll of brand weapon
-- msc ^= $verypositive:Your.*seems to speed up
-- msc += $verypositive:An interdimensional caravan has stopped on this level and set up a bazaar
-- msc += $verypositive:Your demonic ancestry asserts itself
-- msc += $verypositive:You feel (agile|clever|stronger)
-- msc += $verypositive:You feel more protected from negative energy


-- #Gaining positive mutations, or losing bad ones
-- msc += $awesome:You feel more jittery
-- msc += $awesome:You.*contain your magic power
-- msc += $awesome:Acid begins to drip from your mouth
-- msc += $awesome:You feel more resistant to cold
-- msc += $awesome:You feel less vulnerable to cold
-- msc += $awesome:Your fur grows into a thick mane
-- msc += $awesome:Your magic regains its normal vibrancy
-- msc += $awesome:Your thick fur grows shaggy and warm
-- msc += $awesome:You feel more sure on your
-- msc += $awesome:You feel breathless
-- msc += $awesome:Your genes go into a fast flux
-- msc += $awesome:You feel more resistant to heat
-- msc += $awesome:A poisonous barb forms on the end of your tail
-- msc += $awesome:Your wings grow larger and stronger
-- msc += $awesome:You feel more spiritual
-- msc ^= $awesome:You feel immune to rotting
-- msc += $awesome:Your system.*accepts artificial healing
-- msc += $awesome:You feel more resistant to hostile enchantments
-- msc += $awesome:You feel completely energised by your suffering
-- msc += $awesome:An ominous black mark forms on your body
-- msc += $awesome:You feel a strange anaesthesia
-- msc ^= $awesome:You feel resistant to heat
-- msc += $awesome:You feel saturated with power
-- msc += $awesome:You feel power rushing into your body
-- msc += $awesome:Your blood runs red-hot
-- msc += $awesome:Your feet have mutated into hooves
-- msc ^= $awesome:You feel resistant to hostile enchantments
-- msc += $awesome:You feel genetically immutable
-- msc += $awesome:You feel power flowing into your body
-- msc ^= $awesome:You feel more in touch with the powers of death
-- msc ^= $awesome:You feel resistant to poisons?
-- msc ^= $awesome:You feel resistant to (cold|fire)
-- msc ^= $awesome:You feel very resistant to (cold|fire)
-- msc += $awesome:You no longer feel vulnerable to (cold|fire)
-- msc += $awesome:Your urge to (scream|yell) lessens
-- msc += $awesome:One of your lower tentacles grows a sharp spike
-- msc += $awesome:You regain control of your magic
-- msc += $awesome:The horns on your head grow some more
-- msc += $awesome:You feel less concerned about heat
-- msc += $awesome:You smell fire and brimstone
-- msc += $awesome:You begin to radiate miasma
-- msc += $awesome:You feel able to eat a more balanced diet
-- msc += $awesome:You feel genetically stable
-- msc ^= $awesome:You feel a.*healthier
-- msc += $awesome:You feel your life force and your magical essence meld
-- msc ^= $awesome:You feel your magical essence form a protective shroud around your flesh
-- msc += $awesome:You feel your magic shroud grow more resilient
-- msc += $awesome:Your body becomes stretchy
-- msc += $awesome:Your skin becomes partially translucent
-- msc += $awesome:You feel less concerned about cold
-- msc += $awesome:You feel cleansed
-- msc += $awesome:You are surrounded by darkness
-- msc += $awesome:Your skin functions as natural camouflage
-- msc += $awesome:You begin to emit a foul stench of rot and decay
-- msc ^= $awesome:You feel energised by your suffering
-- msc ^= $awesome:You feel even more energised by your suffering
-- msc += $awesome:Your teeth lengthen and sharpen
-- msc += $awesome:Your natural healing is strengthened
-- msc += $awesome:Eyeballs grow over part of your body
-- msc += $awesome:pseudopods.*grow
-- msc += $awesome:Your body.*splits into a small jelly
-- msc += $awesome:You begin to regenerate
-- msc += $awesome:You begin to radiate repulsive energy
-- msc += $awesome:Your repulsive radiation grows stronger
-- msc += $awesome:Your body's shape seems more normal
-- msc += $awesome:You feel the presence of a demonic guardian
-- msc += $awesome:Your guardian grows in power
-- msc += $awesome:Your scales feel tougher
-- msc += $awesome:Your teeth are very long and razor-sharp
-- msc += $awesome:You feel negative
-- msc += $awesome:You begin to heal more quickly
-- msc += $awesome:You feel healthy
-- msc += $awesome:You feel a little more calm
-- msc += $awesome:You feel nature experimenting on you
-- msc += $awesome:You feel a strange attunement to the structure of the dungeons
-- msc += $awesome:Your mouth lengthens and hardens into a beak
-- msc += $awesome:Fur sprouts all over your body
-- msc += $awesome:Your attunement to dungeon structure grows
-- msc += $awesome:You slip into the darkness of the dungeon
-- msc += $awesome:You slip further into the darkness
-- msc += $awesome:Your thoughts seem clearer
-- msc += $awesome:A wave of death washes over you
-- msc += $awesome:The wave of death grows in power
-- msc += $awesome:Sharp spines emerge from
-- msc += $awesome:Your vision sharpens
-- msc ^= $awesome:Your urge to shout disappears
-- msc ^= $awesome:scales grow over part of your
-- msc ^= $awesome:scales spread over more of your
-- msc += $awesome:scales cover you.*completely
-- msc += $awesome:You are partially covered in thin metallic scales
-- msc ^= $awesome:Something appears at your feet
-- msc ^= $awesome:Something appears before you
-- msc += $awesome:Your metabolism slows
-- msc += $awesome:Your bones become.*less dense
-- msc += $awesome:You feel (more robust|robust|very robust)
-- msc += $awesome:You feel more energetic
-- msc += $awesome:You feel healthier
-- msc += $awesome:You feel insulated
-- msc += $awesome:Your (fingernails|toenails) (lengthen|sharpen)
-- msc += $awesome:Your hands twist into claws
-- msc += $awesome:Your feet stretch into talons
-- msc += $awesome:Your feet thicken and deform
-- msc ^= $awesome:A pair of antennae grows on your head
-- msc ^= $awesome:The antennae on your head grow some more
-- msc ^= $awesome:There is a nasty taste in your mouth for a moment
-- msc ^= $awesome:You feel stable
-- msc += $awesome:Large bone plates (cover|grow|spread)
-- msc += $awesome:Your throat feels hot
-- msc += $awesome:Your teeth grow very long and razor-sharp
-- msc ^= $awesome:You feel less vulnerable to heat
-- msc ^= $awesome:You no longer feel vulnerable to heat
-- msc ^= $awesome:You feel a little less angry
-- msc += $awesome:Your natural camouflage becomes more effective

-- # Other rare and awesome stuff
-- msc ^= $awesome:seems mollified
-- msc += $awesome:Your surroundings flicker for a moment
-- msc += $awesome:You feel magically purged
-- msc += $awesome:word of recall is interrupted
-- msc ^= $awesome:Sif Muna is protecting you from the effects of miscast magic
-- msc ^= $awesome:You are shrouded in an aura of darkness
-- msc ^= $awesome:Kikubaaqudgha is protecting you from necromantic miscasts and death curses
-- msc += $awesome:You are surrounded by a storm
-- msc += $awesome:You sense an aura of extreme power
-- msc += $awesome:Your.*shines brightly
-- msc ^= $awesome:The Shining One will now bless your weapon at an altar
-- msc += $awesome:the more Ashenzari supports your skills
-- msc += $awesome:Ashenzari helps you to reconsider your skills
-- msc ^= $awesome:You and your allies can gain power from killing the unholy and evil
-- msc ^= $awesome:A divine halo surrounds you
-- msc ^= $awesome:You feel resistant to extremes of temperature
-- msc += $awesome:There is a labyrinth entrance here
-- msc += $awesome:There is an exit through the horrors of the Abyss here
-- msc += $awesome:You adapt resistances upon receiving elemental damage
-- msc += $awesome:The storm surrounding you grows powerful enough to repel missiles
-- msc += $awesome:There is a magical portal here
-- msc ^= $awesome:There is a gateway to a ziggurat here
-- msc ^= $awesome:Fruit sprouts up around you
-- msc ^= $awesome:A sheep catches fire
-- msc += $awesome:plants?.*grows? in the rain
-- msc += $awesome:You are restored by drawing out deep reserves of power within
-- msc ^= $awesome:Beogh aids your use of armour
-- msc ^= $awesome:Vehumet is extending the range of your destructive magics
-- msc += $awesome:You feel controlled for a moment
-- msc ^= $awesome:There is a gate to the Realm of Zot here
-- msc += $awesome:A monocle briefly appears
-- msc += $awesome:You feel an empty sense of dread
-- msc += $awesome:That felt like a moral victory
-- msc += $awesome:A shaft materialises beneath you
-- msc += $awesome:You draw Experience
-- msc += $awesome:You draw the Mercenary
-- msc += $awesome:Your body is suffused with negative energy
-- msc ^= $awesome:Qazlal will now grant you protection from an element of your choosing
-- msc ^= $awesome:Kikubaaqudgha is protecting mute from unholy torment
-- msc ^= $awesome:Kikubaaqudgha will now enhance your necromancy at an altar
-- msc += $awesome:You rejoin the land of the living
-- msc += $awesome:The sixfirhy explodes in a shower of sparks
-- msc += $awesome:With a swish of your cloak
-- msc += $awesome:Some fountains start gushing blood
-- msc += $awesome:A genie takes form and thunders\: \"Choose your reward
-- msc += $awesome:You turn into a fearsome dragon
-- msc += $awesome:You turn into a living statue of rough stone
-- msc += $awesome:You manage to scramble free
-- msc += $awesome:Your.*(rod|wand).*glows for a moment
-- msc += $awesome:You sense traps nearby
-- msc += $awesome:You now sometimes bleed smoke when heavily injured by enemies
-- msc += $awesome:Your shadow now sometimes tangibly mimics your actions
-- msc += $awesome:You sense items nearby
-- msc += $awesome:Suddenly you stand beside yourself
-- msc += $awesome:You feel somewhat nimbler
-- msc += $awesome:A mystic portal forms
-- msc += $awesome:You may select the general direction of your translocation
-- msc += $awesome:It is briefly surrounded by shifting shadows
-- msc += $awesome:The deck has exactly five cards
-- msc += $awesome:You are no longer firmly anchored in space
-- msc += $awesome:There is a gate to the Realm of Zot here
-- msc += $awesome:A terribly searing pain shoots up your
-- msc += $awesome:Your strength has recovered
-- msc += $awesome:A flood of memories washes over you
-- msc ^= $awesome:Vehumet offers you knowledge of
-- msc ^= $awesome:With a loud hiss the gate opens wide
-- msc += $awesome:You have collected all the runes
-- msc += $awesome:a hidden mimic gets squished
-- msc += $awesome:Now go and win
-- msc += $awesome:You feel knowledgeable
-- msc += $awesome:The arc blade crackles to life
-- msc ^= $awesome:There is a gate leading out of Pandemonium here
-- msc += $awesome:You feel powerful
-- msc ^= $awesome:You can now
-- msc += $awesome:joins your ranks
-- msc += $awesome:Your magic begins regenerating once more
-- msc += $awesome:Your.*is now the
-- msc += $awesome:There is a glowing drain
-- msc ^= $awesome:There is a gateway leading out of the Abyss here
-- msc += $awesome:There is a sand-covered staircase here
-- msc += $awesome:Your.*crackles with electricity
-- msc ^= $awesome:This is a scroll of acquirement
-- msc += $awesome:You pick up the.*rune
-- msc += $awesome:You now have.*rune
-- msc += $awesome:Your.*skill increases
-- msc += $awesome:You have reached level
-- msc += $awesome:Your experience leads to an increase in your attributes
-- msc ^= $awesome:There is a frozen archway here
-- msc ^= $awesome:There is a dark tunnel here
-- msc ^= $awesome:There is a flagged portal here
-- msc ^= $awesome:There is a portal to a secret trove of treasure here
-- msc ^= $awesome:There is a flickering gateway to a bazaar here
-- msc ^= $awesome:There is an entrance to.*on this level
-- msc += $awesome:3 runes! That's enough to enter the realm of Zot
-- msc += $awesome:The lock glows eerily
-- msc += $awesome:Heavy smoke blows from the lock
-- msc += $awesome:You have escaped!
-- msc += $awesome:rune into the lock
-- msc += $awesome:With a loud hiss the gate opens wide
-- msc += $awesome:You sensed
-- msc += $awesome:You are wearing\:
-- msc += $awesome:With a loud hiss the gate opens wide
-- msc += $awesome:The shadows inhabiting this place fade forever
-- msc += $awesome:You have identified the last
-- msc += $awesome:You feel a craving for the dungeon's cuisine
-- msc ^= $awesome:Lugonu will now corrupt your weapon
-- msc ^= $awesome:You now have enough gold to petition Gozag for potion effects
-- msc ^= $awesome:You now have enough gold to fund merchants seeking to open stores in the dungeon

-- # Weapon brands/enchantment
-- msc ^= $awesome:A searing pain shoots up your
-- msc += $awesome:You hear the crackle of electricity
-- msc += $awesome:You see sparks fly
-- msc += $awesome:Your hands tingle
-- msc += $awesome:Your claws tingle
-- msc += $awesome:You feel a dreadful hunger
-- msc ^= $awesome:Your.*glows (green|purple|red|.*yellow)
-- msc += $awesome:briefly pass through it before

-- # You or an ally takes damage
-- msc ^= $negative:Your.*writhes in agony
-- msc += $negative:you trip and fall down the stairs
-- msc += $negative:You are engulfed in blessed fire
-- msc ^= $negative:collides with you
-- msc += $negative:The fountain mimic splashes you
-- msc += $negative:Your body is twisted very painfully
-- msc += $negative:crushes you
-- msc ^= $negative:drains your
-- msc += $negative:Your body is distorted in a weirdly horrible way
-- msc ^= $negative:Your.*is struck by the twisting air
-- msc += $negative:You are constricted
-- msc ^= $negative:Your.*is blasted
-- msc += $negative:Electricity courses through your body
-- msc ^= $negative:Your.*is struck by lightning
-- msc += $negative:You are struck by lightning
-- msc += $negative:silver sears your?
-- msc += $negative:You draw magical energy from your own body
-- msc += $negative:Rocks fall onto you out of nowhere
-- msc += $negative:You are engulfed in raging winds
-- msc ^= $negative:Your.*convulses
-- msc += $negative:You are struck by the briar patch's thorns
-- msc += $negative:You feel like your blood is boiling
-- msc += $negative:The magical storm engulfs you
-- msc += $negative:The acid blast engulfs you
-- msc += $negative:starcursed mass engulfs you
-- msc += $negative:The pyre of ghostly fire engulfs you
-- msc += $negative:Your body is flooded with distortional energies
-- msc += $negative:You are caught in a strong localised spatial distortion
-- msc ^= $negative:The Shining One blasts you with cleansing flame
-- msc += $negative:You are struck by lightning
-- msc += $negative:You are caught in an extremely strong localised spatial distortion
-- msc += $negative:You are blasted with searing flames
-- msc += $negative:Your.*suffers a backlash
-- msc ^= $negative:Your.*is smitten
-- msc += $negative:You are blasted with fire
-- msc ^= $negative:Your.*is engulfed in
-- msc ^= $negative:A huge blade swings out and slices into your?
-- msc += $negative:Flames sear your flesh
-- msc += $negative:A wave of violent energy washes through your body
-- msc += $negative:You are caught in a localised spatial distortion
-- msc ^= $negative:Heat is drained from your body
-- msc += $negative:Energy rips through your body
-- msc += $negative:You feel you are being watched by something
-- msc += $negative:Unholy energy fills the air
-- msc += $negative:You are caught in a localised field of spatial distortion
-- msc += $negative:The ghost moth stares at you
-- msc += $negative:Your ice beast melts
-- msc ^= $negative:burns you
-- msc ^= $negative:The poison in your system burns
-- msc += $negative:Your.*burn
-- msc += $negative:draws from the surrounding life force
-- msc += $negative:The boulder beetle smashes into you
-- msc += $negative:You feel very cold
-- msc ^= $negative:The.*pierces through (you|your)
-- msc ^= $negative:The walls? burns? you
-- msc ^= $negative:Your.*is blown up
-- msc += $negative:The throwing net hits your
-- msc += $negative:Your body is suffused with distortional energy
-- msc += $negative:constricts your?
-- msc += $negative:(bites|burns|claws|freezes|gores|gores|headbutts|hits|kicks|pecks|pecks|poisons|punches) your?
-- msc += $negative:(shocks|skewers|slaps|smites|stings|tail-slaps|tentacle-slaps|touches|tramples|trunk-slaps) your?
-- # Thanks killer klowns
-- msc += $negative:(kneecaps|defenestrates|elbows|flogs|headlocks|pinches|pokes|pounds|prods|squeezes|strangle-hugs|teases|tickles|trip-wires|wrestles) your?
-- msc += $negative:Your.*burned by acid
-- msc += $negative:Your?.*is struck by the.*spines
-- msc += $negative:Your spectral weapon shares its damage
-- msc += $negative:The.*begins to radiate
-- msc += $negative:The.*toxic radiance grows
-- msc += $negative:Your.*loses its grip
-- msc += $negative:The water swirls and strikes you
-- msc += $negative:Your.*is knocked back
-- msc += $negative:The shock serpent's electric aura discharges violently
-- msc += $negative:The lightning shocks
-- msc += $negative:The tentacled starspawn engulfs you
-- msc += $negative:The.*ugly thing engulfs you
-- msc ^= $negative:Your life force is offered up
-- msc ^= $negative:The (.*hellfire|blast of flame|blast of lightning|blast of magma|explosion) engulfs your?
-- msc ^= $negative:The (explosion of.*fragments|explosion of spores|fiery explosion|fireball|ghostly fireball) engulfs your?
-- msc ^= $negative:The (great blast of fire|plume of ash|stinking cloud|blast of energy) engulfs your?
-- msc += $negative:Pain shoots through your body
-- msc += $negative:Your.*is flash-frozen
-- msc += $negative:You writhe in agony
-- msc += $negative:you feel sick
-- msc += $negative:Something smites you
-- msc ^= $negative:The air twists around and.*strikes you
-- msc += $negative:You are hit by a branch
-- msc += $negative:You are caught in an explosion of flying shrapnel
-- msc += $negative:You are hit by flying rocks
-- msc += $negative:You slam into
-- msc += $negative:You collide with
-- msc ^= $negative:strikes at you from the darkness
-- msc += $negative:Your?.*burned terribly
-- msc += $negative:covered in liquid flames
-- msc += $negative:You are blasted with ice
-- msc += $negative:Your.*seems to slow down
-- msc += $negative:You are electrocuted
-- msc += $negative:and unravels at your touch
-- msc += $negative:You are struck by the.*spines
-- msc += $negative:The water rises up and strikes you
-- msc += $negative:The torrent of lightning arcs to you
-- msc += $negative:A root smacks your
-- msc += $negative:The eye of draining stares at you
-- msc += $negative:The (great icy blast|orb of electricity|noxious blast) engulfs you
-- msc += $negative:The barbed spikes dig painfully into your body as you move
-- msc += $negative:You are engulfed in (a cloud of scalding steam|flames|freezing|freezing vapours)
-- msc += $negative:You are engulfed in (ghostly flame|negative energy|noxious fumes|poison gas|roaring flames)
-- msc += $negative:A root smacks you from below
-- msc += $negative:Ka-crash
-- msc += $negative:You are frozen
-- msc ^= $negative:draws life force from you
-- msc += $negative:You have a terrible headache
-- msc += $negative:Your damage is reflected back at you
-- msc += $negative:Your body is twisted painfully
-- msc += $negative:Your scythe-like blades burn
-- msc ^= $negative:Your.*is (burned by|splashed with) acid
-- msc += $negative:Your.*is constricted
-- msc += $negative:The freed slave is burned by acid
-- msc += $negative:Something.*your
-- msc += $negative:snaps closed at you
-- msc += $negative:headbutts you!
-- msc += $negative:engulfs your
-- msc += $negative:You are blasted with magical energy
-- msc += $negative:The large rock crashes through you
-- msc += $negative:You are blasted!
-- msc += $negative:is hit by a branch
-- msc += $negative:The wandering mushroom releases spores at your?

-- #monster resists
-- msc += $danger:completely resists
-- msc += $warning:resists

-- # Text describing ranged attacks and spells
-- msc ^= $takesaction:chants a haunting song
-- msc += $takesaction:You release an incredible blast of power in all directions
-- msc += $takesaction:calls upon its god to speed up
-- msc += $takesaction:You create a blast
-- msc += $takesaction:The ophan calls forth blessed flames
-- msc += $takesaction:You exhale
-- msc += $takesaction:You enter the passage of Golubria
-- msc += $takesaction:You conjure a prism of explosive energy
-- msc += $takesaction:A raging storm of fire appears
-- msc += $takesaction:Sojobo summons a great blast of wind
-- msc += $takesaction:A fierce wind blows from the fan
-- msc ^= $takesaction:Rupert roars wildly at you
-- msc += $takesaction:A fierce wind blows
-- msc += $takesaction:The wizard shimmers violently
-- msc += $takesaction:releases spores
-- msc += $takesaction:The giant eyeball stares at you
-- msc += $takesaction:You begin recalling your allies
-- msc += $takesaction:You begin to radiate toxic energy
-- msc += $takesaction:The wretched star glows turbulently
-- msc += $takesaction:You begin to meditate on the wall
-- msc += $takesaction:You dig through the rock wall
-- msc += $takesaction:You ignite the poison in your surroundings
-- msc += $takesaction:You attempt to give life to the dead
-- msc ^= $takesaction:hurls a stone arrow
-- msc += $takesaction:weaves a glowing orb of energy
-- msc += $takesaction:spins a strand of pure energy
-- msc += $takesaction:Aizul coils himself and waves his upper body at you
-- msc ^= $takesaction:The royal jelly spits out
-- msc ^= $takesaction:calls upon Beogh to heal
-- msc ^= $takesaction:prays to Beogh
-- msc ^= $takesaction:calls down the wrath of
-- msc ^= $takesaction:invokes the aid of Beogh
-- msc += $takesaction:utters an invocation to Beogh
-- msc += $takesaction:shining eye gazes
-- msc += $takesaction:orb of fire glows
-- msc += $takesaction:orb of fire emits
-- msc += $takesaction:utters an invocation to its god
-- msc += $takesaction:offers its life energy for powerful magic
-- msc += $takesaction:utters a dark prayer and points at you
-- msc += $takesaction:waves its arms in wide circles
-- msc += $takesaction:is infused with unholy energy
-- msc += $takesaction:shambling mangrove reaches out with a gnarled limb
-- msc += $takesaction:You jump-attack
-- msc += $takesaction:The injured rakshasa weaves a defensive illusion
-- msc += $takesaction:Mara seems to draw the.*out of itself
-- msc += $takesaction:Mara shimmers
-- msc += $takesaction:Your battlesphere fires
-- msc += $takesaction:curse skull calls on the powers of darkness
-- msc += $takesaction:curse skull rattles its jaw
-- msc += $takesaction:Your shadow mimicks your spell
-- msc += $takesaction:calls down the wrath of its god upon you
-- msc += $takesaction:invokes the aid of its god against you
-- msc += $takesaction:rakshasa weaves an illusion
-- msc += $takesaction:coils itself and waves its upper body at you
-- msc += $takesaction:casts a spell
-- msc += $takesaction:You breathe a
-- msc ^= $takesaction:You draw life from your surroundings
-- msc += $takesaction:You step out of the flow of time
-- msc += $takesaction:You can feel time thicken for a moment
-- msc += $takesaction:The chunk of flesh you are holding crumbles to dust
-- msc += $takesaction:flesh is ripped from the corpse
-- msc += $takesaction:The flow of time bends around you
-- msc += $takesaction:You start singing a song of slaying
-- msc += $takesaction:The disc erupts in an explosion of electricity!
-- msc += $takesaction:and something leaps out
-- msc += $takesaction:You assume a fearsome visage
-- msc ^= $takesaction:Asterion utters an invocation to Makhleb
-- msc ^= $takesaction:Asterion conjures a destructive force in the name of Makhleb
-- msc ^= $takesaction:wizard howls an incantation
-- msc ^= $takesaction:draws from the surrounding life force
-- msc ^= $takesaction:Gastronok chants a spell
-- msc ^= $takesaction:(breathes|spits).*at
-- msc += $takesaction:You conjure a mighty blast of ice
-- msc += $takesaction:conjures a mighty blast of ice
-- msc ^= $takesaction:Your spellforged servitor (casts|conjures|launches)
-- msc += $takesaction:You reach into the bag
-- msc += $takesaction:You gaze into the crystal ball
-- msc += $takesaction:Your jumping spider leaps
-- msc ^= $takesaction:ice dragon breathes frost
-- msc ^= $takesaction:points at you and mumbles some strange words
-- msc += $takesaction:(fires|shoots|throws) [^n]
-- msc += $takesaction:You (fire|shoot|throw)
-- msc += $takesaction:You magically throw
-- msc += $takesaction:(conjures|fires|gestures|plays a|radiates)
-- msc ^= $takesaction:mumbles some strange (prayers|words)
-- msc ^= $takesaction:spriggan berserker (invokes|prays to|utters an invocation to) Trog
-- msc ^= $takesaction:calls down the wrath of the Shining One
-- msc += $takesaction:casts a spell.*floats close
-- msc += $takesaction:offers itself to Yredelemnul
-- msc ^= $takesaction:launches metal splinters at you
-- msc += $takesaction:(Angry insects surge|Agitated ravens fly) out from beneath the
-- msc ^= $takesaction:begins absorbing vital energies
-- msc ^= $takesaction:calls forth a grand avatar
-- msc ^= $takesaction:exhales a fierce blast of wind
-- msc ^= $takesaction:curls into a ball and starts rolling
-- msc ^= $takesaction:You open the lid...
-- msc ^= $takesaction:jumps down from its now dead mount
-- msc ^= $takesaction:swoops through the air toward you
-- msc ^= $takesaction:jumping spider pounces on
-- msc ^= $takesaction:jumping spider leaps
-- msc += $takesaction:manticore flicks its tail
-- msc += $takesaction:You begin to abjure the creatures around you
-- msc ^= $takesaction:The golden eye blinks at you
-- msc ^= $takesaction:Frances chants phrases taken from a Devil's mouth
-- msc ^= $takesaction:Frances screams a word of power
-- msc ^= $takesaction:Frances whispers indecipherable words
-- msc ^= $takesaction:Frances mutters in a terrible tongue
-- msc ^= $takesaction:activates a sealing rune
-- msc ^= $takesaction:offers up its power
-- msc += $takesaction:You warp the flow of time around you
-- msc += $takesaction:summons
-- msc += $takesaction:great orb of eyes gazes at
-- msc += $takesaction:You radiate an aura of cold
-- msc += $takesaction:Space collapses on itself with a satisfying crunch

-- # Gods performing actions
-- msc += $godaction:You reveal the great annihilating truth to your foes
-- msc ^= $godaction:Dithmenos does not appreciate your starting fires
-- msc += $godaction:Beogh throws an implement of electrocution at you
-- msc += $godaction:Beogh throws implements of electrocution at you
-- msc += $godaction:Beogh sends forth an army of orcs
-- msc += $godaction:you feel ready to understand
-- msc += $godaction:You feel a surge of divine interest
-- msc += $godaction:(Ashenzari|Beogh|Cheibriados|Dithmenos|Elyvilon|Fedhas|Gozag|Igni Ipthes|Jiyva|Kikubaaqudgha|Lugonu)
-- msc += $godaction:(Makhleb|Nemelex Xobeh|Okawaru|Qazlal|Sif Muna|The Shining One|Trog|Vehumet|Xom|Yredelemnul|Zin[^g])
-- msc ^= $godaction:(Ashenzari|Beogh|Cheibriados|Dithmenos|Elyvilon|Fedhas|Gozag|Igni Ipthes|Jiyva|Kikubaaqudgha|Lugonu) says
-- msc ^= $godaction:(Makhleb|Nemelex Xobeh|Okawaru|Qazlal|Sif Muna|The Shining One|Trog|Vehumet|Xom|Yredelemnul|Zin[^g]) says
-- msc ^= $godaction:Your divine halo returns
-- msc += $godaction:is distracted by the nearby gold
-- msc += $godaction:soul is now ripe for the taking
-- msc += $godaction:sets up shop in the Dungeon
-- msc ^= $godaction:You redirect
-- msc ^= $godaction:You feel protected from physical attacks
-- msc ^= $godaction:You feel protected from cold
-- msc ^= $godaction:You feel protected from fire
-- msc ^= $godaction:You feel protected from electricity
-- msc += $godaction:resistances upon receiving elemental damage
-- msc += $godaction:A storm cloud blasts the area with cutting wind
-- msc += $godaction:A blizzard blasts the area with ice
-- msc += $godaction:Magma suddenly erupts from the ground
-- msc ^= $godaction:Xom calls
-- msc += $godaction:The storm around you weakens
-- msc += $godaction:The ground shakes violently
-- msc += $godaction:The storm around you strengthens
-- msc += $godaction:due to Igni's heat
-- msc += $godaction:A mighty gale blasts forth
-- msc += $godaction:A fiery fortress appears around you!
-- msc += $godaction:is consumed in a column of flame
-- msc += $godaction:The toadstool can now pick up its mycelia and move
-- msc += $godaction:Slime for the Slime God
-- msc ^= $godaction:Cheibriados rebukes [^y]
-- msc ^= $godaction:You hear Xom
-- msc ^= $godaction:Go forth and redecorate
-- msc += $godaction:This is a.*sacrifice
-- msc ^= $godaction:Xom.*touches
-- msc ^= $godaction:You need some minor
-- msc ^= $godaction:Let me alter your
-- msc ^= $godaction:Xom complains about the scenery
-- msc ^= $godaction:Xom howls with laughter
-- msc ^= $godaction:This place needs a little more atmosphere
-- msc ^= $godaction:The area is suffused with divine lightning
-- msc ^= $godaction:Let's go for a ride
-- msc ^= $godaction:Xom momentarily opens a gate
-- msc ^= $godaction:Where it stops
-- msc ^= $godaction:\"First here\, now there\.\"
-- msc ^= $godaction:\"Over there now!\"
-- msc ^= $godaction:Serve the toy\, my child
-- msc ^= $godaction:Fight to survive\, mortal
-- msc ^= $godaction:Xom opens a gate
-- msc ^= $godaction:Xom slaps you with
-- msc ^= $godaction:You hear crickets chirping
-- msc ^= $godaction:Get over here
-- msc ^= $godaction:Go forth and destroy
-- msc ^= $godaction:Xom laughs nastily
-- msc ^= $godaction:Everything around seems to assume a strange transparency
-- msc ^= $godaction:You feel watched
-- msc ^= $godaction:The walls suddenly lose part of their structure
-- msc ^= $godaction:You are now a BORING thing
-- msc ^= $godaction:Xom makes a sudden noise
-- msc ^= $godaction:Xom roars with laughter
-- msc ^= $godaction:You feel someone pinching you\. As you turn\, you see no one
-- msc ^= $godaction:\"Try this\.\"
-- msc ^= $godaction:\"Whee!\"
-- msc ^= $godaction:\"Catch!\"
-- msc ^= $godaction:\"Here.\"
-- msc ^= $godaction:\"Boo!\"
-- msc ^= $godaction:\"Tag\, you\'re it!\"
-- msc ^= $godaction:\"Boring in life\, Boring in death\"
-- msc ^= $godaction:\"This might be better!\"
-- msc ^= $godaction:\"I like them better like this\.\"
-- msc ^= $godaction:\"Heh heh heh\.\.\.\"
-- msc ^= $godaction:\"Burn\, baby\, burn!\"
-- msc ^= $godaction:\"Time to have some fun!\"
-- msc ^= $godaction:\"Have a taste of chaos\, mortal\.\"
-- msc ^= $godaction:\"See what I see\, my child!\"
-- msc ^= $godaction:\"Just a minor improvement\.\.\.\"
-- msc ^= $godaction:\"Hum-dee-hum-dee-hum\.\.\.\"
-- msc ^= $godaction:\"There\, this looks better\.\"
-- msc ^= $godaction:\"You have grown too confident for your meagre worth\.\"
-- msc ^= $godaction:\"Take this token of my esteem\.\"
-- msc ^= $godaction:\"Take this instrument of something!\"
-- msc ^= $godaction:\"See what I see\, my child!\"
-- msc ^= $godaction:\"What!\? Thats's it\?!\"c
-- msc ^= $godaction:\"Serve the (mortal|toy)\, my (child|children)!\"
-- msc ^= $godaction:Let\'s see if it\'s strong enough to survive yet

-- # Interface Messages - These shouldn't take any turns
-- msc += $interface:You cannot read scrolls
-- msc += $interface:You cannot drink potions
-- msc += $interface:too exhausted to
-- msc += $interface:There are no objects that can be picked up here
-- msc += $interface:Calm down first
-- msc += $interface:You enter a permanent teleport trap
-- msc += $interface:too cloudy to do that here
-- msc += $interface:A powerful magic interferes with the creation of the passage
-- msc += $interface:You cannot apport that
-- msc += $interface:The film of ice won't work on stone
-- msc += $interface:You refuse to eat that rotten meat
-- msc += $interface:You see nothing there to enslave the soul of
-- msc += $interface:There isn't anything that you can close there
-- msc += $interface:Choose some type of armour to enchant
-- msc += $interface:You can't place the prism on a creature
-- msc += $interface:You are too depleted to cast spells recklessly
-- msc += $interface:It's stuck to you
-- msc += $interface:You're in a travel-excluded area
-- msc += $interface:You are unable to make a sound
-- msc += $interface:Choose an unidentified item
-- msc += $interface:There is nothing here that can be animated
-- msc += $interface:No.*are visible
-- msc += $interface:No evolvable flora in sight
-- msc += $interface:You must target a plant or fungus
-- msc += $interface:No target in range
-- msc += $interface:This is a.*deck
-- msc += $interface:No exploration algorithm can help you here
-- msc += $interface:You cannot walk through the dense trees
-- msc += $interface:This wall is too hard to dig through
-- msc += $interface:You can't dig through that
-- msc += $interface:You are already wielding that
-- msc ^= $interface:Something interferes with your magic
-- msc += $interface:You can only heal others!
-- msc += $interface:You are already wielding that
-- msc += $interface:You don't know.*spells?
-- msc += $interface:That is presently inert
-- msc += $interface:That isn't a deck
-- msc += $interface:Reset throwing quiver to default
-- msc += $interface:You can't memorise that many levels of magic yet
-- msc += $interface:You aren't wielding a weapon
-- msc += $interface:You'd need your.*free
-- msc += $interface:I'll put part of them outside for you
-- msc += $interface:You're in a travel-excluded area\, stopping explore
-- msc += $interface:There is a passage of Golubria here
-- msc += $interface:you can't auto-travel out of here
-- msc += $interface:waypoint
-- msc += $interface:You aren't in the Abyss
-- msc += $interface:You haven't found any runes yet
-- msc += $interface:This weapon is holy and will not allow you to wield it
-- msc += $interface:Huh\?
-- msc += $interface:You can't drink
-- msc += $interface:You cannot cast that spell in your current form
-- msc ^= $interface:is stuck to you
-- msc += $interface:is melded into your body
-- msc ^= $interface:Your.*feels? slithery
-- msc += $interface:You can't wear anything in your present form
-- msc += $interface:You're too inexperienced to learn that spell
-- msc += $interface:You're already wearing two cursed rings
-- msc += $interface:You need a rune to enter this place
-- msc ^= $interface:There is an ice covered gate leading back out of here here
-- msc += $interface:The bosom of this dungeon contains the most powerful artefact
-- msc += $interface:Clearing travel trail
-- msc += $interface:Your pack is full
-- msc += $interface:You can't pick everything up
-- msc += $interface:Could not pick up an item
-- msc += $interface:You can't carry that many items
-- msc += $interface:You enter the Abyss
-- msc += $interface:You enter the halls of Pandemonium
-- msc += $interface:This wand has
-- msc += $interface:That is beyond the maximum range
-- msc += $interface:You can't (drink|read) that
-- msc += $interface:You cannot shoot.*while held in a net
-- msc += $interface:You're already here
-- msc += $interface:You can't do that
-- msc += $interface:Cleared annotation
-- msc += $interface:Your cursed.*is stuck to you
-- msc += $interface:You have no means to grasp a wand firmly enough
-- msc += $interface:Choose a valid weapon
-- msc += $interface:No previous command
-- msc += $interface:You sense a monster
-- msc += $interface:Welcome
-- msc += $interface:There is a.*trap here
-- msc += $interface:There is a.*(entrance|staircase).*here
-- msc += $interface:That item cannot be evoked
-- msc += $interface:Please enjoy your stay
-- msc += $interface:You now have enough gold to buy
-- msc += $interface:Showing terrain only
-- msc += $interface:Returning to normal view
-- msc += $interface:Done exploring
-- msc += $interface:You pace your travel speed to your slowest ally
-- msc += $interface:The water rises up and takes form
-- msc += $interface:The winds coalesce and take form
-- msc += $interface:The.*answers the.*call
-- msc += $interface:You're too full
-- msc += $interface:Your memorisation is interrupted
-- msc += $interface:surroundings become eerily quiet
-- msc += $interface:You fall into the shallow water
-- msc += $interface:an escape hatch
-- msc += $interface:You stop dropping stuff
-- msc += $interface:melds into your body
-- msc += $interface:Clearing level map
-- msc += $interface:There's nothing close enough
-- msc += $interface:Autopickup is now
-- msc += $interface:Hurry and find it before the portal
-- msc += $interface:You slide downwards
-- msc += $interface:Can't find anything matching that
-- msc += $interface:No item to drop
-- msc += $interface:You finish taking off
-- msc += $interface:appears from thin air
-- msc += $interface:You feel more attuned to
-- msc += $interface:(Attack!|Fall back!|Follow me!|Stop fighting!|Wait here!)
-- msc += $interface:You have finished your manual
-- msc += $interface:Expect minor deviation
-- msc += $interface:You have no appropriate body parts free
-- msc += $interface:Your cloak prevents you from wearing the armour
-- msc ^= $interface:You finish putting on
-- msc += $interface:You can't carry that much weight
-- msc += $interface:isn't holding a weapon that can be rebranded
-- msc += $interface:You feel the dreadful sensation subside
-- msc += $interface:You feel an oppressive heat about you
-- msc += $interface:You travel at normal speed
-- msc += $interface:Your reserves of magic are already full
-- msc += $interface:There are no corpses nearby
-- msc += $interface:No target in view
-- msc += $interface:It (is|was) a (potion|scroll)
-- msc += $interface:Aborting
-- msc += $interface:Created macro
-- msc += $interface:Saving macro
-- msc += $interface:you cannot use those schools of magic

-- # Muted - unnecessary
-- # msc += mute:The (bush|fungus|plant) is engulfed
-- # msc += mute:The (bush|fungus|plant) is struck by lightning
-- # msc += mute:Cast which spell
-- # msc += mute:Use which ability
-- # msc += mute:Evoke which item
-- # msc += mute:Confirm with
-- # msc += mute:(Casting|Aiming|Zapping)\:
-- # msc += mute:Throwing.*\:
-- # msc += mute:You can\'t see any susceptible monsters within range
-- # msc += mute:Press\: \? \- help, Shift\-Dir \- straight line, f \- you
-- # msc += mute:for a list of commands and other information
-- # msc += mute:Firing \(i
-- # msc += mute:Fire\/throw which item\?
-- # msc += mute:You swap places

-- msc ^= mute:is lightly (damaged|wounded)
-- msc ^= mute:is moderately (damaged|wounded)
-- msc ^= mute:is heavily (damaged|wounded)
-- msc ^= mute:is severely (damaged|wounded)
-- msc ^= mute:is almost (dead|destroyed)

-- # msc += mute:Was it this warm in here before
-- # msc += mute:The flames dance
-- # msc += mute:Your shadow attacks
-- # msc += mute:Marking area around
-- # msc += mute:Placed new exclusion
-- # msc += mute:Reduced exclusion size to a single square
-- # msc += mute:Removed exclusion
-- # msc += mute:You can access your shopping list by pressing
-- # msc += mute:for starvation awaits
-- # msc += mute:As you enter the labyrinth
-- # msc += mute:previously moving walls settle noisily into place
-- # msc += mute:You offer a prayer to Elyvilon
-- # msc += mute:You offer a prayer to Nemelex Xobeh
-- # msc += mute:You offer a prayer to Okawaru
-- # msc += mute:You offer a prayer to Makhleb
-- # msc ^= mute:You offer a prayer to Lugonu
-- # msc += mute:Lugonu accepts your kill
-- # msc += mute:Okawaru is noncommittal
-- # msc += mute:Nemelex Xobeh is (noncommittal|pleased)
-- # msc += mute:The plant looks sick
-- # msc += mute:This raw flesh tastes terrible

-- # : if string.find(you.god(), "Jiyva") then
-- #   msc += mute:You hear a.*slurping noise
-- #   msc += mute:You hear a.*squelching noise
-- #   msc += mute:You feel a little less hungry
-- # : end

-- # --These don't seem to work, maybe a bug?
-- # msc ^= boring:disappears without a glow
-- # msc ^= boring:disappears without a sign
-- # msc ^= boring:disappears into the void
-- # msc ^= boring:glow with a rainbow of weird colours and disappear
-- # msc ^= boring:glows slightly and disappears
-- # msc ^= boring:is slowly consumed by flames
-- # msc ^= boring:slowly burns to ash
-- # msc ^= boring:slowly crumbles into the ground
-- # msc ^= boring:shimmers? and breaks? into pieces
-- # msc ^= boring:stares at you suspiciously for a moment
-- # msc += boring:trembles before you
-- # msc += boring:You feel mildly nauseous
-- # msc += boring:Multicoloured lights dance around

-- tile_show_threat_levels = tough nasty


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


{
  safe = you.feel_safe()

  function update_safe()
    local old_safe = safe
    safe = you.feel_safe()
    if not safe and old_safe then
      crawl.mpr("Danger!", "warning")
      crawl.more()
    end
  end

  function ready()
    update_safe()
  end
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



: rc_scs("Successfully initialized magus_ShadowRider38_sobieck.rc [v0.0.5]")
: crawl.enable_more(true)
