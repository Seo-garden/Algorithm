//str1, str2 배열로 만들고 for 문 돌려서 str1.count - 1
func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = Array(str1)
    var str2 = Array(str2)
    var answer : Int = 0
    
    var firstchar1 = [String]()
    var secondchar2 =
    
    for i in stride(from: 0, to: str1.count, by: 2) {
        let char = String(str1[i])
        let secondchar = i + 1 < str1.count ? str1[i+1] : " "
        
        let pair = "\(char)\(secondchar)"
    }
    
    for i in stride(from: 0, to: str2.count, by: 2) {
        let char = str2[i]
        let secondchar = i + 1 < str2.count ? str2[i+1] : " "
    }
    return 0
}
