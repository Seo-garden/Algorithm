//5월 27일 월요일 오후 1시 35분 시작
//최소 공배수를 구하는 방법은 마지막에 나오는 수가 서로소 인 경우
//최소 공배수 = 배열요소의 곱 / 최대공약수
func getGCD(_ num1: Int, _ num2: Int) -> Int {      //최대공약수
    if num1 % num2 == 0 {
        return num2
    }
    return getGCD(num2, num1 % num2)        //나머지가 0이 될 때 까지 재귀호출
}

func solution(_ arr:[Int]) -> Int {
    if arr.count == 1 {         //만약 배열의 요소가 하나밖에 없으면
        return arr[0]           //그게 최소공배수
    }
    var gcd = getGCD(arr[0], arr[1])        //최대공약수를 구한 다음에
    var lcm = (arr[0] * arr[1]) / gcd       //최대공약수로 나눔
    
    for i in 2..<arr.count {
        gcd = getGCD(lcm, arr[i])           //배열2번째부터 최대공약수를 다시 구하고
        lcm = (lcm * arr[i]) / gcd          //최대공약수를 나누면 최대공배수가 나온다.
    }
    
    return lcm
}
