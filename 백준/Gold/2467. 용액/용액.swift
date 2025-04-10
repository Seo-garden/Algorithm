import Foundation

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1 : -1)
    }
}

let fileIO = FileIO()
//Thanks to Rhino
let N = fileIO.readInt()

var solutions = [Int](repeating: 0, count: N)
for i in 0..<N {
    solutions[i] = fileIO.readInt()
}

solutions.sort()

var left = 0
var right = N - 1
var closestSum = Int.max    //최댓값지정
var result = (0, 0)

while left < right {
    let currentSum = solutions[left] + solutions[right]    //왼쪽과 오른쪽값을 더해서

    if abs(currentSum) < abs(closestSum) {    //최댓값과 비교하고 작다면 현재값을 최댓값에 넣는다
        closestSum = currentSum
        result = (solutions[left], solutions[right])
    }

    if currentSum < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(result.0, result.1)