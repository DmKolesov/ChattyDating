import UIKit

struct MainDataSource {
    var items: [Item] = []
    enum Item {
        case text(MainViewModel)
        case image(MainViewModel)

    }
// Mock data
    mutating func mockData() {
          items = MainViewModel.mockDataArray().compactMap { viewModel in
              if viewModel.postMessage != nil {
                  return .text(viewModel)
              } else if viewModel.postImage != nil {
                  return .image(viewModel)
              } else {
                  return nil
              }
          }
      }
}
