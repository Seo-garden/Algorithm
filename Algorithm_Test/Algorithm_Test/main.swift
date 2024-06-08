func solution(_ strings:[String], _ n:Int) -> [String] {
    var strings = strings.map { $0.map { String($0) } }
    print(strings)
    strings.sort {
        if $0[n] == $1[n] {
            return $0.joined() < $1.joined()
        }
        return $0[n] < $1[n]
    }
    
    return strings.map { $0.joined() }
}

print(solution(["sun", "bed", "car"], 1))
