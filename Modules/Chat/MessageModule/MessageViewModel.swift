import UIKit

struct MessageViewModelTest {
    struct Handler {
        let selected: () -> Void
    }
    enum Item {
        case message
    }
}

struct MessageViewModel {
    let avatarImage: UIImage?
    let userName: String
    let messageTitle: String
    
    let timeSent: String
    let numerOfUnread: String
}

//MockData

extension MessageViewModel {
    static func mockData() -> [MessageViewModel] {
        let oleg = MessageViewModel(
            avatarImage: UIImage(named: "diana"),
            userName: "Diana Montana",
            messageTitle: "Hello!",
            timeSent: "23:59",
            numerOfUnread: "2"
        )

        
        var result: [MessageViewModel] = []
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        result.append(oleg)
        return result
    }
}
