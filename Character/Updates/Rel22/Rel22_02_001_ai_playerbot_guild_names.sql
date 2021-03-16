-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '01'; 
    SET @cOldContent = '006';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '02';
    SET @cNewContent = '001';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix Playerbots pt6';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix Playerbots pt6 - ai_playerbot_guild_names';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

DROP TABLE IF EXISTS `ai_playerbot_guild_names`;
CREATE TABLE `ai_playerbot_guild_names` (
  `name_id` MEDIUMINT(8) NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(24) NOT NULL UNIQUE,
  PRIMARY KEY (`name_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI guild names';

INSERT INTO `ai_playerbot_guild_names` VALUES
(NULL, 'Black Guard'),
(NULL, 'Abyssal Kingdoms'),
(NULL, 'Acid Evil'),
(NULL, 'Addicts Muskateers'),
(NULL, 'Adventurers War'),
(NULL, 'Age of Red Water Clan'),
(NULL, 'Alivso Reason'),
(NULL, 'All Knights'),
(NULL, 'Allegiance of the Vile'),
(NULL, 'Alliance Clan'),
(NULL, 'Alliance of Defectives'),
(NULL, 'Alti Legions'),
(NULL, 'Anarchie Shi'),
(NULL, 'Anchors of the Nominal'),
(NULL, 'Ancients of Part Times'),
(NULL, 'Angelus Gods'),
(NULL, 'Angry Party'),
(NULL, 'Apocalyptic Lamont'),
(NULL, 'Architects of Green'),
(NULL, 'Army of Black Widows'),
(NULL, 'Army of Orgrimmar Minds'),
(NULL, 'Army of Three Horses'),
(NULL, 'Arrows of Midlight'),
(NULL, 'Artisans of Best Guild'),
(NULL, 'Assasins of the Pyrewood'),
(NULL, 'Assassins Bane'),
(NULL, 'Avatars of Warsong Stuff'),
(NULL, 'Axis of the Funky Night'),
(NULL, 'Azeroth Souls'),
(NULL, 'Azeroths Rabbits'),
(NULL, 'Bad Sentinels'),
(NULL, 'Banana Song'),
(NULL, 'Band of Tarantula Attack'),
(NULL, 'Band of the Dark Reveren'),
(NULL, 'Barcode Praised'),
(NULL, 'Basher Goats'),
(NULL, 'Basic Order'),
(NULL, 'Batman of Banished'),
(NULL, 'Betrayers of Lucky Child'),
(NULL, 'Blackwater Committee'),
(NULL, 'Blades of Lich Kings'),
(NULL, 'Blades of the Hive'),
(NULL, 'Blades of the Total'),
(NULL, 'Bleeding War'),
(NULL, 'Blessed Lair'),
(NULL, 'Blizzards of the Iron'),
(NULL, 'Blood Chaos'),
(NULL, 'Blood Intrigue'),
(NULL, 'Blood Samurai'),
(NULL, 'Bloodlust Good'),
(NULL, 'Bonds of Reported Ignore'),
(NULL, 'Booty Cry'),
(NULL, 'Border Knights'),
(NULL, 'Bossmans Targaryen'),
(NULL, 'Braveheart Heaven'),
(NULL, 'Brotherhood of Twilight'),
(NULL, 'Bruised Pain'),
(NULL, 'Burning Control'),
(NULL, 'Burning Oblivion'),
(NULL, 'Cabal of Kalimdor'),
(NULL, 'Cake Crusade'),
(NULL, 'Call of the Ironforge'),
(NULL, 'Carebears Thunder'),
(NULL, 'Carpe Heaven'),
(NULL, 'Carpe Regiment'),
(NULL, 'Children of Order'),
(NULL, 'Children of the Gods'),
(NULL, 'Circle of Amor E Bobby'),
(NULL, 'Clan of the Elven Toys'),
(NULL, 'Clan of the Strike Light'),
(NULL, 'Coalition of Super Best'),
(NULL, 'Collective Pimps'),
(NULL, 'Companions of the Gnome'),
(NULL, 'Company of the Vibe'),
(NULL, 'Conclave of the Triad'),
(NULL, 'Council of Final Demise'),
(NULL, 'Council of Hard Core Ord'),
(NULL, 'Craaweh Thrall'),
(NULL, 'Cradle Scourge'),
(NULL, 'Crimson Angels'),
(NULL, 'Crimson Saints'),
(NULL, 'Crusade of Oh'),
(NULL, 'Crusaders of Undead'),
(NULL, 'Cryptic Serenity'),
(NULL, 'Csa Rigged'),
(NULL, 'Cult of the Raging Raid'),
(NULL, 'Dalaran Fair'),
(NULL, 'Damage Inc'),
(NULL, 'Dark Alliance'),
(NULL, 'Dark Azeroth'),
(NULL, 'Dark Damage'),
(NULL, 'Dark Resistus'),
(NULL, 'Dark Samurai'),
(NULL, 'Dark Turtles'),
(NULL, 'Darken Mercenaries'),
(NULL, 'Darkened Malevolence'),
(NULL, 'Darkness of Sword Coast'),
(NULL, 'Dawn of Knights Society'),
(NULL, 'Dawn of Mad Sentry'),
(NULL, 'Dead Zug'),
(NULL, 'Death Darkness'),
(NULL, 'Death Knights'),
(NULL, 'Deathlike Goods'),
(NULL, 'Deaths Venoms'),
(NULL, 'Decree of the Phumpers'),
(NULL, 'Defenders of Da Raised'),
(NULL, 'Defenders of Hyuuga Dark'),
(NULL, 'Defenders of Sacred Harm'),
(NULL, 'Deths Lords'),
(NULL, 'Devil Circl'),
(NULL, 'Devils Klng'),
(NULL, 'Dharma Hand'),
(NULL, 'Dharma Thorn'),
(NULL, 'Dies Ravager'),
(NULL, 'Disciples of Dead Panda'),
(NULL, 'Disciples of the Rot'),
(NULL, 'Doomsday Youth'),
(NULL, 'Dorcha Knights'),
(NULL, 'Dots of Dead Skull'),
(NULL, 'Dragon Arms'),
(NULL, 'Dragonhawk Revolution'),
(NULL, 'Dragons Erythnul'),
(NULL, 'Dragons of the Black'),
(NULL, 'Drunken Thunder'),
(NULL, 'Drunks of Matoskan'),
(NULL, 'Dwarven Rock'),
(NULL, 'Dynasty of the Emerald'),
(NULL, 'Eastern Asylum'),
(NULL, 'Echo Sanctus'),
(NULL, 'Echoes of the Muphin'),
(NULL, 'Effreno Death'),
(NULL, 'Elite Guild'),
(NULL, 'Elite Legion'),
(NULL, 'Elite Veritas'),
(NULL, 'Elunes Meat'),
(NULL, 'Emerald Men'),
(NULL, 'Emerald Mjolnir'),
(NULL, 'Endless Defense'),
(NULL, 'Enemies of Bleeding'),
(NULL, 'Enternal Saber'),
(NULL, 'Evictors of the Returned'),
(NULL, 'Evil Guard'),
(NULL, 'Exalted Effect'),
(NULL, 'Eyes of a Night Elf'),
(NULL, 'Eyes of the Elton Souls'),
(NULL, 'Fallen Clan'),
(NULL, 'Fallen Milk'),
(NULL, 'Fenrir Seeker'),
(NULL, 'Final Army'),
(NULL, 'Flames of Ale Drinkers'),
(NULL, 'Flames of Antarian Chaos'),
(NULL, 'Forestt''s Wrath'),
(NULL, 'Forgotten Within'),
(NULL, 'From Synergy'),
(NULL, 'Frozen Oblivion'),
(NULL, 'Gashlycrumb Rollers'),
(NULL, 'Giovannitwos Elune'),
(NULL, 'Glass Meridian'),
(NULL, 'Gnome Faction'),
(NULL, 'Gods Gold'),
(NULL, 'Gods of the Complete'),
(NULL, 'Gold Catchers'),
(NULL, 'Golden Legendz'),
(NULL, 'Golden Souls'),
(NULL, 'Goldshire Goats'),
(NULL, 'Good Azeroth'),
(NULL, 'Gotz Safety'),
(NULL, 'Grammaton Alliance'),
(NULL, 'Great Circle'),
(NULL, 'Guardians of Honor'),
(NULL, 'Guards of Frostmane'),
(NULL, 'Guild of La Mano Dragons'),
(NULL, 'Guild of the Puppet'),
(NULL, 'Haggles Brigade'),
(NULL, 'Hammer of the Moral'),
(NULL, 'Hand of the Iron'),
(NULL, 'Hands of Far Con Buddies'),
(NULL, 'Hearts Knights'),
(NULL, 'Hell Angels'),
(NULL, 'Hells Thorn'),
(NULL, 'Holy Darnassus'),
(NULL, 'Horde Abh'),
(NULL, 'Horde Dragons'),
(NULL, 'Horde Leaders'),
(NULL, 'Horde Squad'),
(NULL, 'Horde of Omnia'),
(NULL, 'Horde of Free Brigade'),
(NULL, 'Horde of Shadow Flush'),
(NULL, 'Hordes Buccaneers'),
(NULL, 'Hordes Marauders'),
(NULL, 'House Crusaders'),
(NULL, 'Immortality Honor'),
(NULL, 'Inside Poof'),
(NULL, 'Iron Boyz'),
(NULL, 'Iscariot Ginas'),
(NULL, 'Island Kimchi'),
(NULL, 'Jenovas Wild'),
(NULL, 'Kalimdor Darkness'),
(NULL, 'Keepers of Golden Misery'),
(NULL, 'Keggers of Alt Hand Aton'),
(NULL, 'Kill Mafia'),
(NULL, 'Killer Durotar'),
(NULL, 'Killer Force'),
(NULL, 'Kindred Yardies'),
(NULL, 'Kindred of King Assassin'),
(NULL, 'Kingdom of the Ordo Crew'),
(NULL, 'Kings Boys'),
(NULL, 'Kings Windstorm'),
(NULL, 'Kings of Blood Knuckle'),
(NULL, 'Kings of Dol Aegis'),
(NULL, 'Knight Combat'),
(NULL, 'Knight of Fuzzy Night'),
(NULL, 'Knights of Darkspear'),
(NULL, 'Knights of Heavens Grave'),
(NULL, 'Knights of Myrmidon Ivxx'),
(NULL, 'Knights of the Avenging'),
(NULL, 'Knights of the Ballpeen'),
(NULL, 'Knights of the Black'),
(NULL, 'Knights of the Bloodhoof'),
(NULL, 'Knights of the Sovereign'),
(NULL, 'Knights of the Storm'),
(NULL, 'Knights of the Zulian'),
(NULL, 'Last Ptesanwi'),
(NULL, 'League of Hate Crew Seek'),
(NULL, 'Legacy of Ninth Beard'),
(NULL, 'Legendary Sons'),
(NULL, 'Legion of Maple Syrup'),
(NULL, 'Legion of Public Works'),
(NULL, 'Legion of Three Course'),
(NULL, 'Legion of United Souls'),
(NULL, 'Legion of Westfall Gold'),
(NULL, 'Legion of the Dark'),
(NULL, 'Legionnaires of Skull'),
(NULL, 'Les Warriors'),
(NULL, 'Lifetakers Inc'),
(NULL, 'Light of Dark Spire'),
(NULL, 'Light of Jade Renegade'),
(NULL, 'Liquid Guild'),
(NULL, 'Lone Side'),
(NULL, 'Lords of Fallen Blood'),
(NULL, 'Los Frum'),
(NULL, 'Lost Boyz'),
(NULL, 'Lost Squad'),
(NULL, 'Mad Daggers'),
(NULL, 'Malice Fatale'),
(NULL, 'Mandate of Jade'),
(NULL, 'Marines of the Butt'),
(NULL, 'Mercenaries of the Death'),
(NULL, 'Midget Council'),
(NULL, 'Midgets of Dark Sexy'),
(NULL, 'Midnight Norrathians'),
(NULL, 'Midnight Slayer'),
(NULL, 'Midnight War'),
(NULL, 'Minions of the Shadow'),
(NULL, 'Ministry of the Allince'),
(NULL, 'Mithril Destiny'),
(NULL, 'Monarchs of Party Crew'),
(NULL, 'Money Call'),
(NULL, 'Moonwood Redeye'),
(NULL, 'Narrow Patrol'),
(NULL, 'New Clan'),
(NULL, 'Night Pack'),
(NULL, 'Nightmare Guild'),
(NULL, 'Ninja Pledge'),
(NULL, 'Nocturne of Totally Dead'),
(NULL, 'Obsidian Fish'),
(NULL, 'Old Cosa'),
(NULL, 'One Valor'),
(NULL, 'Opus Faithful'),
(NULL, 'Order of Alts oF Fate'),
(NULL, 'Order of Nagas Bike Hunt'),
(NULL, 'Order of Omega Wards'),
(NULL, 'Order of Pink'),
(NULL, 'Order of Shield Bed'),
(NULL, 'Order of the Alt Sheep'),
(NULL, 'Order of the Honor'),
(NULL, 'Order of the Divine Lord'),
(NULL, 'Ordo Force'),
(NULL, 'Orgrimmar Ones'),
(NULL, 'Out of Lw Downed Wrynn'),
(NULL, 'Out of Mithril Avengers'),
(NULL, 'Oxbloods Medivh'),
(NULL, 'Pally Guard'),
(NULL, 'Path of the Brain'),
(NULL, 'Peddlers of the Hidden'),
(NULL, 'Phantoms of Wicked'),
(NULL, 'Phoenix Keepers'),
(NULL, 'Pillowcase Azeroth'),
(NULL, 'Pillowcase Cats'),
(NULL, 'Pius Tribe'),
(NULL, 'Plague of Human Slayer'),
(NULL, 'Plan Hand'),
(NULL, 'Power of Tuatha De Blood'),
(NULL, 'Priest Guild'),
(NULL, 'Prophets of Fatima War'),
(NULL, 'Prophets of Outlaw'),
(NULL, 'Prophets of the Red Mean'),
(NULL, 'Protectors of Black Hand'),
(NULL, 'Pure Aequitas'),
(NULL, 'Question Thrall'),
(NULL, 'Quintessential Sister'),
(NULL, 'Rage of Prairie Black'),
(NULL, 'Rage of the Flame'),
(NULL, 'Raiders of Candy Heart'),
(NULL, 'Raiders of the Purple'),
(NULL, 'Raiders of the Sil'),
(NULL, 'Ram Runners'),
(NULL, 'Rangers Vengeance'),
(NULL, 'Rangers of Interitus'),
(NULL, 'Raven Clan'),
(NULL, 'Razzle Guardian'),
(NULL, 'Reapers of the Shadow'),
(NULL, 'Reckless Knights'),
(NULL, 'Red Byam'),
(NULL, 'Red Death'),
(NULL, 'Reign of Alliance Task'),
(NULL, 'Reign of Blazing Frell'),
(NULL, 'Reign of Pure Conway'),
(NULL, 'Restoration of Illegal'),
(NULL, 'Resurrection of Tenui'),
(NULL, 'Ronin Kalimdor'),
(NULL, 'Rotting Tears'),
(NULL, 'Ruins of Dark Azeroth'),
(NULL, 'Rulers of Devils'),
(NULL, 'Sacred Parts'),
(NULL, 'Sacred Society'),
(NULL, 'Sacrificial Brotherhood'),
(NULL, 'Sanguine Council'),
(NULL, 'Sapphic Exiles'),
(NULL, 'Savage Kalimdor'),
(NULL, 'Scourge of Eight Inches'),
(NULL, 'Scourge of Wow Knights'),
(NULL, 'Scythe Sauce'),
(NULL, 'Secret Clan'),
(NULL, 'Seki Council'),
(NULL, 'Seraph Legends'),
(NULL, 'Shaded Judgement'),
(NULL, 'Shadow America'),
(NULL, 'Shadow Boys'),
(NULL, 'Shadow Knights'),
(NULL, 'Shadowed Ghosts'),
(NULL, 'Shadowed Goat'),
(NULL, 'Shadows of Cole Trainz'),
(NULL, 'Shadows of Los Banditos'),
(NULL, 'Shattered Stormrage'),
(NULL, 'Silent Night'),
(NULL, 'Silver Fools'),
(NULL, 'Silversky Sun'),
(NULL, 'Sisters of Kalimdor'),
(NULL, 'Skulled Ironforge'),
(NULL, 'Slayers of the Primals'),
(NULL, 'Sleepy Steel'),
(NULL, 'Soldiers of Azeroth'),
(NULL, 'Soldiers of Stalker'),
(NULL, 'Sons of Lambent Virtue'),
(NULL, 'Sons of the Top Truth'),
(NULL, 'Soul Wish'),
(NULL, 'Souls of Elite Gnome'),
(NULL, 'Spanaway Metalheadz'),
(NULL, 'Spoony Demise'),
(NULL, 'Squires of Sacred Tribe'),
(NULL, 'Stagnant Jesters'),
(NULL, 'Stars of Gear Farming'),
(NULL, 'Stupid Crusaders'),
(NULL, 'Stop Guides'),
(NULL, 'Storm of the Mope''s'),
(NULL, 'Stormrage Ferguson'),
(NULL, 'Stormtroopers of Fatima '),
(NULL, 'Stormwind Crew'),
(NULL, 'Straight Caedes'),
(NULL, 'Stronghold Angels'),
(NULL, 'Sturgeon Empire'),
(NULL, 'Survivors of Devil Club'),
(NULL, 'Sweet Bear'),
(NULL, 'Sword of Lost Evil'),
(NULL, 'Tainted Bunnies'),
(NULL, 'Talon of the Eclectic'),
(NULL, 'Team Kingdom'),
(NULL, 'Team United'),
(NULL, 'Tears of Eternal Kitties'),
(NULL, 'Tears of Phantom Druids'),
(NULL, 'Templar of Raid Dodgers'),
(NULL, 'Templars of Plagueware'),
(NULL, 'Terra Totem'),
(NULL, 'Terra War'),
(NULL, 'The Abiem'),
(NULL, 'The Aceofchaos'),
(NULL, 'The Afterlife'),
(NULL, 'The Aggression'),
(NULL, 'The Alliance of Dark'),
(NULL, 'The Altimate'),
(NULL, 'The Ancona Fire'),
(NULL, 'The Apocalypse'),
(NULL, 'The Arcane Monkey'),
(NULL, 'The Army of Spartans'),
(NULL, 'The Avalon'),
(NULL, 'The Avengers of Shining'),
(NULL, 'The Azure Gangstaz'),
(NULL, 'The Battlegnome'),
(NULL, 'The Black Hand Haven'),
(NULL, 'The Blackdraygon'),
(NULL, 'The Blackout'),
(NULL, 'The Blade'),
(NULL, 'The Blades of Caer Eel'),
(NULL, 'The Blades of Onyxia'),
(NULL, 'The Blood Red Violence'),
(NULL, 'The Blood of Red Powers'),
(NULL, 'The Bloodycrusaders'),
(NULL, 'The Blues Azeroth'),
(NULL, 'The Blues Grimfang'),
(NULL, 'The Bluethunder'),
(NULL, 'The Bonds of Arcane'),
(NULL, 'The Brimstone'),
(NULL, 'The Broken Chaos'),
(NULL, 'The Brood of Unknown'),
(NULL, 'The Burning Dog Firewall'),
(NULL, 'The Cabal'),
(NULL, 'The Cake Gankers'),
(NULL, 'The Cannabuddies'),
(NULL, 'The Circle of Shadow'),
(NULL, 'The Clan Blackwatch Few'),
(NULL, 'The Clan Cats'),
(NULL, 'The Clan Knights'),
(NULL, 'The Clean Combinations'),
(NULL, 'The Clean Up Guard'),
(NULL, 'The Council of Dark'),
(NULL, 'The Covenant'),
(NULL, 'The Crimson Guild'),
(NULL, 'The Crimson Marbock'),
(NULL, 'The Crusaders of Horde'),
(NULL, 'The Crusaders of Seksoni'),
(NULL, 'The Cult of Clan Brigade'),
(NULL, 'The Cult of the Pink'),
(NULL, 'The Daggers of the Vile'),
(NULL, 'The Dark'),
(NULL, 'The Dark Dogs'),
(NULL, 'The Dark Pain'),
(NULL, 'The Darkfall'),
(NULL, 'The Darkside Vanguard'),
(NULL, 'The Darkside of Initium'),
(NULL, 'The Daughters of the Elite'),
(NULL, 'The Daytripper'),
(NULL, 'The Deadfriends'),
(NULL, 'The Defiant'),
(NULL, 'The Dont Overwhelming'),
(NULL, 'The Doom Pasta'),
(NULL, 'The Dragon Redeye'),
(NULL, 'The Dragons Flame'),
(NULL, 'The Dreadlords'),
(NULL, 'The Dublainn Crown'),
(NULL, 'The Durban Protecters'),
(NULL, 'The Echoes of Goldshire'),
(NULL, 'The Elit of Dark Elune'),
(NULL, 'The Emissaries of Furiou'),
(NULL, 'The Eternal Chaos'),
(NULL, 'The Eternus'),
(NULL, 'The Exiie'),
(NULL, 'The Expendable Shadow'),
(NULL, 'The Faith of Desert'),
(NULL, 'The Family Misfits'),
(NULL, 'The Fere Darkness'),
(NULL, 'The Final Tears'),
(NULL, 'The Forsaken Boochies'),
(NULL, 'The Gates of the Bloody'),
(NULL, 'The Gnomes Lordaero'),
(NULL, 'The Gods of Blackscar'),
(NULL, 'The Gods of Twilight'),
(NULL, 'The Gold Fighters'),
(NULL, 'The Guardian Thieves'),
(NULL, 'The Guardians of Gnome'),
(NULL, 'The Hands of Redridge'),
(NULL, 'The Hawk'),
(NULL, 'The Hearts Images'),
(NULL, 'The Hellborn Die'),
(NULL, 'The Heroes Plague'),
(NULL, 'The Horde Farmer'),
(NULL, 'The Horde Honor'),
(NULL, 'The Hotpocket'),
(NULL, 'The Ignis Prophecy'),
(NULL, 'The Illuminatie'),
(NULL, 'The Immortal League'),
(NULL, 'The Independant'),
(NULL, 'The Infragilis Legion'),
(NULL, 'The Jag'),
(NULL, 'The Jookmaster'),
(NULL, 'The Kataclysm'),
(NULL, 'The Knight'),
(NULL, 'The Knightelf'),
(NULL, 'The Knights Thorn'),
(NULL, 'The Knights of Gods Fury'),
(NULL, 'The Knights of Lost Peon'),
(NULL, 'The Knights of Mortal'),
(NULL, 'The Knights of Samurai'),
(NULL, 'The Kobra'),
(NULL, 'The Leaders of Evil'),
(NULL, 'The Leaders of Life'),
(NULL, 'The League of Red Knight'),
(NULL, 'The Legacy Meathooks'),
(NULL, 'The Legion of the Blue'),
(NULL, 'The Legion of Death'),
(NULL, 'The Lemmings of Flaming'),
(NULL, 'The Let Blood Gamer'),
(NULL, 'The Light'),
(NULL, 'The Little Hunters'),
(NULL, 'The Lords of Vae Knight'),
(NULL, 'The Mercenaries'),
(NULL, 'The Midieval Vanguard'),
(NULL, 'The Might of Dark Tong'),
(NULL, 'The Mithril Justice'),
(NULL, 'The Mithril Pepsi'),
(NULL, 'The Mjollnir'),
(NULL, 'The Moo Licht'),
(NULL, 'The Morgantis'),
(NULL, 'The Mulletmen'),
(NULL, 'The Necrontyr of Eternal'),
(NULL, 'The Nedrage Kills'),
(NULL, 'The Night'),
(NULL, 'The Nightfall'),
(NULL, 'The Ninja Heroes'),
(NULL, 'The Order of Gold'),
(NULL, 'The Order of Warcraft'),
(NULL, 'The Order of Warsong'),
(NULL, 'The Over Louder'),
(NULL, 'The Overlord'),
(NULL, 'The Pants'),
(NULL, 'The Pie'),
(NULL, 'The Pretectors'),
(NULL, 'The Project Disease'),
(NULL, 'The Psychotics'),
(NULL, 'The Puggers'),
(NULL, 'The Pyreborne'),
(NULL, 'The Queen of Meow'),
(NULL, 'The Red Hood Thunder'),
(NULL, 'The Reign of Uber Enigma'),
(NULL, 'The Resurrection'),
(NULL, 'The Ring of Honor'),
(NULL, 'The Ropetown'),
(NULL, 'The Royal Militia Blanco'),
(NULL, 'The Samurai Banda'),
(NULL, 'The Sanity'),
(NULL, 'The Sauce'),
(NULL, 'The Schoolyard Reapers'),
(NULL, 'The Secrets of Hehog'),
(NULL, 'The Seers'),
(NULL, 'The Servants of Cyclone'),
(NULL, 'The Seven'),
(NULL, 'The Shadow Gate'),
(NULL, 'The Shadow Misfits'),
(NULL, 'The Shadow of Ninja Pain'),
(NULL, 'The Shadowborn'),
(NULL, 'The Shizam'),
(NULL, 'The Shockers'),
(NULL, 'The Shriek of Nightmare'),
(NULL, 'The Silent Grunts'),
(NULL, 'The Silent Legion'),
(NULL, 'The Skunkdesigns'),
(NULL, 'The Sorrow'),
(NULL, 'The Souls of Azeroth Old'),
(NULL, 'The Spazler'),
(NULL, 'The Squirrels'),
(NULL, 'The Stringville'),
(NULL, 'The Stronghold of Reds'),
(NULL, 'The Tha Handlers'),
(NULL, 'The Thieves of Moral'),
(NULL, 'The Thorium Claw'),
(NULL, 'The Thread'),
(NULL, 'The Thule'),
(NULL, 'The Thunderslayers'),
(NULL, 'The True Wow'),
(NULL, 'The Trusted Minions'),
(NULL, 'The Twilight Rangers'),
(NULL, 'The Tyraels Aggression'),
(NULL, 'The Ultimates'),
(NULL, 'The Unforgiven Heresy'),
(NULL, 'The Unholy Bards'),
(NULL, 'The Unsung Efficiency'),
(NULL, 'The Valley of the Demon'),
(NULL, 'The Valor'),
(NULL, 'The Violent Chaos'),
(NULL, 'The Virus Eternal'),
(NULL, 'The War'),
(NULL, 'The Warsong Gnomeregan'),
(NULL, 'The Westcoast'),
(NULL, 'The Wicked'),
(NULL, 'The Will of Chronicles'),
(NULL, 'The Windsword Nightmare'),
(NULL, 'The Wings of Oxy Claw'),
(NULL, 'The Wrath of Elton'),
(NULL, 'The Wut'),
(NULL, 'The Yoricks Assassins'),
(NULL, 'The Zeksonic Thieves'),
(NULL, 'Theramore Azeroth'),
(NULL, 'Thirstquencher Chaos'),
(NULL, 'Thralls Caribous'),
(NULL, 'Three Alive'),
(NULL, 'Titans of Blood Sun'),
(NULL, 'Torvus Dragons'),
(NULL, 'Tower of the Little'),
(NULL, 'True Team'),
(NULL, 'Tul Inc'),
(NULL, 'Twinks of Cold Club'),
(NULL, 'Twinks of Hidden Venture'),
(NULL, 'Ultimate Rules'),
(NULL, 'Undead Kingdom'),
(NULL, 'Unforgiven Destiny'),
(NULL, 'Unguilded War'),
(NULL, 'Unholy Cats'),
(NULL, 'Unholy Teeth'),
(NULL, 'Union of Burning Prz'),
(NULL, 'Unusual Guard'),
(NULL, 'Valiant Riderz'),
(NULL, 'Vanguard Omen'),
(NULL, 'Vanguard Redeemers'),
(NULL, 'Vanguard of Teutonic'),
(NULL, 'Vengeful Mayhem'),
(NULL, 'Verata Blackflame'),
(NULL, 'Vicious Renegade'),
(NULL, 'Vile Dead'),
(NULL, 'Voodoo Hearth'),
(NULL, 'War Legion'),
(NULL, 'Warlockian Tree'),
(NULL, 'Warlords of Kungfu Army'),
(NULL, 'Warriors of Happy Death'),
(NULL, 'Warriors of the Tundra'),
(NULL, 'Warsong Insanity'),
(NULL, 'Waste of Grey Death'),
(NULL, 'Wayfarers of Maple Leaf'),
(NULL, 'Wayward Agenda'),
(NULL, 'Web of Forgoten Warfare'),
(NULL, 'Wet Guard'),
(NULL, 'Wild Fire'),
(NULL, 'Will of the Forgotten'),
(NULL, 'Winds of Steve Irwin'),
(NULL, 'Wings of Emerald Minions'),
(NULL, 'Wintermane Good'),
(NULL, 'Witchhunters of Chaos'),
(NULL, 'With Sea'),
(NULL, 'Wrath of the Horde Troop'),
(NULL, 'Wtf Losers'),
(NULL, 'Xcalibur of Shogunz Depo'),
(NULL, 'Xelium Determination');

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;


