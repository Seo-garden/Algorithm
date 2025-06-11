//수를 처리하는 것은 통계학에서 상당히 중요한 일이다.
//통계학에서 N개의 수를 대표하는 기본 통계값에는 다음과 같은 것들이 있다.
//단, N은 홀수라고 가정하자.
//산술평균 : N개의 수들의 합을 N으로 나눈 값
//중앙값 : N개의 수들을 증가하는 순서로 나열했을 경우 그 중앙에 위치하는 값
//최빈값 : N개의 수들 중 가장 많이 나타나는 값
//범위 : N개의 수들 중 최댓값과 최솟값의 차이
//N개의 수가 주어졌을 때, 네 가지 기본 통계값을 구하는 프로그램을 작성하시오.
import Foundation
let inputNumberCount = Int(readLine()!)!
var arr = [Int]()
var sum1 = 0.0        //산술평균
var sum = 0
var center = 0      //중앙값
var dict : [Int:Int] = [:]
for _ in 0..<inputNumberCount {        //입력
    let input = Int(readLine()!)!
    arr.append(input)
}
//산술평균
for i in 0..<arr.count {
    sum += arr[i]
}
sum1 = Double(sum) / Double(arr.count)           //산술평균

//중앙값
var arrsorted = arr.sorted(by: >)

center = arrsorted[arr.count / 2]
//최빈값 (N개중 가장 많이 나타나는 값)
for num in arr {
    dict[num, default: 0] += 1
}
let maxValue = dict.max(by: {$0.value < $1.value})!.value
let choiresult = dict.filter{$0.value == maxValue}.keys.sorted()

var result = 0
if choiresult.count > 1 { result = choiresult[1]} else { result = choiresult[0]}
print(Int(round(sum1)))
print(center)
print(result)
print(arr.max()! - arr.min()!)