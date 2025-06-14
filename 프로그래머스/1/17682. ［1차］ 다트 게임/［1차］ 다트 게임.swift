import Foundation

func solution(_ dartResult:String) -> Int {
    var score = [Int]()
    var numString = ""
    var result = 0
    
    for char in dartResult {
        if char.isNumber {
            numString += String(char)
        } else {
            if char == "S" {  
                score.append(Int(pow(Double(Int(numString)!), 1)))
            } else if char == "D" { 
                score.append(Int(pow(Double(Int(numString)!), 2)))
            } else if char == "T" { 
                score.append(Int(pow(Double(Int(numString)!), 3)))           
            } else if char == "#" { 
                let currentIndex = score.count - 1
                score[currentIndex] = score[currentIndex] * -1
            } else if char == "*" {  
                let currentIndex = score.count - 1
                score[currentIndex] = score[currentIndex] * 2
                    
                let preIndex = currentIndex - 1
                for i in 0...currentIndex {
                    if i == preIndex {
                        score[i] = score[i] * 2
                    }
                }
            }
            numString = ""
        }
    }
    for i in score {
        result += i
    }
    
    return result
}