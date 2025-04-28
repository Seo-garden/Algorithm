var map = [[Int]]()
var count = 0

for _ in 0..<5 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

var nums = [Int]()
for _ in 0..<5 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    nums.append(contentsOf: input)
}

for number in nums {
    for i in 0..<5 {
        for j in 0..<5 {
            if map[i][j] == number {
                map[i][j] = 0
            }
        }
    }
    
    count += 1
    
    if checkBingo(map) >= 3 {
        print(count)
        break
    }
}

func checkBingo(_ map: [[Int]]) -> Int {
    var bingo = 0
    
    for i in 0..<5 {
        if map[i].allSatisfy({ $0 == 0 }) {
            bingo += 1
        }
    }
    
    for j in 0..<5 {
        var flag = true
        for i in 0..<5 {
            if map[i][j] != 0 {
                flag = false
                break
            }
        }
        if flag == true {
            bingo += 1
        }
    }
    
    if (0..<5).allSatisfy({ map[$0][$0] == 0 }) {
        bingo += 1
    }
    
    if (0..<5).allSatisfy({ map[$0][4-$0] == 0 }) {
        bingo += 1
    }
    
    return bingo
}