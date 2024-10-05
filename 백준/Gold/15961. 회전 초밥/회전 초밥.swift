import Foundation
// 라이노님 빠른 입력 FileIO 클래스
class  FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always)  private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always)  func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always)  func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let file = FileIO()
let inp = [file.readInt(), file.readInt(), file.readInt(), file.readInt()]

let N = inp[0], D = inp[1], K = inp[2], C = inp[3]
var list = [Int]()
for _ in 0..<N {
    list.append(file.readInt())
}

list.append(contentsOf: list[0..<N-1])
var check = Array(repeating: 0, count: 3001)
var l = 0
var count = 0
var answer = 0
for r in 0..<2*N-K {
    check[list[r]] += 1
    if check[list[r]] == 1 {
        count += 1
    }
    if r-l+1>K {
        check[list[l]] -= 1
        if check[list[l]] == 0 {
            count -= 1
        }
        l += 1
    }
    if check[C] == 0 {
        answer = max(answer, count+1)
    } else {
        answer = max(answer, count)
    }
}

print(answer)