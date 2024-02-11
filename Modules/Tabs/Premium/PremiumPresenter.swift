import Foundation

final class PremiumPresenter: ItemsPresentable {
    private var dataSource = PremiumDataSource()
    private(set) var items: [PremiumDataSource.Item] = []
    
    func item(at indexPath: IndexPath) -> PremiumDataSource.Item? {
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

