let input = Int(readLine()!)!

var arr = [[Int]]()
var sum = [Int]()

for _ in 0..<input {
      let input2 = readLine()!.split(separator: " ").map { Int($0)!}
      arr.append(input2)
}

var result = 0
for i in 0..<arr.count {
      sum.append(arr[i][0] * arr[i][1])
    result = sum.max()!
    
}
print(result)
