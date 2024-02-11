import UIKit

struct PostMatchedDataSource {
    var items: [Item] = []
    
    enum Item {
        case post(MatchedViewModel)
        
    }
    
    mutating func mockData() {
        items = MatchedViewModel.mockData().compactMap { viewModel  in
            return .post(viewModel)
        }
    }
}
