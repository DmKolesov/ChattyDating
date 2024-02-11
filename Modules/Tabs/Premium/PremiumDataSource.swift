
import Foundation

struct PremiumDataSource {
    var items: [Item] = []
    enum Item {
        case post(PremiumViewModel)

    }

    mutating func mockData() {
        items = PremiumViewModel.mockArray().compactMap { viewModel  in
            return .post(viewModel)
        }
      }
}
