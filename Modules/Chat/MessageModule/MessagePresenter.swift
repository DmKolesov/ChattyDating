import UIKit

final class MessagePresenter: ItemsPresentable  {
    private var dataSource = MessageDataSource()
    private(set) var items: [MessageDataSource.Item] = []
    
    func item(at indexPath: IndexPath) -> MessageDataSource.Item? {
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
