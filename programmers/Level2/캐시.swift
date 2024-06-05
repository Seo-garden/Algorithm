//result 에 최초로 cities 를 넣으면 +5
//하지만, result 에 남아있는 cities 를 넣으면 +1
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    //uppercased 나 lowercased 둘다 상관은 없는데, 하는 이유는 대소문자를 구분하지 않고 처리하기 위함
    let newCities = cities.map { return $0.uppercased()}
    var cacheArray = [String]()
    var totalTime = 0
    //city 배열에 넣을껀데, 만약 배열이 넘치면 맨 처음에 넣은 요소 삭제
    //만약 cities[i] 와 동일한 도시이름이 들어가면 그 요소를 빼고 기존에 있던 도시를 한칸씩 앞으로
    for city in newCities {
        if cacheArray.contains(city) {
            totalTime += 1
            cacheArray.remove(at: cacheArray.firstIndex(of: city)!)
            cacheArray.append(city)
        } else {
            totalTime += 5
            cacheArray.append(city)
            if cacheArray.count > cacheSize {
                cacheArray.removeFirst()
            }
        }
    }
    return totalTime
    
}
