//5월 25일 토요일 오후 8시 30분 시작
//피보나치 수열 == 재귀로 푸니까 시간초과가 났다.
//swift 에서 재귀함수로 호출할 수 있는 횟수가 제한되어 있다.(n번호출)
//Xcode 에서 50부터 상당한 시간이 소요된다.
//이건 배열의 요소를 리턴하는거라서 Int 리턴이 맞다.
func solution(_ n:Int) -> Int {
    var arr = [0,1]
    
    for i in 2...n {
        arr.append((arr[i-2] + arr[i-1]) % 1234567)
    }
    
    return arr[n]
}
