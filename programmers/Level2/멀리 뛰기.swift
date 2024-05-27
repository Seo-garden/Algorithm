//5월 27일 월요일 3시 45분
//만약 n = 5 라고 했을 때
//1 1 1 1 1 | 1 1 1 2 | 1 1 2 1 | 1 2 1 1 | 1 2 2 | 2 1 1 1 | 2 2 1 | 2 1 2 ==> 8
//팩토리얼과 유사
//n = 1 --> 1 | n = 2 --> 2 | n = 3 --> 3 | n = 4 --> 5 | n = 5 --> 8
//재귀로 푸니까 시간초과가 나서 안된다.
func solution(_ n:Int) -> Int {
    var arr = Array(repeating: 0, count : n + 1)
    
    if n < 3 { return n}
    arr[1] = 1
    arr[2] = 2

    for i in 3...n {
        arr[i] = (arr[i-1] + arr[i-2]) % 1234567
    }
    
    return arr[n]
}
