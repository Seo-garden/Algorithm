//백준 15661 4월 24일 수요일 오후 9시 45분
//고려사항
//1. 두 팀의 인원수는 같지 않아도 되지만, 한 명 이상이여야 한다.
//2. 축구는 평일 오후에 하고 의무 참석도 아니다. 축구를 하기 위해 모인 사람은 총 N명이다. 이제 스타트 팀과 링크 팀으로 사람들을 나눠야 한다. 두 팀의 인원수는 같지 않아도 되지만, 한 명 이상이어야 한다. ==> 여기서 N명 전부가 축구를 참여하지 않아도 된다 라고 생각했다 ㅅㅂ

var N = Int(readLine()!)!
var player = [[Int]]()
var minPower = Int.max

for _ in 0..<N {
    let S = readLine()!.split(separator: " ").map({ Int($0)! })
    player.append(S)
}

for i in 1..<(1 << N ) - 1 {
    let currentPower = madeTeam(i)
    minPower = min(minPower, currentPower)
}
print(minPower)

func madeTeam(_ num: Int) -> Int{
    var start = [Int]()
    var link = [Int]()
    
    for i in 0..<N {
        if (num & (1 << i)) == 0 {
            link.append(i)
        } else {
            start.append(i)
        }
    }
    return abs(power(start) - power(link))
}

func power(_ v: [Int]) -> Int{
    var result = 0
    for i in v {
        for j in v {
            result += player[i][j]
        }
    }
    return result
}




