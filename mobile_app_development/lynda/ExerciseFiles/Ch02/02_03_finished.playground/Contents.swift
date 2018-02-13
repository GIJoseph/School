
let one = 0b1

let two = one << 1 // 00000010

let sixteen = one << 4 // 00010000

let zero: UInt8 = 0b00000000

~zero // 11111111

let a = 0b111100
let b = 0b001111

a & b // 001100

a | b // 111111

var hasSword = 0b001
var hasShield = 0b000
var hasArmor = 0b100

let playerEquipment = hasSword | hasShield | hasArmor // 101

let c = 0b1001
let d = 0b0101

c ^ d // 1100
