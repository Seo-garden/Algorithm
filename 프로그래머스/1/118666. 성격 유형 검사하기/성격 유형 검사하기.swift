//250620 13:16 ~ 14:19
import Foundation
//["AN", "CF", "MJ", "RT", "NA"]    [5, 3, 2, 7, 5]
func solution(_ survey:[String], _ choices:[Int]) -> String {
    var tuple = [(name: Character, count: Int)]()
    var index = 0
    var result = ""
    while index < survey.count {
        let pre = survey[index].first!
        let suf = survey[index].last!
        let choice = choices[index]
        
        if choices[index] < 4 {
            tuple.append((name: pre, count: 4 - choice))
        } else if choices[index] > 4 {
            tuple.append((name: suf, count: choice - 4))
        }
        
        index += 1
    }
    
    var score = [Character: Int]()
    
    for item in tuple {
        score[item.name, default: 0] += item.count
    }
    
    let pairs: [(Character, Character)] = [("R", "T"), ("C", "F"), ("J", "M"), ("A", "N")]
    for (a, b) in pairs {
        let aScore = score[a, default: 0]
        let bScore = score[b, default: 0]
        result += aScore >= bScore ? String(a) : String(b)
    }
    
    return result
}
