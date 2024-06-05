func solution(_ arr:[Int]) -> [Int] {
    if arr.count == 1 { return [-1] }
    
    var result = arr
    
    result.remove(at: arr.firstIndex(of: result.sorted()[0]) ?? 0)
                  
    return result
                  
}
