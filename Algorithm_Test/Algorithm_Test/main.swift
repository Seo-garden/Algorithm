func solution(_ numbers: [Int]) -> [Int] {
    var result = [Int](repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            if numbers[j] > numbers[i] {
                result[i] = numbers[j]
                break
            }
        }
    }
    
    return result
}


