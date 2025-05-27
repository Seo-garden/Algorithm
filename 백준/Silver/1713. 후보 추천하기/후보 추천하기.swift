let n = Int(readLine()!)!
_ = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map { Int($0)! }
var photos = [(Int, Int)]()

var count = 0

for i in input {
    //배열이 n보다 작다면 추가를 하되, 들어간적이 없는지
    if photos.contains(where: { $0.0 == i }) {      //사용자입력한 값이 튜플배열에 존재한다면
        let findIndex = photos.firstIndex { $0.0 == i }!
        photos[findIndex].1 += 1
    } else {        //사용자가 입력한 값이 튜플배열에 존재하지 않다면
        if photos.count == n {
            let removed = photos.filter { $0.1 == photos.map { $0.1 }.min()! }.first!
            photos.remove(at: photos.firstIndex { $0 == removed }! )
        }
        photos.append((i, 1))
    }
}

var students = photos.map { $0.0 }.sorted()

for student in students {
    print(student, terminator: " ")
}