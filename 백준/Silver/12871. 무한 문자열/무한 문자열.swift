import Foundation

let input1 = Array(readLine()!)
let input2 = Array(readLine()!)

var result1 = input1
var result2 = input2

for i in input2 {
    result1.append(i)
}

for i in input1 {
    result2.append(i)
}

if result1 == result2 {
    print("1")
} else {
    print("0")
}