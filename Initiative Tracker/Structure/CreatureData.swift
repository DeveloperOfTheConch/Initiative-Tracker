//
//  Creature.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct CreatureData: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let meta: String
    let Armor_Class: String
    let Hit_Points: String
    let Speed: String
    let STR: String
    let DEX: String
    let CON: String
    let INT: String
    let WIS: String
    let CHA: String
    let STR_mod: String
    let DEX_mod: String
    let CON_mod: String
    let INT_mod: String
    let WIS_mod: String
    let CHA_mod: String
    let Senses: String
    let Languages: String
    let Challenge: String
    let Traits: String
    let Actions: String
    let img_url: String
    let Damage_Resistances: String?
    let Condition_Immunities: String?
    let Damage_Immunities: String?
    let Saving_Throws: String?
    let Skills: String?
    let Legendary_Actions: String?
}

struct CreatureResponse: Decodable {
    let request: [CreatureData]
}

struct MockData {
    
    static let sampleTarrasque = CreatureData(name: "Tarrasque",
                                  meta: "Gargantuan monstrosity, unaligned",
                                  Armor_Class: "25 (Natural Armor)",
                                  Hit_Points: "676 (33d20 + 330)",
                                  Speed: "40 ft.",
                                  STR: "30",
                                  DEX: "11",
                                  CON: "30",
                                  INT: "3",
                                  WIS: "11",
                                  CHA: "11",
                                  STR_mod: "(+10)",
                                  DEX_mod: "(+0)",
                                  CON_mod: "(+10)",
                                  INT_mod: "(-4)",
                                  WIS_mod: "(+0)",
                                  CHA_mod: "(+0)",
                                  Senses: "Blindsight 120 ft., Passive Perception 10",
                                  Languages: "--",
                                  Challenge: "30 (155,000 XP)",
                                  Traits: "<p><em><strong>Legendary Resistance (3/Day).</strong></em> If the tarrasque fails a saving throw, it can choose to succeed instead. </p><p><em><strong>Magic Resistance.</strong></em> The tarrasque has advantage on saving throws against spells and other magical effects. </p><p><em><strong>Reflective Carapace.</strong></em> Any time the tarrasque is targeted by a magic missile spell, a line spell, or a spell that requires a ranged attack roll, roll a d6. On a 1 to 5, the tarrasque is unaffected. On a 6, the tarrasque is unaffected, and the effect is reflected back at the caster as though it originated from the tarrasque, turning the caster into the target. </p><p><em><strong>Siege Monster.</strong></em> The tarrasque deals double damage to objects and structures.</p>",
                                  Actions:"<p><em><strong>Multiattack.</strong></em> The tarrasque can use its Frightful Presence. It then makes five attacks: one with its bite, two with its claws, one with its horns, and one with its tail. It can use its Swallow instead of its bite. </p><p><em><strong>Bite.</strong></em> <em>Melee Weapon Attack:</em> +19 to hit, reach 10 ft., one target. <em>Hit:</em> 36 (4d12 + 10) piercing damage. If the target is a creature, it is grappled (escape DC 20). Until this grapple ends, the target is restrained, and the tarrasque can't bite another target. </p><p><em><strong>Claw.</strong></em> <em>Melee Weapon Attack:</em> +19 to hit, reach 15ft., one target. <em>Hit:</em> 28 (4d8 + 10) slashing damage. </p><p><em><strong>Horns.</strong></em> <em>Melee Weapon Attack:</em> +19 to hit, reach 10ft., one target. <em>Hit:</em> 32 (4d10 + 10) piercing damage. </p><p><em><strong>Tail.</strong></em> <em>Melee Weapon Attack:</em> +19 to hit, reach 20ft., one target. <em>Hit:</em> 24 (4d6 + 10) bludgeoning damage. If the target is a creature, it must succeed on a DC 20 Strength saving throw or be knocked prone. </p><p><em><strong>Frightful Presence.</strong></em> Each creature of the tarrasque's choice within 120 feet of it and aware of it must succeed on a DC 17 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, with disadvantage if the tarrasque is within line of sight, ending the effect on itself on a success. If a creature's saving throw is successful or the effect ends for it, the creature is immune to the tarrasque's Frightful Presence for the next 24 hours. </p><p><em><strong>Swallow.</strong></em> The tarrasque makes one bite attack against a Large or smaller creature it is grappling. If the attack hits, the target takes the bite's damage, the target is swallowed, and the grapple ends. While swallowed, the creature is blinded and restrained, it has total cover against attacks and other effects outside the tarrasque, and it takes 56 (16d6) acid damage at the start of each of the tarrasque's turns.</p><p>If the tarrasque takes 60 damage or more on a single turn from a creature inside it, the tarrasque must succeed on a DC 20 Constitution saving throw at the end of that turn or regurgitate all swallowed creatures, which fall prone in a space within 10 feet of the tarrasque. If the tarrasque dies, a swallowed creature is no longer restrained by it and can escape from the corpse by using 30 feet of movement, exiting prone.</p>",
                                  img_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/0/101/1000/1000/636252741877524077.jpeg",
                                  Damage_Resistances: nil,
                                  Condition_Immunities: "Charmed, Frightened, Paralyzed, Poisoned",
                                  Damage_Immunities: "Fire, Poison; Bludgeoning, Piercing, and Slashing from Nonmagical Attacks",
                                  Saving_Throws: "INT +5, WIS +9, CHA +9",
                                  Skills: nil,
                                  Legendary_Actions: "<p>The tarrasque can take 3 legendary actions, choosing from the options below. Only one legendary action option can be used at a time and only at the end of another creature's turn. The tarrasque regains spent legendary actions at the start of its turn.</p><p><em><strong>Attack.</strong></em> The tarrasque makes one claw attack or tail attack. </p><p><em><strong>Move.</strong></em> The tarrasque moves up to half its speed. </p><p><em><strong>Chomp (Costs 2 Actions).</strong></em> The tarrasque makes one bite attack or uses its Swallow.</p>")
    
    
    static let sampleCreature = CreatureData(name: "Grelph", meta: "Small Gremlin, neutral evil", Armor_Class: "15", Hit_Points: "100 (10d10 + 50)", Speed: "30 ft.", STR: "10", DEX: "12", CON: "14", INT: "16", WIS: "18", CHA: "2", STR_mod: "(+0)", DEX_mod: "(+1)", CON_mod: "(+2)", INT_mod: "(+3)", WIS_mod: "(+4)", CHA_mod: "(-4)", Senses: "Darkvision, Passive Perception 14", Languages: "Common", Challenge: "0 (1 XP)", Traits: "<p><em>Kills people</em> this thing is a freaking killer and will eat you </p>", Actions: "<p><em><strong>Multiattack.</strong></em> The tarrasque can use its Frightful Presence. It then makes five attacks: one with its bite, two with its claws, one with its horns, and one with its tail. It can use its Swallow instead of its bite. </p>", img_url: "https://media-waterdeep.cursecdn.com/attachments/2/656/humanoid.jpg", Damage_Resistances: nil, Condition_Immunities: "Dying", Damage_Immunities: nil, Saving_Throws: "STR +11", Skills: "Athletics", Legendary_Actions: nil)
    
    
    
}
