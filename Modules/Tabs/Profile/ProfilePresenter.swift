//import UIKit
//
//final class ProfilePresenter {
//    
//    private(set) var sections: [ProfileDataSource.Sections] = []
//    private let dataSource: ProfileDataSource = ProfileDataSource()
//    
//    private let router: ProfileRouter = ProfileRouterImpl()
//
//    func display() {
//        //Handlers from button
//
//        let settingsHandler: () -> Void = {
//            print("settingsHandler.settingsAction")
//        }
//        let notificationHandler: () -> Void = {
//            print("notificationHandler.notificationsAction")
//        }
//        let macthHandler: () -> Void = {
//            print("notificationHandler.matchAction")
//        }
//        let messageHandler: () -> Void = { [weak self] in
//            print("messageHandler.messageAction")
//            guard let self = self else {
//                return
//            }
//    
//            print("controller.navigationController?.pushViewController")
//      
//        }
//     
//        let handlers = ProfileDataSource.UserProfileViewHandlers(
//            settingsAction: settingsHandler,
//            notificationsAction: notificationHandler,
//            matchAction: macthHandler,
//            messageAction: messageHandler
//        )
//
//        // Actual:
//
//        let actualStoriesHandler: (ActualStoriesCellViewModel) -> Void = { _ in
//            print("let actualStoriesHandler: (ActualStoriesCellViewModel) -> Void = { _ in")
//        }
//        
//        let addActualStoriesHandler: (AddActualCellViewModel) -> Void = {_ in
//            print(" let addActualStoriesHandler: () -> Void = {")
//        }
//        
//        let handlerActualStoriesSectionViewModel = ActualStoriesSectionViewModel.Handler { item in
//            switch item {
//            case .actual(let viewModel):
//                actualStoriesHandler(viewModel)
//            case .addActual(let viewModel):
//                addActualStoriesHandler(viewModel)
//            }
//        }
//    
//        let stories = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
//        
//        let actualStoriesViewModel = ActualStoriesSectionViewModel(
//            items: ActualStoriesSectionViewModel.mockDataActualViewModel().map { .actual($0) },
//            handler: handlerActualStoriesSectionViewModel, stories: stories)
//        
//        // AddActual
//        let addActualViewModel = AddActualCellViewModel(handler: nil)
//        
//        let actualStoriesSectionViewModel = ActualStoriesSectionViewModel(
//            items: actualStoriesViewModel.items +
//                [.addActual(addActualViewModel)],
//            handler: handlerActualStoriesSectionViewModel, stories: stories)
//        
//        
//        // Posts: simple for now
//        let postViewModel = UserPostsSectionViewModel(
//            items: UserPostsSectionViewModel.mockPosts().map {
//            .posts($0)
//        })
//        let postSectionViewModel = UserPostsSectionViewModel(items: postViewModel.items)
//        
//        //loot
//        sections = [
//            .userProfileInfo(UserProfileInfoSectionViewModel(handlers: handlers)),
//            .actualStories(actualStoriesSectionViewModel),
//            .userPersonalInfo(UserPersonalInfoSectionViewModel()),
//            .posts(postSectionViewModel)
//        ]
//        dataSource.update(with: sections, handlers: handlers)
//
//    }
//    
//    private func didSelectItemIn(at indexPath: IndexPath) {
//        let section = sections[indexPath.row]
//
//        switch section {
//        case .userProfileInfo(_):
//            print("tap userProfileInfo in presenter didSelectItem")
//        case .actualStories(let viewModel):
//            guard indexPath.row < viewModel.items.count else {
//                print("Index out of bounds for actualStories items")
//                return
//            }
//            
//            let selectedItem = viewModel.items[indexPath.row]
//            switch selectedItem {
//            case .actual(let actualViewModel):
//                viewModel.handler.selected(.actual(actualViewModel))
//            case .addActual(let addActualViewModel):
//                viewModel.handler.selected(.addActual(addActualViewModel))
//            }
//
//        case .userPersonalInfo(_):
//            print("tap userPersonalInfo in presenter didSelectItem")
//        case .posts(_):
//            print("tap posts in presenter didSelectItem")
//        }
//    }
//
//    func didSelectItem(at indexPath: IndexPath) {
//        didSelectItemIn(at: indexPath)
//    }
//    
//    func presentConversationController(from controller: UIViewController) {
//        router.presentMessageModule(from: controller)
//    }
//}
