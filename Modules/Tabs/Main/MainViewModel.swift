import UIKit

struct MainViewModel {
    let username: String
    let lastOnline: String
    let avatarImage: String
    
    let postMessage: String?
    let postImage: UIImage?
    
    let likes: String?
    
    init(username: String,
         lastOnline: String,
         avatarImage: String,
         postMessage: String?,
         postImage: UIImage?,
         likes: String?) {
        self.username = username
        self.lastOnline = lastOnline
        self.avatarImage = avatarImage
        self.postMessage = postMessage
        self.postImage = postImage
        self.likes = likes
    }
}

// Mock data
extension MainViewModel {
    static func mockDataArray() -> [MainViewModel] {
        let elementWithImageCat = MainViewModel(
            username: "Mister Lokh",
            lastOnline: "1 hour ago",
            avatarImage: "cat",
            postMessage: nil,
            postImage:  UIImage(named: "cat"),
            likes: nil
        )

        let elementWithCatText = MainViewModel(
            username: "Mister Lokh",
            lastOnline: "1 hour ago",
            avatarImage: "cat",
            postMessage: "Обязанности усатого работника выходят за рамки охоты на грызунов...",
            postImage: nil,
            likes: nil
        )

        let femaleWithImage = MainViewModel(
            username: "thick eyebroWs",
            lastOnline: "online",
            avatarImage: "yellow",
            postMessage: nil,
            postImage: UIImage(named: "yellow"),
            likes: nil
        )

        let edImage = MainViewModel(
            username: "Ed Sheeran",
            lastOnline: "5 minutes ago",
            avatarImage: "young-fashionable-man-in-the-shadows",
            postMessage: nil,
            postImage: UIImage(named: "young-fashionable-man-in-the-shadows"),
            likes: nil
        )

        let edText = MainViewModel(
            username: "Ed Sheeran",
            lastOnline: "5 minutes ago",
            avatarImage: "young-fashionable-man-in-the-shadows",
            postMessage: "Быть или не быть, кто знает ответ на этот прекрасный вопрос, уже много дней я думаю о прекрасной женщине. но увы и ах слышу от нее лишь то что мы друзья, но мало ли у меня друзей ? зачем мне много, ведь как говорил Аристотель, друг всех = ничей друг, а она мне тоже не друг DAMN",
            postImage: nil,
            likes: nil
        )

        var result: [MainViewModel] = []
        result.append(elementWithImageCat)
        result.append(elementWithCatText)
        result.append(femaleWithImage)
        result.append(edImage)
        result.append(edText)
        result.append(elementWithImageCat)
        result.append(elementWithCatText)
        result.append(femaleWithImage)
        result.append(edImage)
        result.append(edText)
        result.append(elementWithImageCat)
        result.append(elementWithCatText)
        result.append(femaleWithImage)
        result.append(edImage)
        result.append(edText)
        result.append(elementWithImageCat)
        result.append(elementWithCatText)
        result.append(femaleWithImage)
        result.append(edImage)
        result.append(edText)
        result.append(elementWithImageCat)
        result.append(elementWithCatText)
        result.append(femaleWithImage)
        result.append(edImage)
        result.append(edText)
        result.append(elementWithImageCat)
        result.append(elementWithCatText)
        result.append(femaleWithImage)
        result.append(edImage)
        result.append(edText)
        return result
    }
}
