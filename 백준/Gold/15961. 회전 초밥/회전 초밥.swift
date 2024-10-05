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

let Ndkc = [fileIO.readInt(), fileIO.readInt(), fileIO.readInt(), fileIO.readInt()]
//Thanks to Rhyno
let N = Ndkc[0], d = Ndkc[1], k = Ndkc[2], c = Ndkc[3]
var arr = [Int](repeating: 0, count: N)
for item in 0..<N {
    arr[item] = fileIO.readInt()
}
arr.append(contentsOf: arr[0..<N-1])
var check = Array(repeating: 0, count: d + 1)
var left = 0
var count = 0
var answer = 0

for right in 0..<2*N-k {
    check[arr[right]] += 1
    if check[arr[right]] == 1 {
        count += 1
    }
    if right-left+1 > k {
        check[arr[left]] -= 1
        if check[arr[left]] == 0 {
            count -= 1
        }
        left += 1
    }
    if check[c] == 0 {
        answer = max(answer, count+1)
    } else {
        answer = max(answer, count)
    }
}

print(answer)