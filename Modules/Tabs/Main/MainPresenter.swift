import Foundation

protocol ItemsPresentable {
    associatedtype Item
    var items: [Item] { get }
    func item(at indexPath: IndexPath) -> Item?
}

extension ItemsPresentable {
    func item(at index: Int) -> Item? {
        guard 0..<items.count ~= index else { return nil }

        return items[index]
    }
}


final class MainPresenter: ItemsPresentable {
    
    private var dataSource = MainDataSource()
    private(set) var items: [MainDataSource.Item] = []

    func item(at indexPath: IndexPath) -> MainDataSource.Item? {
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
