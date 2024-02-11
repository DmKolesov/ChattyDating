import Foundation

final class MatchedPresenter: ItemsPresentable {

    private var dataSource = PostMatchedDataSource()
    private(set) var items: [PostMatchedDataSource.Item] = []

    func item(at indexPath: IndexPath) -> PostMatchedDataSource.Item? {
        guard indexPath.row < dataSource.items.count else { return nil }
        return dataSource.items[indexPath.row]
     
    }
    var itemCount: Int {
           return dataSource.items.count
       }
       
       func fetchMockData() {
           dataSource.mockData()
       }
}

