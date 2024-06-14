import Foundation

let input1 = Int(readLine()!)!
let inputA = readLine()!.split(separator: " ").map { Int(String($0))!}
let input2 = Int(readLine()!)!
let inputB = readLine()!.split(separator: " ").map { Int(String($0))!}

var result = 0
var a = 1
var b = 1

for i in inputA {
    a *= i
}

for i in inputB {
    b *= i
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a } else { return gcd(b, a%b)}
}

func solution(_ a: Int, _ b: Int) -> String {
    result = gcd(a,b)
    if result > 999999999 {
        result = result % 1000000000
        let resultString = String(result)
        let g = String(repeating: "0", count: 9 - resultString.count) + resultString
        return g
    }
    else { return String(result) }
}

print(solution(a,b))
