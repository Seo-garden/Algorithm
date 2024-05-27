//5월 27일 월요일 오후 2시 44분 시작
//n = 8 이면 , 1-2 / 3-4 / 5-6 / 7-8 2^n 이라서, 부전승없음 4번 경기
//a = 3, b = 8
//round = 1 -> a = 2, b = 4
//round = 2 -> a = 1, b = 3
//round = 3 -> a = 1, b = 2

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var round = 0
    var a = a
    var b = b
    
    while true {
        if a % 2 == 0 { a /= 2} else { a = (a+1) / 2}
        if b % 2 == 0 { b /= 2} else { b = (b+1) / 2}
        
        round += 1
        
        if a==b { break}
    }
    
    return round
}
