import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var usersAtStage = Array(repeating: 0, count: N+2)
    for stage in stages {
        usersAtStage[stage] += 1
    }
    var result = [(Int, Double)]()
    var totalUsers = stages.count
    var stage = stages
    for i in 1...N {
        let failed = usersAtStage[i]
        let failureRate = stage.isEmpty ? 0.0 : Double(failed) / Double(totalUsers)
        result.append((i, failureRate))
        totalUsers -= failed
    }
    
    result.sort {
        if $0.1 == $1.1 {
            return $0.0 < $1.0
        }
        return $0.1 > $1.1
    }

    return result.map { $0.0 }
}
