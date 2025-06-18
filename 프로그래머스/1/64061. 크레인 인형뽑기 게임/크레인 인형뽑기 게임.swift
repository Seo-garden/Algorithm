import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var map = board
    var stack = [Int]()
    var result = 0
    
    for move in moves {
        let col = move - 1
        for row in 0..<map.count {
            if map[row][col] != 0 {
                let picked = map[row][col]
                map[row][col] = 0
                
                if !stack.isEmpty && stack.last! == picked {
                    stack.removeLast()
                    result += 2
                } else {
                    stack.append(picked)
                }
                
                break
            } 
        }
    }
    
    return result
}