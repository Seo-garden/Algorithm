//1은 켜짐 0은 꺼짐
//학생들에게 1 이아 스위치 개수 이하인 자연수를 나눔
//성별과 받은 수에 따라 스위치 조작
//남학생은 스위치 번호가 자기 받은 수의 배수면 스위치 상태를 바꾼다.
//여학생은 자기 받은 수와 같은 번호가붙은 스위치를 중심으로 좌우가 대칭이면서 가장 많은 스위치를
//포함하는 구간을 찾아서, 그 구간에 속한 스위치의 상태를 모두 바꾼다. 이때 구간에 속한 스위치의 개수
//항상 홀수가 된다.
//변수 <= 100
//입력
let input = Int(readLine()!)!
//출력값
var result = [Int]()
//스위치의 상태
var onoff = readLine()!.split(separator: " ").map { Int($0)! }
let students = Int(readLine()!)!

for _ in 0..<students {
    //학생의 성별 + 학생이 받은 숫자
    let sexCount = readLine()!.split(separator: " ").map { Int($0)! }
    let sex = sexCount[0], count = sexCount[1]
    if sex == 1 {        //남자가 3번을 받았으면 배열의 2번째 인덱스 값을 반대로
        var index = count - 1
        while index < input {
            onoff[index] = 1 - onoff[index]     //스위치 상태 반대로
            index += count
        }
    } else if sex == 2 {        //여자 2 5
        let index = count - 1
        var left = index
        var right = index
        //대칭인 구간 찾기
        while left >= 0 && right < input && onoff[left] == onoff[right] {
            left -= 1
            right += 1
        }
        //위의 while 문은 마지막으로 대칭이 아닌 곳까지 이동했기 때문에, 한칸 씩 앞으로 이동
        left += 1
        right -= 1
        //대칭 구간의 스위치 상태 변경
        for i in left...right {
            onoff[i] = 1 - onoff[i]
        }
    }
}

for i in 0..<onoff.count {
    print(onoff[i], terminator: " ")
    if (i+1) % 20 == 0 {
        print()
    }
}
print()
