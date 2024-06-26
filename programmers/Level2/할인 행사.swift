import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var needItem = [String:Int]()
    var needDay = 0
    
    for i in 0..<want.count {
        needItem[want[i]] = number[i]
        print(needItem)
        needDay += number[i]
    }
    
    var result = 0
    
    for j in 0...discount.count - needDay {
        var martItem = needItem
        for i in j...j + needDay - 1 {
            martItem[discount[i]] = (martItem[discount[i]] ?? 0) - 1
            if martItem[discount[i]] == 0 {
                martItem.removeValue(forKey: discount[i])
            }
        }
        if martItem.isEmpty { result += 1}
    }
    return result
}
