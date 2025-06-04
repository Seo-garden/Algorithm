let t = Int(readLine()!)!

//동북서남
let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

for _ in 0..<t {
    var x = 0
    var y = 0
    var dir = 1
    var path = [(x: Int, y: Int)]()
    path.append((x,y))
    
    let input = readLine()!
    
    for i in input {
        switch i {
        case "F":
            x += dx[dir]
            y += dy[dir]
            
        case "B":
            x -= dx[dir]
            y -= dy[dir]
            
        case "L":
            dir = (dir + 1) % 4
        case "R":
            dir = (dir + 3) % 4
        default:
            break
        }
        path.append((x,y))
    }
    
    let minX = path.map { $0.x }.min()!
    let maxX = path.map { $0.x }.max()!
    let minY = path.map { $0.y }.min()!
    let maxY = path.map { $0.y }.max()!
    
    print((maxX - minX) * (maxY - minY))
}