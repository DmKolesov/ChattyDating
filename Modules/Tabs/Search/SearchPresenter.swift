import UIKit

final class SearchPresenter: ItemsPresentable {
    
    private var dataSource = PostSearchDataSource()
    private(set) var items: [PostSearchDataSource.Item] = []
    
    func item(at indexPath: IndexPath) -> PostSearchDataSource.Item? {
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
