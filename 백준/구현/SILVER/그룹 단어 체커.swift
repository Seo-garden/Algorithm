import Foundation
//만약 aabba 에서 마지막 a 를 넣을 때, 존재해서 else if 문으로 넘어가는데, b와 a 가 같지 않아서
//그룹단어가 아니니까 break
let input = Int(readLine()!)!

var count = 0

for _ in 0..<input {
    var alphabet = readLine()!
    var arr = [Character]()
    
    for j in alphabet {
        if !arr.contains(j) {
            arr.append(j)
        } else if arr.last != j {
            break
        } else {
            arr.append(j)
        }
        if alphabet.count == arr.count { count += 1 }
    }
}
print(count)
