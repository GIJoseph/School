
struct Weapon {
    
    enum WeaponType : String {
        case dagger = "Dagger"
        case axe = "Axe"
        case crossbow = "Crossbow"
        case sword = "Sword"
    }

    let type: WeaponType
    var damage: (number: UInt, sides: UInt)
    
}

struct Armor {
    
    enum ArmorType : String {
        case shield = "Shield"
        case leather = "Leather"
        case chainmail = "Chainmail"
        case platemail = "Platemail"
    }

    let type: ArmorType
    var hitPoints: UInt
    
}

class Player {
    
    struct Identity {
        
        enum PlayerClass : String {
            case barbarian = "Barbarian"
            case paladin = "Paladin"
            case sorcerer = "Sorcerer"
        }
        
        let name: String
        var type: PlayerClass
        
    }
    
    var identity: Identity
    var weapons = [Weapon]()
    var armor = [Armor]()
    
    init(identity: Identity) {
        self.identity = identity
    }
}

let paladin = Player(identity: Player.Identity(name: "Nerak", type: .paladin))

paladin.weapons.append(Weapon(type: .sword, damage: (1, 6)))

paladin.armor += [
    Armor(type: .shield, hitPoints: 20),
    Armor(type: .platemail, hitPoints: 40)
]
