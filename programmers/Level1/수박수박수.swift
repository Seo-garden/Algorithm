func solution(_ n:Int) -> String {
    var arr = ["수", "박"]
    var result : String = ""
    var count = 0
    
    for _ in 0..<n {
        if count % 2 == 0 {
            count += 1
            result += arr[0]
        } else {
            count += 1
            result += arr[1]
        }
    }
    return result
}
