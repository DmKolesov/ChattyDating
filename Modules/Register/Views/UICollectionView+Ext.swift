
import UIKit

protocol ReusableCollectionViewCell {
    static var identifier: String { get }
}

extension UICollectionViewCell: ReusableCollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellDescribable {  }

extension UICollectionView {

    typealias BindableCell = UICollectionViewCell & CellBindable // UICollectionViewCell & CellDescribable & CellBindable

    /// T: UICollectionViewCell & CellDescribable
    func dequeueReusableCell<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withReuseIdentifier identifier: String,
                                                      for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }

        return cell
    }

    func dequeueReusableCell<T: BindableCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath)
    }

    func dequeueReusableCell<T: BindableCell>(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }

        return cell
    }

    func reload(rows: [IndexPath]) {
        if rows.isEmpty {
            reloadData()
        } else {
            reloadItems(at: rows)
        }
    }
}
