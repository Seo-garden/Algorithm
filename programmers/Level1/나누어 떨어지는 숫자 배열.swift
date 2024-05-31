func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result = [Int]()
    for i in 0..<arr.count {
        if arr[i] % divisor == 0 {
            result.append(arr[i])
        }
    }
    
    if result.isEmpty { return [-1] }
    
    return result.sorted()
}
