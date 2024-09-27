let str = readLine()!.map{String($0)}       //split(separator: ":") 를 쓰게 되면 연속으로 오는 경우를 처리할 수 없다.

var result = [String]()
var keep = [String]()
var colon = false
var colonIndex = 0
//input -> 25:09:1985:aa:091:4846:374:bb
for i in 0..<str.count {                    //입력된 문자열 처음부터 끝까지
    if str[i] == ":" {
        if !keep.isEmpty {                  //주석의 input 넣어보면 현재 keep 에는 25 가 들어가있음
            while keep.count < 4 {
                keep.insert("0", at: 0)     //0번째(앞에서)부터 0 넣기
            }
            result.append(keep.joined())
        }
        
        if colon {                          //:: 이상이 왔을 때 동작
            colonIndex = result.count
            colon = false
        }
        colon = true
        keep.removeAll()
    } else {
        colon = false
        keep.append(str[i])
    }
}

if !keep.isEmpty {
    while keep.count < 4 {
        keep.insert("0", at: 0)
    }
    result.append(keep.joined())
}
    
while result.count < 8 {                            //8보다 작은 경우는 콜론이 2개 이상 들어간 경우
    result.insert("0000", at: colonIndex)           //
}

print(result.joined(separator: ":"))

