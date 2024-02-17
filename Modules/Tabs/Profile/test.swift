import UIKit

final class ProfileDataSource {

}

struct UserProfileInfoSectionViewModel {

    let handlers: ProfilePresenter.Handlers
}

struct ActualStoriesSectionViewModel {
    struct Handler {
        let selected: (Item) -> Void
    }
    
    enum Item {
        case actual(ActualStoriesCellViewModel)
        case addActual(AddActualCellViewModel)
    }
    
    let items: [Item]
    let handler: Handler
    let stories: ActualStoriesCellViewModel?
}

struct UserPersonalInfoSectionViewModel {}

struct UserPostsSectionViewModel {
    enum Item {
        case posts(PostCellViewModel)
    }
    let items: [Item]

    init(items: [Item]) {
        self.items = items
    }
}

struct ActualStoriesCellViewModel {
    let stories: UIImage?
}

struct AddActualCellViewModel {
    let handler: (() -> Void)?
}

struct PostCellViewModel {
    let posts: UIImage?
}

extension ActualStoriesSectionViewModel {
    static func mockDataActualViewModel() -> [ActualStoriesCellViewModel] {
        let stories = (1...6).map { _ in ActualStoriesCellViewModel(stories: UIImage(named: "diana")) }
        return stories
    }
}

extension UserPostsSectionViewModel {
    static func mockPosts() -> [PostCellViewModel] {
        let posts = (1...19).map { _ in PostCellViewModel(posts: UIImage(named: "diana")) }
        return posts
    }
}

final class ProfilePresenter {
    enum Section {
        case userProfileInfo(UserProfileInfoSectionViewModel)
        case actualStories(ActualStoriesSectionViewModel)
        case userPersonalInfo(UserPersonalInfoSectionViewModel)
        case posts(UserPostsSectionViewModel)
    }
    
    struct Handlers {
        var settingsAction: (() -> Void)?
        var notificationsAction: (() -> Void)?
        var matchAction: (() -> Void)?
        var messageAction: (() -> Void)?
    }
    
    private(set) var sections: [Section] = []
    private let router: ProfileRouter
    var handlers: Handlers
    
    init(
         router: ProfileRouter = ProfileRouterImpl(),
         handlers: Handlers = Handlers()
    ) {
   
        self.router = router
        self.handlers = handlers
    }

    func display(on viewController: UIViewController) {
        let settingsHandler: () -> Void = { [weak self] in
            print("settingsHandler.settingsAction")
        }
        let notificationHandler: () -> Void = {
            print("notificationHandler.notificationsAction")
        }
        let macthHandler: () -> Void = {
            print("notificationHandler.matchAction")
        }
        let messageHandler: () -> Void = { [weak self] in
            print("messageHandler.messageAction")
            guard let self = self else { return }
            self.presentMessageController(from: viewController)
            print("controller.navigationController?.pushViewController")
        }

        handlers = Handlers(
            settingsAction: settingsHandler,
            notificationsAction: notificationHandler,
            matchAction: macthHandler,
            messageAction: messageHandler
        )
        let actualStoriesHandler: (ActualStoriesCellViewModel) -> Void = { _ in
            print("let actualStoriesHandler: (ActualStoriesCellViewModel) -> Void = { _ in")
        }

        let addActualStoriesHandler: (AddActualCellViewModel) -> Void = { _ in
            print(" let addActualStoriesHandler: () -> Void = {")
        }

        let handlerActualStoriesSectionViewModel = ActualStoriesSectionViewModel.Handler { item in
            switch item {
            case .actual(let viewModel):
                actualStoriesHandler(viewModel)
            case .addActual(let viewModel):
                addActualStoriesHandler(viewModel)
            }
        }

        let stories = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))

        let actualStoriesViewModel = ActualStoriesSectionViewModel(
            items: ActualStoriesSectionViewModel.mockDataActualViewModel().map { .actual($0) },
            handler: handlerActualStoriesSectionViewModel,
            stories: stories
        )

        let addActualViewModel = AddActualCellViewModel(handler: nil)

        let actualStoriesSectionViewModel = ActualStoriesSectionViewModel(
            items: actualStoriesViewModel.items + [.addActual(addActualViewModel)],
            handler: handlerActualStoriesSectionViewModel,
            stories: stories
        )
        let postViewModel = UserPostsSectionViewModel(
            items: UserPostsSectionViewModel.mockPosts().map {
            .posts($0)
        })
        let postSectionViewModel = UserPostsSectionViewModel(items: postViewModel.items)
        
        let userProfileInfoSection = UserProfileInfoSectionViewModel(handlers: handlers)
        

        sections = [
                  .userProfileInfo(userProfileInfoSection),
                  .actualStories(actualStoriesSectionViewModel),
                  .userPersonalInfo(UserPersonalInfoSectionViewModel()),
                  .posts(postSectionViewModel)
              ]
      
    }

    private func didSelectItemIn(at indexPath: IndexPath) {
        guard indexPath.row < sections.count else {
            print("Index out of bounds for sections")
            return
        }

        let section = sections[indexPath.row]

        switch section {
        case .userProfileInfo(_):
            print("tap userProfileInfo in presenter didSelectItem")
        case .actualStories(let viewModel):
            guard let selectedItem = viewModel.items[safe: indexPath.row] else {
                print("Index out of bounds for actualStories items")
                return
            }

            switch selectedItem {
            case .actual(let actualViewModel):
                viewModel.handler.selected(.actual(actualViewModel))
            case .addActual(let addActualViewModel):
                viewModel.handler.selected(.addActual(addActualViewModel))
            }
        case .userPersonalInfo(_):
            print("tap userPersonalInfo in presenter didSelectItem")
        case .posts(_):
            print("tap posts in presenter didSelectItem")
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        didSelectItemIn(at: indexPath)
    }

    func presentMessageController(from controller: UIViewController) {
        router.presentMessageModule(from: controller)
    }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

