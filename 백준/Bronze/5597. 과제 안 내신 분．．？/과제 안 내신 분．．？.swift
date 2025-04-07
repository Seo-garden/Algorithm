var nums: Set<Int> = []
for _ in 1...28 {
    nums.insert(Int(readLine()!)!)
}

for i in 1...30 {
    if !nums.contains(i) {
        print(i)
    }
}