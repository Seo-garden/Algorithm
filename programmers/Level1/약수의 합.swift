//제한 사항을 잘 읽어볼 것.
func solution(_ n:Int) -> Int {
    var sum = 0
    if n>0 {
        for i in 1...n {
            if n % i == 0 {
                sum += i
            }
        }
        
    }
    return sum
}
