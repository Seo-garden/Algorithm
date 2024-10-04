import Foundation

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1 : -1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index - 1

        while now != 10, now != 32, now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index - 1)]), encoding: .ascii)!
    }
}

let fileIO = FileIO()

let S = fileIO.readInt()  // 전체 문자열 길이
let P = fileIO.readInt()  // 부분 문자열 길이

let DNA = Array(fileIO.readString())  // 문자열을 배열로 변환
var ACGT = [fileIO.readInt(), fileIO.readInt(), fileIO.readInt(), fileIO.readInt()]

// 문자에 대응하는 인덱스 (A = 0, C = 1, G = 2, T = 3)
var currentCount = [0, 0, 0, 0]

// 처음 부분 문자열에 포함된 A, C, G, T 개수 세기
for i in 0..<P {
    switch DNA[i] {
    case "A":
        currentCount[0] += 1
    case "C":
        currentCount[1] += 1
    case "G":
        currentCount[2] += 1
    case "T":
        currentCount[3] += 1
    default:
        break
    }
}

// 조건을 만족하는지 확인하는 함수
func isValid() -> Bool {
    for i in 0..<4 {
        if currentCount[i] < ACGT[i] {
            return false
        }
    }
    return true
}

var count = 0

// 처음 부분 문자열이 조건을 만족하는지 확인
if isValid() {
    count += 1
}

// 슬라이딩 윈도우 방식으로 남은 문자열 처리
for i in P..<S {
    // 윈도우에서 빠지는 문자
    switch DNA[i - P] {
    case "A":
        currentCount[0] -= 1
    case "C":
        currentCount[1] -= 1
    case "G":
        currentCount[2] -= 1
    case "T":
        currentCount[3] -= 1
    default:
        break
    }

    // 윈도우에 추가되는 문자
    switch DNA[i] {
    case "A":
        currentCount[0] += 1
    case "C":
        currentCount[1] += 1
    case "G":
        currentCount[2] += 1
    case "T":
        currentCount[3] += 1
    default:
        break
    }

    if isValid() {
        count += 1
    }
}

// 결과 출력
print(count)