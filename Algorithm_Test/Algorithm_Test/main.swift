import Foundation

func solution(_ s:String) -> [Int] {
    var dic : [Int:Int] = [:]
    var result = [Int]()
    
    var input = s.replacingOccurrences(of: "{", with: "")
    input = input.replacingOccurrences(of: "}", with: "")
    
    var data = input.split{$0 == ","}.map{Int(String($0))!}
    print(data)
    for i in data {
        if dic[i] != nil {
            dic[i]! += 1
        } else {
            dic[i] = 1
        }
    }
    for (key, _) in dic.sorted(by: {$0.value > $1.value}) {
        result.append(key)
    }
    return result
}
print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
