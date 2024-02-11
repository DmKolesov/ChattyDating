import UIKit

final class ProfilePresenter {
    private(set) var sections: [ProfileDataSource.Sections] = []
    private let dataSource: ProfileDataSource = ProfileDataSource()

    func display() {
        //Handlers from button

        let settingsHandler: () -> Void = {
            print("settingsHandler.settingsAction")
        }
        let notificationHandler: () -> Void = {
            print("notificationHandler.notificationsAction")
        }
        let macthHandler: () -> Void = {
            print("notificationHandler.matchAction")
        }
        let messageHandler: () -> Void = {
            print("messageHandler.messageAction")
        }
     
        let handlers = ProfileDataSource.UserProfileViewHandlers(
            settingsAction: settingsHandler,
            notificationsAction: notificationHandler,
            matchAction: macthHandler,
            messageAction: messageHandler)

        
        
        // Actual:

        let actualStoriesHandler: (ActualStoriesCellViewModel) -> Void = { _ in
            print("let actualStoriesHandler: (ActualStoriesCellViewModel) -> Void = { _ in")
        }
        
        let addActualStoriesHandler: (AddActualCellViewModel) -> Void = {_ in
            print(" let addActualStoriesHandler: () -> Void = {")
        }
        
        let handlerActualStoriesSectionViewModel = ActualStoriesSectionViewModel.Handler { item in
            switch item {
            case .actual(let viewModel):
                actualStoriesHandler(viewModel)
                print("tap actual")
            case .addActual(let viewModel):
                addActualStoriesHandler(viewModel)
                print("tap addActual")
            }
            print("tap collectionViewCell in handlerActualStoriesCellViewModel Presenter with \(item)")
        }
        
        let collectionViewHandlers = ProfileDataSource.Collectionhandlers(actualStories: actualStoriesHandler, addActualStories: addActualStoriesHandler)
        
        
        let stories = ActualStoriesCellViewModel(stories: UIImage(named: "diana"))
        
        let actualStoriesViewModel = ActualStoriesSectionViewModel(
            items: ActualStoriesSectionViewModel.mockDataActualViewModel().map { .actual($0) },
            handler: handlerActualStoriesSectionViewModel, stories: stories)
        
        // AddActual
        let addActualViewModel = AddActualCellViewModel(handler: nil)
        
        let actualStoriesSectionViewModel = ActualStoriesSectionViewModel(
            items: actualStoriesViewModel.items +
                [.addActual(addActualViewModel)],
            handler: handlerActualStoriesSectionViewModel, stories: stories)
        
        
        // Posts: simple for now
        let postViewModel = UserPostsSectionViewModel(
            items: UserPostsSectionViewModel.mockPosts().map {
            .posts($0)
        })
        let postSectionViewModel = UserPostsSectionViewModel(items: postViewModel.items)
        
        //loot
        sections = [
            .userProfileInfo(UserProfileInfoSectionViewModel(handlers: handlers)),
            .actualStories(actualStoriesSectionViewModel),
            .userPersonalInfo(UserPersonalInfoSectionViewModel()),
            .posts(postSectionViewModel)
        ]
//        sections = [
//            .userProfileInfo(UserProfileInfoSectionViewModel(handlers: handlers)),
//            .actualStories(actualStoriesSectionViewModel),
//            .userPersonalInfo(UserPersonalInfoSectionViewModel()),
//            .posts(postSectionViewModel)
//        ]
//        dataSource.update(with: sections, handlers: handlers)
        dataSource.updateSections(with: sections, buttonsHandlers: handlers, collectionHandlers: collectionViewHandlers)
    }

//
//    private func didSelectItem(at indexPath: IndexPath) {
//        let section = sections[indexPath.row]
//
//        switch section {
//
//        case .userProfileInfo(_):
//            print("tap userProfileInfo in presenter didSelectItem")
//        case .actualStories(let viewModel):
//               print("tap actualStories in presenter didSelectItem")
//               viewModel.handler.selected(.actual(ActualStoriesCellViewModel(stories: UIImage(named: "diana"))))
//        case .userPersonalInfo(_):
//            print("tap userPersonalInfo in presenter didSelectItem")
//        case .posts(_):
//            print("tap posts in presenter didSelectItem")
//        }
//
//    }
//
    
    private func didSelectItemIn(at indexPath: IndexPath) {
        let section = sections[indexPath.row]

        switch section {
        case .userProfileInfo(_):
            print("tap userProfileInfo in presenter didSelectItem")
        case .actualStories(let viewModel):
            print("tap actualStories in presenter didSelectItem")
            
            guard indexPath.row < viewModel.items.count else {
                print("Index out of bounds for actualStories items")
                return
            }

            let selectedItem = viewModel.items[indexPath.row]
            switch selectedItem {
            case .actual(let actualViewModel):
                print("tap actual")
                viewModel.handler.selected(.actual(actualViewModel))
                
                print("tap in collectionViewCell in \(indexPath.row)")
                print("tap in collectionViewCell in \(selectedItem)")
            case .addActual(let addActualViewModel):
                print("tap addActual")
                viewModel.handler.selected(.addActual(addActualViewModel))
            }

            print("tap collectionViewCell in handlerActualStoriesCellViewModel Presenter with \(selectedItem)")
        case .userPersonalInfo(_):
            print("tap userPersonalInfo in presenter didSelectItem")
        case .posts(_):
            print("tap posts in presenter didSelectItem")
        }
    }


    
    func didSelectItem(at indexPath: IndexPath) {
        didSelectItemIn(at: indexPath)
    }
}
