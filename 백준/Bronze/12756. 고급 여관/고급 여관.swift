import Foundation

let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

let aAttack = a[0], aHP = a[1]
let bAttack = b[0], bHP = b[1]

// 플레이어 A가 B를 쓰러뜨리기 위한 공격 횟수
let aTurns = (bHP + aAttack - 1) / aAttack

// 플레이어 B가 A를 쓰러뜨리기 위한 공격 횟수
let bTurns = (aHP + bAttack - 1) / bAttack

if aTurns < bTurns {
    print("PLAYER A")
} else if aTurns > bTurns {
    print("PLAYER B")
} else {
    print("DRAW")
}