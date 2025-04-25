//‘1’은 스위치가 켜져 있음을, ‘0’은 꺼져 있음을 나타낸다.
//학생들에게 1 이상이고 스위치 개수 이하인 자연수를 하나씩 나누어주었다. 학생들은 자신의 성별과 받은 수에 따라 아래와 같은 방식으로 스위치를 조작하게 된다.
//남학생은 스위치 번호가 자기가 받은 수의 배수이면, 그 스위치의 상태를 바꾼다. 즉, 스위치가 켜져 있으면 끄고, 꺼져 있으면 켠다.
//여학생은 자기가 받은 수와 같은 번호가 붙은 스위치를 중심으로 좌우가 대칭이면서 가장 많은 스위치를 포함하는 구간을 찾아서, 그 구간에 속한 스위치의 상태를 모두 바꾼다. -> i-1 == i+1 상태를 바꾼다 if) 1 -> -1
let input = Int(readLine()!)!
var status = readLine()!.split(separator: " ").map { Int($0)! }
let n = Int(readLine()!)!

for _ in 0..<n {
    let student = readLine()!.split(separator: " ").map { Int($0)! }
    let sex = student[0], count = student[1]
    
    if sex == 1 {
        var index = count - 1
        while index < input {
            status[index] = 1 - status[index]
            index += count
        }
    } else if sex == 2 {
        let index = count - 1
        var left = index
        var right = index
        
        while left >= 0 && right < input && status[left] == status[right] {
            left -= 1
            right += 1
        }
        left += 1
        right -= 1
        
        for i in left...right {
            status[i] = 1 - status[i]
        }
    }
}

for i in 0..<status.count {
    print(status[i], terminator: " ")
    if (i+1) % 20 == 0 {
        print()
    }
}
print()