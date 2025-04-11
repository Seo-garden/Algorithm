let m = Int(readLine()!)!
var ball = 1 

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (input[0], input[1])
    
    if ball == x {
        ball = y
    } else if ball == y {
        ball = x
    }
}

print(ball)