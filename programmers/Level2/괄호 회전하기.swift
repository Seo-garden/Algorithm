//5월 29일 수요일 오후 7시 20분 시작
//왼쪽으로 회전했을 때 제거한 값을 배열의 제일 뒤로
import Foundation

func solution(_ s:String) -> Int {
    var s = s.map { String($0) }
    var count = s.count
    var result = 0
    
    while count > 0 {
        var stack = ""
        count -= 1
        for char in s {
            var last = stack.last
            if (last == "[" && char == "]") || (last == "{" && char == "}") || (last == "(" && char == ")") {
                    stack.removeLast()
                    continue
                }
            stack.append(char)
        }
        if stack.isEmpty { result += 1}
        
        let cycle = s.removeFirst()
        s.append(cycle)
    }
    return result
}
