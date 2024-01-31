//
//  UITableView+Ext.swift
//  ChattyDating
//
//  Created by admin on 31.01.2024.
//

import UIKit
protocol CellDescribable {
    static var identifier: String { get }
}

protocol CellBindable {
    associatedtype Item

    @discardableResult
    func bind(_ item: Item) -> Self
}

extension CellDescribable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellDescribable {  }

extension UITableViewHeaderFooterView: CellDescribable {  }

extension UITableView {

    typealias BindableCell = UITableViewCell & CellBindable // UITableViewCell & CellDescribable & CellBindable

    func register<T: UITableViewCell>(_ cell: T.Type) { // T: UITableViewCell & CellDescribable
        register(cell, forCellReuseIdentifier: cell.identifier)
    }

    /// T: UITableViewCell & CellDescribable
    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath)
    }

    func dequeueReusableCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }

        return cell
    }

    func dequeueReusableCell<T: BindableCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath)
    }

    func dequeueReusableCell<T: BindableCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }

        return cell
    }

    func reload(rows: [IndexPath], animation: UITableView.RowAnimation = .automatic) {
        if rows.isEmpty {
            reloadData()
        } else {
            beginUpdates()
            reloadRows(at: rows, with: animation)
            endUpdates()
        }
    }
}
