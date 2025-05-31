extension String {
    func toNum() -> Int {
        Int(Character(self).asciiValue! - Character("A").asciiValue!) + 1
    }
}

extension Int {
    func toString() -> String {
        String(Character(UnicodeScalar(UInt8(self) + Character("A").asciiValue! - 1)))
    }
}

func isValid(_ p: (Int, Int)) -> Bool {
    p.0 >= 1 && p.0 <= 8 && p.1 >= 1 && p.1 <= 8
}

func moveDirection(command: String, p: (Int, Int)) -> (Int,Int) {
    switch command {
    case "R": return (p.0 + 1, p.1)
    case "L": return (p.0 - 1, p.1)
    case "B": return (p.0, p.1 - 1)
    case "T": return (p.0, p.1 + 1)
    case "RT": return (p.0 + 1, p.1 + 1)
    case "LT": return (p.0 - 1, p.1 + 1)
    case "RB": return (p.0 + 1, p.1 - 1)
    case "LB": return (p.0 - 1, p.1 - 1)
    default: return (0,0)
    }
}

let input = readLine()!.split(separator: " ")
let k = input[0].map { String($0)}, s = input[1].map { String($0)}, n = Int(input[2])!

var king = (k[0].toNum(), Int(k[1])!)
var stone = (s[0].toNum(), Int(s[1])!)

for _ in 0..<n {
    let command = readLine()!
    let newKing = moveDirection(command: command, p: king)
    
    guard isValid(newKing) else { continue }
    if newKing == stone {
        let newStone = moveDirection(command: command, p: stone)
        guard isValid(newStone) else { continue }
        stone = newStone
    }
    king = newKing
}

print(king.0.toString() + "\(king.1)")
print(stone.0.toString() + "\(stone.1)")