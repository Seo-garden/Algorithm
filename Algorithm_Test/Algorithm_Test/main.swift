//4시 30분 리딩
//
func solution(_ s:String) -> String {
    var answer: String = ""
    var isFirst: Bool = true
    
    for str in s {
        if str == " " {
            isFirst = true
            answer += String(str)
        } else if str.isNumber {
            isFirst = false
            answer += String(str)
        } else {
            // 문자
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
