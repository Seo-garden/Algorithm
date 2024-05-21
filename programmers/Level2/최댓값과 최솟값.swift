func solution(_ s:String) -> String {
    var arr = s.split(separator: " ").map { Int($0)! }

    var max = Int.min
    var min = Int.max
    
    for i in 0..<arr.count {
        if arr[i] > max {
            max = arr[i]
        }
        if arr[i] < min {
            min = arr[i]
        }
    }
    return String(min) + " " + String(max)
}
