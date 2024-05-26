//5월 26일 일요일 오후 5시 14분 시작
//23분, 문자열의 요소 하나씩 담아서 for 문을 돌리는데 n, n+1 번째가 동일한 문자면 제거
//29분 xcode
//49분 스택으로 푼다는 생각을 못했다.
import Foundation

func solution(_ s:String) -> Int{
    var stack = [Character]()
    for c in s {
        if !stack.isEmpty && stack.last! == c {
            stack.removeLast()
        } else { stack.append(c) }
    }
    
    return stack.isEmpty ? 1 : 0
}
