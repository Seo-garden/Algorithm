//5월 28일 화요일 오후 1시 35분
//끝말잇기단어를 잘못 뱉거나, 중복되면 끝
//만약 주어진 단어들로 탈락자가 생기지 않는다면, [0, 0]을 return
import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordDB = [String]()
    
    for i in 0..<words.count {
        var word = words[i]
        if word.count < 1 {
            //print(word.count)
            return [i%n + 1, i/n + 1]
        }
        if wordDB.contains(words[i]) {
            //print(i)
            return [i%n + 1, i/n + 1]
        }
        if wordDB.count != 0 {
            var lastword = wordDB[wordDB.count - 1]     //배열의 마지막요소
            if lastword.removeLast() != word.removeFirst(){
                return [i%n + 1, i/n + 1]
            }
        }
        wordDB.append(words[i])
    }
    
    return [0,0]
}
