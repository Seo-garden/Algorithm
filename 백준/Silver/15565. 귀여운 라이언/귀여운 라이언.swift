import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()

let N = fileIO.readInt() // 배열의 크기
let K = fileIO.readInt() // 1이 최소 K개 들어있는 구간을 찾아야 함

var doll = [Int](repeating: 0, count: N)
for i in 0..<N {
    doll[i] = fileIO.readInt() // 입력된 배열을 구성
}

var countOfOnes = 0 // 구간 내 1의 개수를 추적
var minLength = Int.max // 최소 구간의 길이를 저장할 변수
var start = 0 // 시작 포인터

// 슬라이딩 윈도우로 배열 탐색

for i in 0..<N {
    if doll[i] == 1 {
        doll[countOfOnes] = i
        countOfOnes += 1
    }
}

if countOfOnes < K {
    print(-1)
} else {
    var length = 0
    var result = N
    var start = 0, end = K - 1
    while end < countOfOnes {
        length = doll[end] - doll[start] + 1
        result = min(result, length)
        start += 1
        end += 1
    }
    print(result)
}