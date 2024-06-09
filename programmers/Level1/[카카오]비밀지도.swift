import Foundation
//배열에 있는 값을 2진변환 해주고,
//1이 있으면 #으로 replacingOccurrences 해주고
func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        let binaryString = String(arr1[i] | arr2[i], radix: 2)
        
        let paddedBinaryString = String(repeating: "0", count: n - binaryString.count) + binaryString

        let replacedString = paddedBinaryString
            .replacingOccurrences(of: "1", with: "#")
            .replacingOccurrences(of: "0", with: " ")

        answer.append(replacedString)
    }

    return answer
}
