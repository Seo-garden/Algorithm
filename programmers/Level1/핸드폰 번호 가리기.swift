func solution(_ phone_number:String) -> String {
    var phone = Array(phone_number)
    
    for i in 0..<phone.count {
        if i < phone.count - 4 {
            phone[i] = "*"
        }
    }
    return String(phone)
}
