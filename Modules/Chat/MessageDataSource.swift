import UIKit

struct MessageDataSource {
    var items: [Item] = []
    
    enum Item {
        case message(MessageViewModel)

    }

    mutating func mockData() {
        items = MessageViewModel.mockData().compactMap { viewModel  in
            return .message(viewModel)
        }
      }
}
