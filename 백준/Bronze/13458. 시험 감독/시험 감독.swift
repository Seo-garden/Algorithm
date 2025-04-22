// 입력 받기
let N = Int(readLine()!)!
let rooms = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let B = input[0], C = input[1]

var cnt = 0

for room in rooms {
    var num = room
    var result = 0

    // 주 감독관 1명은 반드시 필요
    num -= B
    result += 1

    if num > 0 {
        // 부감독관 필요
        if num % C == 0 {
            result += num / C
        } else {
            result += num / C + 1
        }
    }

    cnt += result
}

print(cnt)
