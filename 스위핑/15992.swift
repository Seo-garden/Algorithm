import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
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

let fileIO = FileIO()


let N = fileIO.readInt()
var lines: [(s: Int, e: Int)] = []
for _ in 0..<N {
    let s = fileIO.readInt()
    let e = fileIO.readInt()
    lines.append((s, e))
}

lines.sort {
    if $0.s != $1.s { return $0.s < $1.s } else { return $0.e < $1.e }
}

var left = lines[0].s, right = lines[0].e
var result = 0

for i in 0..<N {
    if right < lines[i].s {
        result += right - left
        
        left = lines[i].s
        right = lines[i].e
    } else {
        right = max(right, lines[i].e)
    }
}
result += right - left

print(result)
