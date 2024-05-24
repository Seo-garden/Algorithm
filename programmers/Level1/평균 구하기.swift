func solution(_ arr:[Int]) -> Double {
  var sum = 0
    
  for i in 0..<arr.count {
    sum += arr[i]
  }
    
  return Double(sum) / Double(arr.count)
}
