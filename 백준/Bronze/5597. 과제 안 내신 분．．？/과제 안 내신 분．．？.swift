var num = Set<Int>()

for _ in 1...28 {
    let input = Int(readLine()!)!
    num.insert(input)
}

for i in 1...30 {
    if !num.contains(i) {
        print(i)
    }
}