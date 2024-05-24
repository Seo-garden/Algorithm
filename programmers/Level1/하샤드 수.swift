func solution(_ x:Int) -> Bool {
    let s = String(x)
    let arr = s.map {Int(String($0))!}
    var sum = 0
    for i in arr {
        sum += i
    }
    if x % sum == 0 { return true }
    else { return false}
}
