//5월 28일 화요일 오후 1시 20분 시작

func solution(_ seoul:[String]) -> String {
    
    for i in 0..<seoul.count {
        if seoul[i] == "Kim" { return "김서방은 \(i)에 있다" }
    }
    
    return ""
}
