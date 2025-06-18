var wheel1 = Array(readLine()!)
var wheel2 = Array(readLine()!)
var wheel3 = Array(readLine()!)
var wheel4 = Array(readLine()!)
var k = Int(readLine()!)!
var result = 0

for _ in 0..<k {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0] - 1
    let b = ab[1]

    var rotate = [0, 0, 0, 0]
    rotate[a] = b

    for i in stride(from: a - 1, through: 0, by: -1) {
        let rightWheel: [Character]
        let leftWheel: [Character]
        switch i + 1 {
        case 1: rightWheel = wheel2
        case 2: rightWheel = wheel3
        case 3: rightWheel = wheel4
        default: rightWheel = []
        }
        switch i {
        case 0: leftWheel = wheel1
        case 1: leftWheel = wheel2
        case 2: leftWheel = wheel3
        default: leftWheel = []
        }

        if leftWheel[2] != rightWheel[6] {
            rotate[i] = -rotate[i + 1]
        } else { break }
    }

    // 오른쪽 전파
    for i in a..<3 {
        let leftWheel: [Character]
        let rightWheel: [Character]
        switch i {
        case 0: leftWheel = wheel1
        case 1: leftWheel = wheel2
        case 2: leftWheel = wheel3
        default: leftWheel = []
        }
        switch i + 1 {
        case 1: rightWheel = wheel2
        case 2: rightWheel = wheel3
        case 3: rightWheel = wheel4
        default: rightWheel = []
        }

        if leftWheel[2] != rightWheel[6] {
            rotate[i + 1] = -rotate[i]
        } else { break }
    }

    for i in 0..<4 {
        switch i {
        case 0:
            if rotate[i] == 1 {
                let r = wheel1.removeLast()
                wheel1.insert(r, at: 0)
            } else if rotate[i] == -1 {
                let r = wheel1.removeFirst()
                wheel1.append(r)
            }
        case 1:
            if rotate[i] == 1 {
                let r = wheel2.removeLast()
                wheel2.insert(r, at: 0)
            } else if rotate[i] == -1 {
                let r = wheel2.removeFirst()
                wheel2.append(r)
            }
        case 2:
            if rotate[i] == 1 {
                let r = wheel3.removeLast()
                wheel3.insert(r, at: 0)
            } else if rotate[i] == -1 {
                let r = wheel3.removeFirst()
                wheel3.append(r)
            }
        case 3:
            if rotate[i] == 1 {
                let r = wheel4.removeLast()
                wheel4.insert(r, at: 0)
            } else if rotate[i] == -1 {
                let r = wheel4.removeFirst()
                wheel4.append(r)
            }
        default: break
        }
    }
}

if wheel1[0] == "1" {
    result += 1
}
if wheel2[0] == "1" {
    result += 2
}
if wheel3[0] == "1" {
    result += 4
}
if wheel4[0] == "1" {
    result += 8
}

print(result)