import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var keyPad = [(3, 1), (0, 0), (0, 1), (0, 2), (1,0), (1,1), (1,2), (2,0), (2,1), (2,2)]
    var nowLeft = (3,0), nowRight = (3,2)
    var result = ""
    
    for number in numbers {
        if number % 3 == 1 {
            result += "L"
            nowLeft = keyPad[number]
        } else if number != 0 && number % 3 == 0 {
            result += "R"
            nowRight = keyPad[number]
        } else {
            var dLeft = abs(keyPad[number].0 - nowLeft.0) + abs(keyPad[number].1 - nowLeft.1)
            var dRight = abs(keyPad[number].0 - nowRight.0) + abs(keyPad[number].1 - nowRight.1)
            
            if dLeft < dRight || (dLeft == dRight && hand == "left") {
                result += "L"
                nowLeft = keyPad[number]
            } else {
                result += "R"
                nowRight = keyPad[number]
            }
        }
    }
    
    return result
}