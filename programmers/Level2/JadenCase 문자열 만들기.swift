//isNumber 라는 것을 알게됐는데, Character 타입에서 정수인지 아닌지를 판단할 수 있다.

func solution(_ s:String) -> String {
    var answer = ""
    var isFirst = true
    
    for str in s {
        if str == " " {
            isFirst = true
            answer += String(str)
        } else if str.isNumber {
            isFirst = false
            answer += String(str)
        } else {
            if isFirst {
                answer += String(str.uppercased())
                isFirst = false
            } else {
                answer += String(str.lowercased())
            }
        }
    }
    return answer
}
