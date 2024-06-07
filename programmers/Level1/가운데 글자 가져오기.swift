func solution(_ s:String) -> String {
    var s = Array(s)
    var count = s.count
    var result = ""
    if count % 2 == 0 {
        let middleIndex = count / 2
        return String(s[midㅍdleIndex - 1...middleIndex])
    } else {
        let middleIndex = count / 2
        return String(s[middleIndex])
    }
}
