import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var p = 0
    var y = 0
    
    s.map {
        if $0 == "p" || $0 == "P" {
            p += 1
        } else if $0 == "y" || $0 == "Y" {
            y += 1
        }
    }
    if p == y { ans = true } else { ans = false }
    return ans
}
