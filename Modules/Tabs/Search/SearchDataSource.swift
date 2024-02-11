import UIKit

struct PostSearchDataSource {
    
    var items: [Item] = []
    
    enum Item {
        case post(SearchViewModel)

    }

    mutating func mockData() {
        items = SearchViewModel.mockArray().compactMap { viewModel  in
            return .post(viewModel)
        }
      }
}
