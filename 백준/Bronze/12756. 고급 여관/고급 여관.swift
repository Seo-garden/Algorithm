let a = readLine()!.split(separator: " ").map { Int($0)! }
let aAttack = a[0], aHP = a[1]
var aHP1 = aHP

let b = readLine()!.split(separator: " ").map { Int($0)! }
let bAttack = b[0], bHP = b[1]
var bHP1 = bHP

while true {
    aHP1 -= bAttack
    bHP1 -= aAttack
    if aHP1 <= 0 || bHP1 <= 0 { break }
}

if aHP1 <= 0 && bHP1 <= 0 {
    print("DRAW")
} else if bHP1 <= 0 {
    print("PLAYER A")
} else {
    print("PLAYER B")
}
