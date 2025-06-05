let nwl = readLine()!.split(separator: " ").map { Int($0)! }
let n = nwl[0], w = nwl[1], l = nwl[2]

let trucks = readLine()!.split(separator: " ").map { Int($0)! }
var bridge = Array(repeating: 0, count: w)
var time = 0
var index = 0
var totalWeight = 0

while index < n {
    time += 1
    
    totalWeight -= bridge.removeFirst()
    
    if totalWeight + trucks[index] <= l {
        bridge.append(trucks[index])
        totalWeight += trucks[index]
        index += 1
    } else {
        bridge.append(0)
    }
}

time += w

print(time)