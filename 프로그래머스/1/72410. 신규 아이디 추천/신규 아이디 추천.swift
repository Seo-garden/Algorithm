import Foundation
//20250622 13:13 ~
func solution(_ new_id:String) -> String {
    var result = new_id.lowercased()
    let usable = "abcdefghijklnmopqrstuvwxyz-_.1234567890"
    var tempString = ""
    
    for char in result {
        if usable.contains(char) {
            tempString += String(char)
        }
    }
    result = tempString
    
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    
    if result.first == "." {
        result.removeFirst()
    }
    if result.last == "." {
        result.removeLast()
    }
    
    if result == "" {
        result += "a"
    }
    
    if result.count >= 15 {
        while result.count != 15 {
            result.removeLast()
        }
        
        if result.last == "." {
            result.removeLast()
        }
    }
    
    if result.count <= 2 {
        while result.count < 3 {
            result += String(result.last!)
        }
    }
    
    return String(result)
}
