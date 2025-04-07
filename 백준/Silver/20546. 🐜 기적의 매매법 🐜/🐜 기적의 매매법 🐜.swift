//준현이는 한번 산건 절대 안판다. 주식을 살 수 있다면 풀매수
//성민이는 3일 연속 상승하는 주식이면 다음날 무조건 하락, 따라서 현재 소유한 주식의 가격이 3일 째 상승하면 풀매도
//반대의 경우 풀매수

let money = Int(readLine()!)!
var J = money
var JCount = 0
var Jresult = 0
var S = money
var SCount = 0
var Sresult = 0

var arr = [Int]()
let input = readLine()!.split(separator: " ").map { Int($0)! }
arr.append(contentsOf: input)
//print(arr)

//준현이가 주식을 구매하는 경우

for i in arr {
    if J >= i {
        JCount += J / i
        J = J % i
    }
}

Jresult = (arr[arr.count - 1] * JCount) + J

//성민이가 주식을 구매하는 경우

for i in 3..<arr.count {
    if arr[i-3] > arr[i-2] && arr[i-2] > arr[i-1] {
        if S >= arr[i] {
            SCount += S / arr[i]
            S -= arr[i] * SCount
        }
    }
    
    if arr[i-3] < arr[i-2] && arr[i-2] < arr[i-1] {
        S += SCount * arr[i]
        SCount = 0
    }
}

Sresult = (arr[arr.count - 1] * SCount) + S

//print(Jresult)
//print(Sresult)

//준현이와 성민이의 가격을 비교해서 출력
if Jresult > Sresult {
    print("BNP")
} else if Jresult == Sresult {
    print("SAMESAME")
} else { print( "TIMING") }