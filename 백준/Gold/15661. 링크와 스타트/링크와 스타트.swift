var N = Int(readLine()!)!
var player = [[Int]]()
var minPower = Int.max

for _ in 0..<N {
    let S = readLine()!.split(separator: " ").map({ Int($0)! })
    player.append(S)
}

for i in 1..<(1 << N ) {        //아무것도 선택하지 않는 경우를 제외 (0000~1111)
    let currentPower = madeTeam(i)
    minPower = min(minPower, currentPower)
}


func madeTeam(_ num: Int) -> Int{
    var start = [Int]()
    var link = [Int]()
    
    for i in 0..<N {
        if (num & (1 << i)) == 0 {      //해당 비트가 0 이면 스타트팀
            start.append(i)
        } else {
            link.append(i)
        }
    }
    return abs(power(start) - power(link))
}

func power(_ team: [Int]) -> Int{      //
    var result = 0
    for i in team {
        for j in team {
            result += player[i][j]
        }
    }
    return result
}

print(minPower)
