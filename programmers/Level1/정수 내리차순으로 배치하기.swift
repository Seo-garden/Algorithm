func solution(_ n:Int64) -> Int64 {
    let arr = String(n).map { String($0)}
    return Int64(String(arr.sorted().joined().reversed()))!
}
