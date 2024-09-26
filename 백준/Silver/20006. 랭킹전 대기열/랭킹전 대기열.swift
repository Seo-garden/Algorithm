import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let playerCount = input[0], roomCapacity = input[1]

var rooms: [[(level: Int, nickname: String)]] = []

for _ in 0..<playerCount {
    let playerInput = readLine()!.split(separator: " ")
    let playerLevel = Int(playerInput[0])!
    let playerNickname = String(playerInput[1])
    
    var enteredRoom = false
    
    // 방 탐색
    for i in 0..<rooms.count {
        let firstPlayer = rooms[i].first! // 강제 언래핑
        // 첫 번째 플레이어의 레벨 기준으로 -10 ~ +10 범위 확인
        if playerLevel >= firstPlayer.level - 10 && playerLevel <= firstPlayer.level + 10 && rooms[i].count < roomCapacity {
            rooms[i].append((level: playerLevel, nickname: playerNickname))
            enteredRoom = true
            break
        }
    }
    
    // 입장 가능한 방이 없다면 새로운 방 생성
    if !enteredRoom {
        rooms.append([(level: playerLevel, nickname: playerNickname)])
    }
}

// 결과 출력
for room in rooms {
    // 방 내 플레이어 정렬 (닉네임 기준)
    let sortedRoom = room.sorted { $0.nickname < $1.nickname }
    
    // 방 상태 출력
    if sortedRoom.count == roomCapacity {
        print("Started!")
    } else {
        print("Waiting!")
    }
    
    // 정렬된 플레이어 출력
    for player in sortedRoom {
        print("\(player.level) \(player.nickname)")
    }
}