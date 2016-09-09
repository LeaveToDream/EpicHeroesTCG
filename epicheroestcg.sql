-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 26 Août 2016 à 11:15
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `epicheroestcg`
--

-- --------------------------------------------------------

--
-- Structure de la table `atk`
--

CREATE TABLE `atk` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_ico` varchar(255) NOT NULL DEFAULT '0',
  `effect` text NOT NULL,
  `effect_legacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `atk`
--

INSERT INTO `atk` (`id`, `name`, `id_ico`, `effect`, `effect_legacy`) VALUES
(-1, 'None', '0', 'None', 'None'),
(0, 'Unknow', '0', 'Unknow', 'Unknow'),
(1, 'Shoot', '0', '', 'A physical attack that hits one target.'),
(2, 'Shadow Bolt', '0', '', 'A magical attack that hits one target.'),
(3, 'Icebolt', '0', '', 'A magical attack that hits one target.'),
(4, 'Fireball', '0', '', 'A magical attack that hits one target.'),
(5, 'Deformeter', '0', '', 'A magical attack that makes one target become a sheep.'),
(6, 'Lighting bolt', '0', '', 'A magical attack that hits one target.'),
(7, 'Chain Lightning', '0', '', 'A magical attack that hits three random targets.'),
(8, 'Heal', '0', '', 'Heals one ally for a small amount of HP.'),
(9, 'Attack', '0', '', 'A physical attack that hits one target.'),
(10, 'Wind Fenzy', '0', '', 'Cause spell damage to two random targets.'),
(11, 'Orb of Wrath', '0', '', 'A magical attack that hits one target.'),
(12, 'Magic Blast', '0', '', 'A magical attack that hits targets in the front row.'),
(13, 'Divine Strike', '0', '', 'A magical attack that hits a random target and reduces their attack by 10%.'),
(14, 'Smite', '0', '', 'A magical attack that hits one target.'),
(15, '', '0', '', ''),
(16, '', '0', '', ''),
(17, '', '0', '', ''),
(18, '', '0', '', ''),
(19, '', '0', '', ''),
(20, '', '0', '', ''),
(21, '', '0', '', ''),
(22, '', '0', '', ''),
(23, '', '0', '', ''),
(24, '', '0', '', ''),
(25, '', '0', '', ''),
(26, '', '0', '', ''),
(27, '', '0', '', ''),
(28, '', '0', '', ''),
(29, '', '0', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`id`, `name_en`, `name_fr`, `desc`) VALUES
(1, 'Hunter', 'Chasseur', ''),
(2, 'Warlock', 'Demoniste', ''),
(3, 'Mage', 'Mage', ''),
(4, 'Shaman', 'Shaman', ''),
(5, 'Rogue', 'Voleur', ''),
(6, 'Warrior', 'Guerrier', ''),
(7, 'Druid', 'Druide', ''),
(8, 'Paladin', 'Paladin', ''),
(9, 'Priest', 'Pretre', ''),
(10, 'Boss', 'Boss', '');

-- --------------------------------------------------------

--
-- Structure de la table `classe_preset`
--

CREATE TABLE `classe_preset` (
  `id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT 'type[1,2,3]=[heal,tank,dd]',
  `damage_type` int(11) NOT NULL,
  `atk_id` int(11) NOT NULL,
  `spell_name` varchar(255) NOT NULL,
  `spell_effect` text NOT NULL,
  `spell_effect_legacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `classe_preset`
--

INSERT INTO `classe_preset` (`id`, `classe_id`, `type`, `damage_type`, `atk_id`, `spell_name`, `spell_effect`, `spell_effect_legacy`) VALUES
(10, 1, 3, 2, 1, 'Scatter', '', 'A physical attack that hits targets in the back row and reduces the treatments effects.'),
(11, 1, 3, 2, 1, 'Aiming Shot', '', 'A physical attack that hits two random targets.'),
(12, 1, 3, 2, 1, 'Serpent Sting', '', 'A physical attack that hits all targets and reduces treatment effects.'),
(20, 2, 3, 1, 2, 'Life Siphon', '', 'A powerful magical attack that hits one target and absorb HP.'),
(21, 2, 3, 1, 2, 'Flame Nova', '', 'A magical attack that hits targets in the backrow.'),
(30, 3, 3, 1, 3, 'Ice Cone', '', 'A magical attack that hits targets in column.'),
(31, 3, 3, 1, 3, 'Arcane Explosion', '', 'A magical attack that hits targets in the front row.'),
(32, 3, 3, 1, 3, 'Blizzard', '', 'A magical attack that hits all targets.'),
(33, 3, 3, 1, 4, 'Pyroblast', '', 'A powerful magical attack that hits one target.'),
(34, 3, 3, 1, 5, 'Mass Polymorph', '', 'A magical attack against group of targets with chance to turn them into sheep and reduce their defence.'),
(40, 4, 3, 1, 6, 'Chain Lightning', '', 'A magical attack that hits three random targets.'),
(41, 4, 3, 4, 7, 'Revive', '', 'Revives itself with some amount of HP once in a round.'),
(42, 4, 1, 3, 8, 'Healing Chain', '', 'Heal three teammates for a small amount of HP.'),
(50, 5, 3, 2, 9, 'Backstab', '', 'A powerful physical attack that hits one target.'),
(51, 5, 3, 2, 9, 'Bleed', '', 'Bleed, a substantial increase in skill damage by warrior.'),
(60, 6, 2, 2, 9, 'Smash', '', 'A powerful physical attack that hits one target.'),
(61, 6, 3, 2, 9, 'Whirlwind', '', 'A physical attack that hits targets in the front row.'),
(62, 6, 3, 2, 9, 'Execute', '', 'A powerful physical attack that hits weakest target.'),
(63, 6, 2, 2, 9, 'Shield Wall', '', 'Significantly improves resistance.'),
(70, 7, 1, 3, 8, 'Resurrection', '', 'Revives a teammate with some amount of HP once in a round.'),
(80, 8, 1, 3, 8, 'Holy Light', '', 'Heal one teammate for a moderate amount of HP.'),
(81, 8, 1, 4, 8, 'Crusader Strike', '', 'A magical attack that hits three random targets.'),
(82, 8, 1, 3, 8, 'Light Asylum', '', 'Recover all allies\' HP when the hero with highest HP is injured.   '),
(83, 8, 3, 1, 9, 'Divine Storm', '', 'A magical attack that hits all targets and have chances to cause dizziness.'),
(90, 9, 1, 3, 8, 'Healing Prayers', '', 'Heal all teammates with a tiny amount of HP.'),
(91, 9, 1, 3, 8, 'Restoration', '', 'Keep recovering HP for three teammates and enhance other treatments.');

-- --------------------------------------------------------

--
-- Structure de la table `deck`
--

CREATE TABLE `deck` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `deck_member`
--

CREATE TABLE `deck_member` (
  `id` int(11) NOT NULL COMMENT 'Useless, only for phpmyadmin',
  `id_deck` int(11) NOT NULL,
  `id_hero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bonus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `group_member`
--

CREATE TABLE `group_member` (
  `id` int(11) NOT NULL COMMENT 'Useless, only for phpmyadmin',
  `id_group` int(11) NOT NULL,
  `id_hero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hero`
--

CREATE TABLE `hero` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `preset_id` int(11) NOT NULL DEFAULT '0',
  `balance` mediumint(4) NOT NULL DEFAULT '0',
  `quote` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `hero`
--

INSERT INTO `hero` (`id`, `name`, `classe_id`, `preset_id`, `balance`, `quote`) VALUES
(1, 'MT', 6, 60, 0, 'MT is a little taurus that is greedy and loves the ladies. He\'s also a little stupid but won\'t let that stop him from being the best tank ever.'),
(2, 'Shaman', 4, 40, 0, 'Shaman is a powerful little taurus who is always right and let little things annoy her. She as a crush on MT although he hasn\'t noticed yet. '),
(3, 'Rogue', 5, 50, 0, 'He is a young Orc, honest and very loyal, stutters a bit, often get bullied by Shaman and Hunter, even thought he could probably beat them up.'),
(4, 'Hunter', 1, 10, 0, 'Hunter is a young troll. He is very handsome but a little arrogant. Unfortunately his IQ is low and he always has his beloved pet pig in tow. '),
(5, 'Druid', 7, 70, 0, 'An unscrupulous money spender who wonders why she always no money. The brain of the group.'),
(6, 'Mage', 3, 30, 0, 'The type that doesn\'t offend people and doesn\'t get offended by people, always in the right position at the right time.'),
(7, 'Priest', 9, 90, 0, 'Priest is honest, pure, and a natural born healer. She a soft spot for MT, so will follow him anywhere.'),
(8, 'Warlock', 2, 20, 0, 'A female Orc that looks simple on the surface, but is wild at heart. She is easily influenced and has a terrible sense of direction.'),
(9, 'Beauty', 1, 11, 0, 'Speaks straight for Barrier, often hurts other people\'s confidence, because she is brutally honest.'),
(10, 'Thief', 5, 50, 0, 'Surprisingly strong. Proficient in all thing that require a weapon.'),
(11, 'Barrel Bull', 6, 60, 0, 'A little introverted Taurus warrior, his to become a genuine warrior.'),
(12, 'Blood Elf Mage', 3, 31, 0, 'She is dangerous as she is beautiful. No one has asked her about her camel toe and lived.'),
(13, 'Lady', 8, 80, 0, 'Lady is quite arrogant. She hates to argue because she expects everything to go her way.'),
(14, 'Tyran', 6, 61, 0, 'Lady\'s servant and MT\'s old enemy, every time they meet they fight.'),
(15, 'Brick', 3, 32, 0, 'Lady\'s servant and advisor. Brick does the housework and cooks the meal.'),
(16, 'The Bald Man', 6, 61, 0, 'He is bald and looks lonely, this isn\'t how he envisioned his life when he was younger.'),
(17, 'The President', 6, 61, 0, 'President is Lady\'s elder brother. A master at PVP but not so much at PVE.'),
(18, 'Female Druid', 7, 70, 0, 'Very mysterious, the female druid is the least known member of the guild '),
(19, 'Elder Sister', 8, 81, 0, 'Lady\'s elder sister. An expert in mystery and once faked her own death. She likes to keep to herself'),
(20, 'Canon Lady', 4, 41, 0, 'Shaman\'s master. She is strong, confident and a PVP fanatic.'),
(21, 'Fire Captain', 3, 33, 0, 'Leader of the fire brigade, and a bit of an idiot. It is not clear if Fire Captain is a he or a she.'),
(22, 'Fire Member A', 3, 33, 0, 'A beautiful girl in the idiotic fire brigade.'),
(23, 'Fire Member B', 3, 33, 0, 'A second other girl in the idiotic fire brigade.'),
(24, 'Fire Member C', 3, 33, 0, 'Another girl in the idiotic fire brigade.'),
(25, 'Fire Member D', 3, 33, 0, 'A third other girl in the idiotic fire brigade.'),
(26, 'Shame', 3, 34, 0, 'One of the four shadows. Beautiful but fiercely competitive. This mage believes she is destined to be the most powerful.'),
(27, 'Envy', 9, 91, 0, 'One of the four shadows. An introvert night elf, but extraordinarily strong of will.'),
(28, 'Lust', 6, 62, 0, 'One of the four shadows. The leader that is ever lusting for power over all.'),
(29, 'Allure', 5, 51, 0, 'One of the four shadows. Cool and calm when facing a target, doesn\'t like to be called baldy.'),
(30, 'Miss', 4, 42, 0, 'Single and looking to mingle.'),
(31, 'Comrade', 2, 21, 0, 'MT congregation protagonist junior partner, silently in the background to support them.'),
(32, 'Feral Druid Helper', 8, 82, 0, 'Looks a little stupid but is actually quite intelligent, you have been warmed.'),
(33, 'Old Lover', 8, 83, 0, 'Old lover of Lady in the union, advanced knight in the tall and mighty shape.'),
(34, 'Winter', 1, 12, 0, 'President\'s and the four shadow\'s mentor. Very few can boast of higher skill.'),
(35, 'Apprentice', 6, 63, 0, 'Thoughtful and quietly spoken. Don\'t let his calm demeanour fool you thought, call him a space goat and you will know his fury.   '),
(100, 'Deamon Walker', 10, 0, 0, 'A little bit angry after being locked up for 10 000 year. Treat carefully around him. '),
(101, 'Blade Master', 10, 0, 0, 'Never leaves home without his axe.'),
(102, 'Light Bringer', 10, 0, 0, 'Devoted to all things light. Also has a pet sloth.'),
(103, 'Death Knight', 10, 0, 0, 'His father adviced him to rule with wisdow and pride. Did not guess it would be over thousand of undead slaves.'),
(104, 'Light Ranger', 10, 0, 0, 'One of the best ranger of the world, protecting her land with pride. She lost her sister in the battle against the Lich King.'),
(105, 'Death Stalker', 10, 0, 0, 'One of the best ranger of the world, protecting her kingdom with ferocity. She lost her sister and her soul in the battle against the Lich King, but won a nation to rule.'),
(106, 'Soul Trader', 10, 0, 0, 'The great warlock that opened the portal between world of human and orcs. He is surprisingly tall when standing still.'),
(107, 'Dwarf King', 10, 0, 0, 'One of the 3 dwarf king, which finally found an agreement with the other two. Super efficient in things of dwarf live : in politic, fighting and drinking. '),
(110, 'Malygos', 11, 0, 0, 'A big blue dragon. Magicka expert.'),
(111, 'Nozdurnu', 11, 0, 0, 'A big yellow dragon. The time keeper.'),
(112, 'Alextrasa', 11, 0, 0, 'A big red dragon. Protector of every type of life. Except yours sometimes.'),
(113, 'Neltharion', 11, 0, 0, 'A big black dragon. Keep the continent in the right place. Sometimes.'),
(114, 'Gruul', 11, 0, 0, 'A powerful cyclops, which enjoys destruction. The last gnome with google who cross his way yelled "STRENGH OVER NINE THOUSAND" and have never been seen since.'),
(115, 'Purple Fel Reaver', 11, 0, 0, 'The purple color of the fel running through the mechanical veins of this monstrosity is the result of powerful warlock experimentation.'),
(116, 'Fel Reaver', 11, 0, 0, 'The light green color of the fel running through the mechanical veins of this monstrosity is the sign of high concentration of energy. '),
(117, 'Fel Gardian', 11, 0, 0, 'This fel powered monstrosity keeps his master place safe, yielding cursed weapon from demoniac dimension.');

-- --------------------------------------------------------

--
-- Structure de la table `hero_spe`
--

CREATE TABLE `hero_spe` (
  `id` int(11) NOT NULL,
  `hero_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` mediumint(4) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `damage_type` tinyint(1) NOT NULL DEFAULT '0',
  `atk_id` tinyint(1) NOT NULL DEFAULT '0',
  `spell_name` varchar(255) NOT NULL,
  `spell_effect` text NOT NULL,
  `spell_effect_legacy` text NOT NULL,
  `weapon_effect` text NOT NULL,
  `talent_1_legacy` text NOT NULL,
  `talent_2_legacy` text NOT NULL,
  `talent_3_legacy` text NOT NULL,
  `talent_e_legacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `hero_spe`
--

INSERT INTO `hero_spe` (`id`, `hero_id`, `name`, `balance`, `type`, `damage_type`, `atk_id`, `spell_name`, `spell_effect`, `spell_effect_legacy`, `weapon_effect`, `talent_1_legacy`, `talent_2_legacy`, `talent_3_legacy`, `talent_e_legacy`) VALUES
(1, 1, 'Protection', 0, 2, 2, 9, 'Shield Wall', '', 'MT shields allies in the back row. The shield absorbs damages and transfers a fraction of these damages to MT.', '', 'Barrier - 20% chances after being attacked to reduce all damages by 50% for one round.', 'Physical Defense - increases physical defense by 20%', 'Invincible - at the start of battle, MT is immune to damage for one round. Can still be affected by control effect.', 'Weapon - Increase toughness by 10%.'),
(2, 1, 'Arms', 0, 3, 2, 9, 'Thunderclap', '', 'A physical attack that hit all enemies and has a 50% chance to delay their initiative skill by one round ', '', 'Stiffle - 10% chance of counter attacking an enemy after being hit by a normal skill.', 'Precision - increases hit by 10%.', 'Deadly blades - increases physical penetration by 2000.', 'Weapon - Increases physical penetration by 1,000.'),
(3, 1, 'Fury', 0, 3, 2, 9, 'Whirlwind', '', 'A physical attack that causes huge damages to all enemies.', '', 'Sword - 50% to attack again after a critical hit.', 'Blood Lust - increase crit by 10%.', 'Frenzy - increase physical damage by 10%.', 'Weapon - Increase crit by 5%.'),
(4, 2, 'Elemental', 0, 3, 1, 6, 'Chain Lightning', '', 'A magical attacks that hit three random targets', '', 'Hex - a critical hit has a 20% chance to stun the target hit for one round.', 'Magical Attack - increase magical damage by 10%.', 'Blood Lust - increase crit by 10%.', 'Ring - increase crit by 10%.\r\nWeapon - increase crit damage by 15%.'),
(7, 2, 'Enhancement', 0, 3, 1, 10, 'Unleashed Rage', '', 'A magical attack that stuns 1 target with damage.', '', 'Dodge - Increases attack by 100 after a dodge for 1 round.', 'Precision - Increases hit by 5%', 'Bloodlust - Increases crit by 5%', 'Ring - Increases hit, crit & dodge by 5%\r\nWeapon - Increases dodge by 5%'),
(8, 2, 'Restoration', 0, 1, 3, 8, 'Healing Burst', '', 'Heal 3 allies for a medium amount of HPs.', '', 'Reincarnation - Upon death, Shaman has a 5% chance of resurrecting with 100% HP ', 'Heal - Increases healing by 10%', 'Mind & Body - Increases injury free by 1,000', 'Ring - Increases crit by 10%\r\nWeapon - 1% chance every round of healing a massive amount of HP to one ally.'),
(9, 3, 'Outlaw', 0, 3, 2, 9, '?', '', '', '', '', '', '', ''),
(10, 3, 'Assassination', 0, 3, 2, 9, '?', '', '', '', '', '', '', ''),
(11, 3, 'Subtlety', 0, 3, 2, 9, '?', '', '', '', '', '', '', ''),
(12, 4, 'Survival', 0, 3, 2, 1, 'Distracting Shot', '', 'A physical attack that hits all enemies for a small amount of HP and reduces their hit %.', '', 'Bogged Down - Any foe that attacks Hunter have a 20% chance to reduce their own hit chance by 30%. Lasts 3 rounds Can be triggered once only each round.', 'Dodge 1 - Increases dodge by 5%.', 'Dodge 2 - Increases dodge by 5%.', 'Ring - Increases dodge by 10%.\r\nWeapon - Hunter heals for 50% of his HP after he dodges an attack.'),
(13, 4, 'Beast Master', 0, 3, 2, 1, 'Multishot', '', 'A physical attack that hits all enemies in the back row.', '', 'Initiative Weakness - When a round starts, there is a 30% chance to the back row\'s Physical Defence and Toughness by 20%.', 'Life - Increases HP by 2,000.', 'Attack - Increases attack by 1,000.', 'Ring - Increases crit by 10%\r\nWeapon - Initiative Weakness talent now lasts two rounds.'),
(14, 4, 'Marksman', 0, 3, 2, 1, 'Aimed Shot', '', 'A physical attack that causes massive damage to a single target.', '', 'Sneaky Shot - Hunter has a 10% chance after an attack to attack a second time on a random target.', 'Bloodlust - Increases crit by 5%.', 'Stormstrike - Increases crit damage by 10%.', 'Ring - Increases hit by 10%\r\nWeapon - Hunter increases crit and crit damage by 20% after he crits a target, lasts 1 round'),
(15, 5, 'Restoration', 0, 1, 3, 8, 'Ressurection', '', 'Ressurects 1 ally with small amount of HP every 5 rounds.', '', 'Rejuvenation - Places a Heal Over Time on ressurected ally that lasts 2 rounds', 'Resilience - Increases toughness by 10%.\r\n', 'Attack - Increase attack by 2,000.', 'Weapon - Increase Rejuvenation\'s HOT to 3 rounds and healing an extra 50%.'),
(16, 5, 'Balance', 0, 3, 2, 11, 'Moonfire', '', 'A huge magical attack on a single target.', '', 'Wrath - Moonfire applies a Damage Ober Time effect that deals 50% attack damage to target for 2 rounds.', 'Magical Damage - Magic DMG +10%', 'Attack - Increases attack by 2,000.', 'Weapon - Wrath Talent increased to 100% attack damage.'),
(17, 5, 'Feral', 0, 3, 4, 9, 'Sprite Fire', '', 'Reduces single target\'s toughness by a huge amount for 2 rounds.', '', 'Smash - 50% chance on critical strike to Smash the target for a massive amount of damage.', 'Precision - Increase hit by 10%', 'Bloodlust - Increase crit by 10%.', 'Weapon - Increase crit damage by 30%'),
(18, 6, 'Frost', 0, 3, 1, 0, '?', '', '', '', '', '', '', ''),
(19, 6, 'Fire', 0, 3, 1, 0, '?', '', '', '', '', '', '', ''),
(20, 6, 'Arcane', 0, 3, 1, 0, '?', '', '', '', '', '', '', ''),
(21, 7, 'Holy', 0, 1, 3, 8, 'Greater Heal', '', 'Heals all allies for a huge amount of HP.', '', 'Desperate Prayer - Upon death, Priest heals all remaining allies for a huge amount of HP', 'Heal - Increase healing by 10%.', 'Magical Defense - Increase magical defense by 10%.', 'Weapon - Increase healing done by 5%.'),
(22, 7, 'Discipline', 0, 1, 0, 8, 'Shield of Protection', '', 'Priest shields the lowest HP ally, healing them and reducing the damage they take', '', 'Soul Swap - At the start of each round, if Priest\'s HPs are lower than 20%, she as a 5% chance to swap HP with a random enemy.', 'Resilience - Increase toughness by 10%.', 'Magical Defense - Increase defense by 10%.', 'Weapon - Increase toughness by 5%.'),
(23, 7, 'Shadow', 0, 3, 4, -1, 'Soul Curse', '', 'Priest curses a random enemy that the damage ignores it\'s resistances for 3 rounds.', '', 'Decrepit - 50% chance, at the start of each round, to lower all enemies HP by 5% for 3 rounds.', 'Attack - Increases attack by 2,000.', 'Magical Defense - Increases magical defense by 10%.', 'Weapon - Increases injury free by 1,000.'),
(24, 8, 'Demonology', 0, 3, 1, 2, 'Siphon Life', '', 'Single target magical attack that steals HP', '', 'Demonic Fury - At the start of each round, if Warlock\'s HP are below 50%, her attack will increase by 30% for 3 rounds. Can only trigger once every 3 rounds.', 'Magical Damage - increases magic damage by 10%', 'Dark Soul - When Warlock is brought below 50% HP, her Magical Defense increases by 20% for 2 rounds. Can only trigger once every 3 rounds.', 'Ring - Increases injury free by 10,000.\nWeapon - Enable Siphon Life to also reduces enemies\' Magic Defense by 10% for 2 rounds.'),
(25, 8, 'Destruction', 0, 3, 1, 2, 'Hellstorm', '', 'Magical attack that hits 4 random targets. ', '', 'Agony I - At the start of round, if Warlock\'s HP are bellow 80%, Warlock\'s attack increases by a small amount.', 'Agony II - At the start of round, if Warlock\'s HP are bellow 60%, Warlock\'s attack increases by a moderate amount.', 'Agony III - At the start of round, if Warlock\'s HP are bellow 40, Warlock\'s attack increases by a huge amount.', 'Ring - Increase attack by 2,000.\nWeapon - Restore HP whenever casting Hellstorm'),
(26, 8, 'Affliction', 0, 3, 1, 2, 'Curse of Corruption', '', 'Increases all enemies physical damage taken by 20%. Last 3 rounds.', '', 'Haunt I - When Warlock takes magical damage, she reduces target enemy\'s attack by 30% for 3 rounds. Can trigger once every 5 rounds. Does not work on boss.', 'Haunt II - At the start of every 3rd round, Warlock reduces all enemies attack for a small amount. Effect can stack.', 'Haunt III - At the start of the 2nd round, Warlock increases all enemies physical damage taken by 10%. Can trigger every 3 rounds.', 'Ring - Increase toughness by 20%\r\nWeapon - When killed reduces the effect of healing done to the enemy who has the highest maximum HP by 80%. Does not affect continuous healing effects.'),
(27, 9, '?', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(28, 9, '?', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(29, 9, '?', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(30, 10, 'Combat', 0, 3, 2, 9, 'Ambush', '', 'A physical attack that causes massive damage to a single target.', '', 'Eviscerate - Trigger Ambush after killing an enemy. Can be triggered once each round a most', 'Precision - Increase hit by 10%.', 'Bloodlust - Increase crit by 5%.', 'Weapon - Increase crit damage by 20%.'),
(31, 10, 'Assassination', 0, 3, 2, 9, 'Assassinate', '', 'A physical attack that causes huge damage to the back row.', '', 'Assassinate has a 30% chance to stun targets for 1 round.', 'Precision - Increase hit by 10%.', 'Dodge - Increase dodge by 10%.', 'Weapon - 50% chance to trigger Assassinate after a dodge. Can be triggered once each round at most.'),
(32, 10, 'Subtlety', 0, 3, 2, 9, 'Blade Dance', '', 'A physical attack hitting 2 random targets that applies a bleed twice which ignores resistances', '', 'Trick of the Trade - Blade Dance hits 1 extra target.', 'Attack - Increases attack by 1,500.', 'Precision - Increases hit by 10%.', 'Weapon - Blade Dance\'s bleed lasts 3 rounds.'),
(33, 11, 'Protection', 0, 2, 2, 0, '?', '', '', '', '', '', '', ''),
(34, 11, 'Arms', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(35, 11, 'Fury', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(36, 12, 'Arcane', 0, 3, 1, 12, 'Arcane Blast', '', 'Massive single target magical attack that reduces target\'s magical defense by 30%. Last 2 rounds.', '', 'Invisibility - BEM goes invisible for 3 rounds when her HP reach less than 20%. While Invisible, she can\'t attack or be attacked, but regenerates 10% HP per round. Can only trigger once per battle.', 'Magical Defense - Increase magical defense by 10%.', 'Icy Floes - Increase magical penetration by 10%.', 'Weapon - 30% chance at the start of each round to increase back row ally\'s magical penetration by 20%. Lasts 2 rounds.'),
(37, 12, 'Frost', 0, 3, 1, 3, '?', '', '', '', '', '', '', ''),
(38, 12, 'Fire', 0, 3, 1, 4, 'Burning Anger', '', 'Magical attack that hits the back row.', '', 'Critical Mass - Burning Anger also reduces enemy\'s Attack damage by a small amount for 1 round. Does not work on any Boss.', 'Precision -  Increase hit by 10%.', 'Bloodlust - Increase crit by 10%.', 'Weapon - Burning Anger also reduces enemy\'s Attack damage by a small amout. Stack with Critical Mass Talent. Does not work on any Boss.'),
(39, 13, 'Holy', 0, 1, 3, 0, 'Holy Light', '', 'Heal 2 allies for a huge amount.', '', 'Beacon of Light - At the start of each round, Lady has a 5% chance to resurrect a fallen ally with 50% HP.', 'Stormstrike - Increase critical damage by 30%.', 'Heal - Increases healing by 30%.', 'Weapon - Increases healing by 20%.'),
(40, 13, 'Retribution', 0, 3, 1, 13, 'Avenging Wrath', '', 'A magickal attack that hits the front row and reduces their healing received by 20%. Last 2 rounds.', '', 'Exorcism - 50% chance after a critical strike to trigger Avenging Wrath again. Can trigger once each round at most.', 'Bloodlust - Increase crit by 10%.', 'Magical Damage- Increases magic damage by 10%.', 'Weapon - Increase Avenging Wrath\'s healing reduction to 35%. Does not apply to Exorcism\'s triggers.'),
(41, 13, 'Protection', 0, 2, 4, 13, 'Divine Bulwark', '', 'Applies a shield to allies that absorbs damage and heals everyone for a small amount of HP. Invalid for continuously bleeding.', '', 'Shining Protector - Increase the effect of shield by 30%.', 'Resilience - Increases toughness by 10%.', 'Magical Defense - Increases magical defense by 10%.', 'Weapon - Increases magical defense by 10%.'),
(42, 14, 'Gladiator', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(43, 14, 'Fury', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(44, 14, 'Arms', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(45, 15, 'Frost', 0, 3, 1, 3, 'Blizzard', '', 'A magical attack that hits all enemies 3 times', '', 'Ice Barrier - If Brick\'s HP is below 40%, he has a 20% chance of gaining an immunity shield for 1 round.', 'Magical Attack - Increases magical attack by 10%.', 'Bloodlust - Increase crit by 10%.', 'Weapon - Increase magic damage by 5%.'),
(46, 15, 'Fire', 0, 3, 1, 4, 'Meteor Shower', '', 'A magical attack that hits all enemies for massive damage.', '', 'Wrath - Meteor Shower put an effect on all targets that deal 10% damage each round. Last 2 rounds and does not trigger Ice Barrier, Desperate Prayer or similar talents.', 'Bloodlust - Increase crit by 10%.', 'Combustion - Increase crit damage by 20%.', 'Weapon - Increase hit by 5%.'),
(47, 15, 'Arcane', 0, 3, 1, 3, 'Arcane Missiles', '', 'A magical attack that hits 3 random targets.', '', 'Invincible - At the start of battle, Brick is immune to damage for 3 rounds. Can still be affected by controlling effects.', 'Arcane Penetration - Increase magical penetration by 2,000', 'Arcane Focus - Increase hit by 10%.', 'Weapon - Increase attack by 1,000.'),
(48, 16, 'Gladiator', 0, 3, 2, 9, '?', '', '', '', '', '', '', ''),
(49, 16, 'Arms', 0, 3, 2, 0, '?', '', '', '', '', '', '', ''),
(50, 16, 'Fury', 0, 3, 2, 9, '?', '', '', '', '', '', '', ''),
(51, 17, 'Arms', 0, 3, 2, 9, 'Crippling Strike', '', 'A physical attack that hits a vertical column and reduces the targets attack damage by huge amount. Last 1 round.', '', 'Opportunity Strikes - 20% chance for Crippling Strike to hit an extra target. Can trigger only once a round.', 'Bloodlust - Increase crit by 10%.', 'Precision - Increase hit by 10%.', 'Weapon - Increases physical damage by 10%.'),
(52, 17, 'Protection', 0, 2, 2, 9, 'Heroic Shout', '', 'Increase toughness of front row allies by a massive amount. Buff lasts until ally takes damages.', '', 'Protect the Weak - 5% chance, when attacked, to trigger Heroic Shout again. Can trigger once per round at most.', 'Physical Defense - Increase physical defense by 10%.', 'Resilience - Increases toughness by 10%.', 'Weapon - Increases HP by 10.000.'),
(53, 17, 'Fury', 0, 3, 2, 9, 'Titan\'s Grip', '', 'Massive single target physical attack.', '', 'Victory Rush - When President kills a target, he hits the back row for physical damage. Can trigger only once each round.', 'Bloodlust - Increase crit by 10%.', 'Physical Damage - Increase physical damage by 10%.', 'Weapon - Increase critical damage by 20%.'),
(54, 18, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(55, 18, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(56, 18, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(57, 19, 'Retribution', 0, 3, 1, 13, 'Divine Wrath', '', 'A magical attack that hits 3 random targets.', '', 'Sword - Increase the targets hit by Divine Wrath by 1-3.', '	 Magical Attack - Increases magical attack by 10%.', 'Bloodlust - Increase crit by 5%.', 'Weapon - Increase crit by 10%.'),
(58, 19, 'Holy', 0, 1, 3, 8, 'Holy Light', '', 'Heal 1 teammate for a huge amount of HP.', '', 'Initiative Heal - 50%, at the start of each round, to heal the lowest hp teammate for a moderate amount of hp.', '	 Heal - Increases healing by 30%.', 'Bloodlust - Increase crit by 10%.', 'Weapon - Holy Light has 10% chance to heal another teammate.'),
(59, 19, 'Protection', 0, 2, 4, 14, 'Divine Assistance', '', 'Shield the ally with the lowest life with a divine shield, making him immune to damage for 1 round.', '', 'Defensive Sidestep - When a hero is brought below 20% life, all allies take 10% less damage for one round. Can not stack.', 'Magical Defense - Increase magical defense by 10%.', 'Physical Defense - Increase physical defense by 10%.', 'Weapon - Increase toughness by 20%.'),
(60, 20, 'Enhancement', 0, 3, 1, 6, 'Maelstrom Weapon', '', 'Increase 3 random allies\' critical hit chance for a huge amount. Last 1 attack.', '', 'Stormstrike - Increase critical damage by 10,000.', 'Bloodlust - Increase crit by 10%.', 'Attack - Increases attack by 2,000.', 'Weapon - Launches 2 normal attacks each round.'),
(61, 20, 'Elemental', 0, 3, 1, -1, 'Thunderstorm', '', 'A magical attack that hits 4 random targets.', '', 'Reincarnation - Resurrect with 80% HP. Can resurrect once per battle. Does not resurrect when killed by talent attacks or bleeding effects.', 'Unleash - 20% chance to trigger stronger Thunderstorm after a critical hit. Can only trigger once per round.', 'Earth Shock - 20% chance to trigger stronger Thunderstorm after a dodge. Can only trigger once per round.', 'Weapon - Increases magical penetration by 2,000.'),
(62, 20, 'Restoration', 0, 1, 3, 8, 'Healing Wave', '', 'Heal 2 allies for a huge amount of HP.', '', 'Healing Rain - Healing wave leaves a Heal Over Time on 2 allies that heals a small amount of HP.', 'Heal - Increases healing by 20%.', 'Magical Defense - Increase magical defense by 10%.', 'Weapon - Healing wave has a 10% chance to trigger a second time. Does not apply Healing Rain on second Healing Wave.'),
(63, 21, 'Fire', 0, 3, 1, 4, 'Pyroblast', '', 'Massive single target magical attack.', '', 'Bloodlust - Increase crit by 10%.', 'Furious Flames - Pyroblast also reduces magical defense by 10%. Lasts 2 rounds.', 'Magical Defense - Increase magical defense by 10%.', 'Weapon - Pyroblast also has a 30% chance to Polymorph the target for 1 round. Does not work on any Boss.'),
(64, 21, 'Frost', 0, 3, 1, 3, 'Cone of Ice', '', 'Magical attack that hits the front row for a medium amount of damage.', '', 'Icy Floes - Increase magical penetration by 10%.', 'Precision - Increases hit by 10%.', 'Freeze - Cone of Ice has a 20% chance to freeze targets for 1 round. Stacks with Weapon effect.', 'Weapon - Cone of Ice has a 20% chance to freeze targets for 1 round. Stacks with Freeze effect.'),
(65, 21, 'Arcane', 0, 3, 1, 3, 'Polymorph', '', 'Polymorph 1 random enemy for 2 rounds. Hit chance of Polymorph increases with initiative skill levels. Does not work on boss.', '', 'Precision - Increases hit by 10%.', 'Mage Armor - Upon death, Fire Captain shields the lowest HP ally for a massive amount of damage.', 'Dual Casting - 5% chance after casting Polymorph to cast on a 2nd target.', 'Weapon - 5% chance after using normal skill to cast Polymorph which lasts 1 round and persists through damage.'),
(66, 22, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(67, 22, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(68, 22, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(69, 23, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(70, 23, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(71, 23, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(72, 24, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(73, 24, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(74, 24, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(75, 25, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(76, 25, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(77, 25, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(78, 26, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(79, 26, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(80, 26, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(81, 27, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(82, 28, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(83, 29, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(84, 29, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(85, 29, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(86, 30, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(87, 30, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(88, 30, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(89, 31, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(90, 31, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(91, 31, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(92, 32, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(93, 32, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(94, 32, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(95, 33, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(96, 33, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(97, 33, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(98, 34, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(99, 34, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(100, 34, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(101, 35, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(102, 35, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(103, 35, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(104, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(105, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(106, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(107, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(108, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(109, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(110, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(111, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(112, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(113, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(114, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(115, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(116, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(117, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(118, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(119, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(120, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(121, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(122, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(123, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(124, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(125, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(126, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(127, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(128, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(129, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(130, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(131, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(132, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(133, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(134, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(135, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(136, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(137, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(138, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(139, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(140, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(141, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(142, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(143, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(144, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(145, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(146, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(147, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(148, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(149, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(150, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(151, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(152, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(153, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(154, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(155, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(156, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(157, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(158, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(159, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(160, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(161, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(162, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(163, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(164, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(165, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(166, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(167, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(168, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(169, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(170, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(171, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(172, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(173, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(174, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(175, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(176, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(177, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', ''),
(178, 0, '?', 0, 0, 0, 0, '?', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `hero_weapon`
--

CREATE TABLE `hero_weapon` (
  `id` int(11) NOT NULL,
  `hero_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cat` varchar(255) NOT NULL DEFAULT 'weapon',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `hero_weapon`
--

INSERT INTO `hero_weapon` (`id`, `hero_id`, `name`, `cat`, `description`) VALUES
(1, 1, 'Hurricane Sword', 'sword', 'Cut the small life off from this world'),
(2, 2, 'Kelease Hammer', 'hammer', 'A fabulous Hammer casting by the blood of balrog, it was a great honor to own the Hammer.'),
(3, 3, 'Azure', 'dual dagger', 'To be traducted'),
(4, 4, 'Ripper Bow', 'bow', 'It can tear anything including your soul.'),
(5, 5, 'Energy Staff', 'staff', 'Yggdrasil has a mysterious power after washed by the Apple Lossless.'),
(6, 6, '?', 'staff', 'To be traducted'),
(7, 7, 'Life Staff', 'staff', 'Orlando\'s golden sceptre was created by the pure gold, Church\'s wealth was Evident.'),
(8, 8, 'Magebreaker Staff', 'staff', 'Magicka was annihilated here !'),
(9, 9, '?', 'bow', 'To be traducted'),
(10, 10, 'Perdition\'s Blade', 'dagger', 'No one can escape this Dagger.'),
(11, 11, '?', 'weapon', 'To be traducted'),
(12, 12, 'Edict of Argus', 'staff', 'I will rescue your soul if i have to cross the River Styx.'),
(13, 13, 'Hammer of Judgement', 'hammer', 'The gods\'radiance is hot enough to melt humans.'),
(14, 14, 'To be traducted', 'weapon', ''),
(15, 15, 'Magellan Staff', 'staff', 'Human\'s accomplishements in magic are not inferior to other races\', Magellan claimed to be the pearl among them.'),
(16, 16, '?', 'weapon', '?'),
(17, 17, 'Armageddon', 'sword', 'You lost as soon as you saw me!'),
(18, 18, '?', 'weapon', '?'),
(19, 19, '?', 'weapon', '?'),
(20, 20, 'Lavaforged Warhammer', 'hammer', 'Smash your brains and steal your soul.'),
(21, 21, 'Illumination', 'staff', 'The founder\'s strength originates from this weapon which has absorbed innumerable evil force.'),
(22, 22, '', 'weapon', ''),
(23, 23, '', 'weapon', ''),
(24, 24, '', 'weapon', ''),
(25, 25, '', 'weapon', ''),
(26, 26, '', 'weapon', ''),
(27, 27, '', 'weapon', ''),
(28, 28, '', 'weapon', ''),
(29, 29, '', 'weapon', ''),
(30, 30, '', 'weapon', ''),
(31, 31, '', 'weapon', ''),
(32, 32, '', 'weapon', ''),
(33, 33, '', 'weapon', ''),
(34, 34, 'Thori\'dal', 'bow', 'Gently pass by you like a breeze!'),
(35, 35, 'Cataclysm\'s Edge', 'sword', 'It seems as if there is a weapon called Dragonslayer'),
(100, 100, 'Warglaive', 'legendary dual-sided sword', 'Meet again after a long separation'),
(101, 101, 'Gorehowl', 'legendary axe', 'The roar from hell for the sake of blood!'),
(102, 102, 'Aurastone Hammer', 'legendary hammer', 'This weapon was used by its owner to scatter brightness when he was young.'),
(103, 103, 'Frostmourn', 'legendary sword', 'Whosoever takes up this blade shall wield eternal power. Just as the blade rends flesh, so must the power scar the spirit'),
(104, 104, 'Thas\'dorah', 'legendary bow', ''),
(105, 105, 'Whispdeath', 'legendary bow', ''),
(106, 106, 'Guldans staff', 'legendary staff', ''),
(107, 107, 'DwarfHammer', 'legendary hammer', '');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `name`, `description`) VALUES
(1, 'Soul Stone', 'A soul stone, allowing a summoned hero to awaken, or an awaken hero to specialize, freely.'),
(2, 'Talent Certificate', 'Allow a specialized hero to switch to another specialization.'),
(3, 'Summoning Contract', 'Allow to summon a hero freely.'),
(4, 'Fleeing Medal', 'Allow a summoner to get a hero back in hands.'),
(5, 'Tactical Adjustement', 'Allow a hero to change his place on the board. If the location is already occupied, the two hero swap place. '),
(6, 'Greater Mana Flask', 'Allow a healer to cast his spell once.'),
(7, 'Mana Flask', 'Allow a tank to cast his spell once.'),
(8, 'Little Mana Flask', 'Allow a damage dealer to cast his spell once.'),
(9, 'Rose', 'The power of love is all mighty : Can either bring back a hero from the grave with half HP or recover full HP of a fighting hero.'),
(10, 'Helping Horn Gift', 'Give a one usage Helping Horn to a hero'),
(11, 'Helping Horn', 'A hero equipped with this can use it instead of attacking to swap with another hero, fighting or not.'),
(12, 'Strange Shadow', 'Summon a monster in the cave.'),
(13, 'Monster Capture Material', 'A kit containing everything to capture a monster. \nIf the monster is higher than 50% HP, it fail and the monster disappear.\nIf the the cave is controlled by the other team, a duel begin between two emissaries, to determine who will get the control.\nIf ally team has the control (already has it or won the duel), the monster is killed, and ally team get the loots.'),
(14, 'Duel Provocation', 'Provoke the other team in duel.\r\nIf a monster is alive, the winning price may be the control of the cave.\r\nEither way, the winning price may be a chest.'),
(15, 'Rally Flag Package', 'Give a rally flag to a hero that last 3 round, or until the hero dies.'),
(16, 'Rally Flag', 'A hero wearing this can\'t use his personal weapon nor cast his spell, but can attack.\r\nWhile wearing this, all allies gain "Encouragement".\r\nIf the hero dies while wearing this, all allies gain "Discouragement" for 5 rounds.');

-- --------------------------------------------------------

--
-- Structure de la table `principe`
--

CREATE TABLE `principe` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Principe du jeu';

-- --------------------------------------------------------

--
-- Structure de la table `stats`
--

CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `effect` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stats & Effets';

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`id`, `name`, `desc`) VALUES
(1, 'Heal', 'The role of a healer in the group is to heal others when they are hurt or take damage, thus keeping party members alive in order to tank or kill the enemies. The role often requires quick reaction time and steady nerves. The healer is often credited (wrongly or correctly) with good groups and bad.'),
(2, 'Tank', 'The role of a tank in the group is to take damage for the group, protecting the others from being attacked. Tanks usually have high health, high armor, and often high Avoidance. Their job is to keep the monster\'s Threat or attention on them, preventing the monster from attacking others in the group, who are often less armored and less able to take the damage from the monsters (mobs). Tanks are often the leaders of the group, the first ones into a fight and the last ones out. Good tanks can make a very hard dungeon seem easy.'),
(3, 'Damage Dealer', 'The role of DPS is to kill the monsters. This may sound simplistic, but it takes skill and know-how to dish out powerful damage without overwhelming the group\'s tank and causing the monsters to attack you.'),
(0, 'Unknow', '');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `atk`
--
ALTER TABLE `atk`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe_preset`
--
ALTER TABLE `classe_preset`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deck`
--
ALTER TABLE `deck`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deck_member`
--
ALTER TABLE `deck_member`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hero`
--
ALTER TABLE `hero`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hero_spe`
--
ALTER TABLE `hero_spe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hero_weapon`
--
ALTER TABLE `hero_weapon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `principe`
--
ALTER TABLE `principe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `atk`
--
ALTER TABLE `atk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `classe_preset`
--
ALTER TABLE `classe_preset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT pour la table `deck`
--
ALTER TABLE `deck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `deck_member`
--
ALTER TABLE `deck_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Useless, only for phpmyadmin';
--
-- AUTO_INCREMENT pour la table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Useless, only for phpmyadmin';
--
-- AUTO_INCREMENT pour la table `hero`
--
ALTER TABLE `hero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT pour la table `hero_weapon`
--
ALTER TABLE `hero_weapon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `principe`
--
ALTER TABLE `principe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
