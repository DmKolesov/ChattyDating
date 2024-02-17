import UIKit

//final class ProfileDataSource {
//    // tableView sections
//    enum Sections {
//        case userProfileInfo(UserProfileInfoSectionViewModel)
//        case actualStories(ActualStoriesSectionViewModel)
//        case userPersonalInfo(UserPersonalInfoSectionViewModel)
//        case posts(UserPostsSectionViewModel)
//    }
//    // tap button handlers
//    struct UserProfileViewHandlers {
//        var settingsAction: (() -> Void)?
//        var notificationsAction: (() -> Void)?
//        var matchAction: (() -> Void)?
//        var messageAction: (() -> Void)?
//    }
//
//    private var sections: [ProfileDataSource.Sections] = []
//    private var handlers: UserProfileViewHandlers?
//
//
//    func update(with sections: [Sections], handlers: UserProfileViewHandlers) {
//        self.sections = sections
//        self.handlers = handlers
//        print("Updated ProfileDataSource with sections count: \(sections.count)")
//    }
//
//}
//// MARK: - ViewModel for Section
//struct UserProfileInfoSectionViewModel {
//    let handlers: ProfileDataSource.UserProfileViewHandlers
//}
//
//struct ActualStoriesSectionViewModel {
//    struct Handler {
//        let selected: (Item) -> Void
//    }
//    enum Item {
//        case actual(ActualStoriesCellViewModel)
//        case addActual(AddActualCellViewModel)
//    }
//    let items: [Item]
//    let handler: Handler
//
//    let stories: ActualStoriesCellViewModel?
//
//}
//struct UserPersonalInfoSectionViewModel {}
//
//struct UserPostsSectionViewModel {
//    enum Item {
//        case posts(PostCellViewModel)
//    }
//    let items: [Item]
//
//    init(items: [Item]) {
//        self.items = items
//    }
//}
//
//// MARK: - ViewModel for collectionViewCell
//
//struct ActualStoriesCellViewModel {
//    let stories: UIImage?
//}
//
//struct AddActualCellViewModel {
//    let handler: (() -> Void)?
//}
//
//struct PostCellViewModel {
//    let posts: UIImage?
//}
//
//// MARK: - MockData For CellViewModels

//extension ActualStoriesSectionViewModel {
//    static func mockDataActualViewModel() -> [ActualStoriesCellViewModel] {
//        let stories1 = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//        let stories2 = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//        let stories3 = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//
//
//        let stories4 = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//        let stories5 = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//        let stories6 = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//
//        var result: [ActualStoriesCellViewModel] = []
//        result.append(stories1)
//        result.append(stories2)
//        result.append(stories3)
//        result.append(stories4)
//        result.append(stories5)
//        result.append(stories6)
//        return result
//    }
//}
//
//extension UserPostsSectionViewModel {
//    static func mockPosts() -> [PostCellViewModel] {
//        let post1 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post2 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post3 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post4 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post5 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post6 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post7 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post8 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post9 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post10 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post12 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post13 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post14 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post15 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post16 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post17 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post18 = PostCellViewModel(posts: UIImage(named: "diana"))
//        let post19 = PostCellViewModel(posts: UIImage(named: "diana"))
//
//
//
//
//        var result: [PostCellViewModel] = []
//        result.append(post1)
//        result.append(post2)
//        result.append(post3)
//        result.append(post4)
//        result.append(post5)
//        result.append(post6)
//        result.append(post7)
//        result.append(post8)
//        result.append(post9)
//        result.append(post10)
//        result.append(post12)
//        result.append(post13)
//        result.append(post17)
//        result.append(post14)
//        result.append(post15)
//        result.append(post16)
//        result.append(post18)
//        result.append(post19)
//        return result
//    }
//}
//
