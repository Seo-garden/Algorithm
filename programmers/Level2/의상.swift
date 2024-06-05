import Foundation
//각 종류별로 최대 한가지만 의상착의
//착용한 의상이 겹치더라도, 추가로 더 착용하거나, 서로 다른 방법으로 착용하면 count
//입출력 1번의 경우 각 하나씩만 끼거나, yellow & blue, green & blue -> return 5
//입출력 2번의 경우 얼굴만 3개니까, 하나씩밖에 못써서 return 3
func solution(_ clothes:[[String]]) -> Int {
    var typeCount : [String:Int] = [:]
    for cloth in clothes {
        //해당 종류가 존재하는가?
        if typeCount[cloth[1]] != nil {
            typeCount[cloth[1]]! += 1
        } else {
            //없다면 해당 종류에 추가
            typeCount[cloth[1]] = 1
        }
    }
    var count = 1
    for (_, value) in typeCount {
        count *= (value + 1)
    }
    //-1 을 하는 이유는 아무것도 입지 않는 경우는 제외
    return count - 1
}
