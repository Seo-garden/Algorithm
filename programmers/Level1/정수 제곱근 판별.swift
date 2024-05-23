import Foundation

func solution(_ n:Int64) -> Int64 {
    //121의 경우 11의 제곱근이다. n의 입력값
    for i in 1...n {
        if i * i == n { return (i+1) * (i+1)}
        if n < i * i { return -1 }
    }
    return 0
}
