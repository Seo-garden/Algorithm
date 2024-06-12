let input = Int(readLine()!)!

var result = 0

for _ in 0..<input {
    let input2 = readLine()!.split(separator: " ").map {String($0)}
    
    let num1 = Int(input2[0])!
    let num2 = Int(input2[2])!
    let op = input2[1]
    
    switch op {
    case "+":
        result += num1 + num2
    case "-":
        result += num1 - num2
    case "*":
        result += num1 * num2
    case "/":
        result += num1 / num2
    default:
        continue
    }
}
print(result)

