import Foundation

//commands 2-1번째부터 5-1번째까지 자른 후 3-1번째에 오는 수

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for i in 0..<commands.count {
        var arr = [Int]()
        for j in (commands[i][0]-1)...(commands[i][1]-1) {
            arr.append(array[j])
        }
        arr.sort()      //sort() 를 하는 이유는
        result.append(arr[commands[i][2]-1])
    }
    return result
}

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for command in commands {
        let i = command[0]-1
        let j = command[1]-1
        let k = command[2]-1
        let sorted = array[i...j].sorted()
        answer.append(sorted[k])
    }
    return answer
}
