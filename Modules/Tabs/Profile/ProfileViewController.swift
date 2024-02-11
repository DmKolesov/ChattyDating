

final class ActualCollectionViewCell: UICollectionViewCell {



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
private extension ActualCollectionViewCell {
    func setupUI() {

        backgroundColor = .red

}
}
import UIKit

final class ControlTableViewCell: UITableViewCell {
    private var actualStoriesCollectionView: UICollectionView!

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }
}
extension ControlTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActualCollectionViewCell.identifier, for: indexPath) as? ActualCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }


}

private extension ControlTableViewCell {
    func setup() {
        backgroundColor = .yellow
        selectionStyle = .none

        actualStoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomCollectioViewLayout.createStoriesLayout())

        actualStoriesCollectionView.showsHorizontalScrollIndicator = false
        actualStoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        actualStoriesCollectionView.delegate = self
        actualStoriesCollectionView.dataSource = self

        actualStoriesCollectionView.backgroundColor = .clear
        actualStoriesCollectionView.isUserInteractionEnabled = true
        actualStoriesCollectionView.register(ActualCollectionViewCell.self, forCellWithReuseIdentifier: ActualCollectionViewCell.identifier)

//        addSubview(actualStoriesCollectionView)
        contentView.addSubview(actualStoriesCollectionView)
        NSLayoutConstraint.activate([
            actualStoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            actualStoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            actualStoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            actualStoriesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}




import UIKit

final class ProfileViewController: UIViewController {

    private var profileTableView: UITableView = UITableView()

    private let presenter: ProfilePresenter

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: ProfilePresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ControlTableViewCell.identifier, for: indexPath) as? ControlTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }


}

private extension ProfileViewController {
    func setup() {
        setupTableView()
    }
    func setupTableView() {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.delegate = self
        profileTableView.dataSource = self

        profileTableView.register(ControlTableViewCell.self, forCellReuseIdentifier: ControlTableViewCell.identifier)
        view.addSubview(profileTableView)

        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
//import UIKit
//
//final class ProfileViewController: UIViewController {
//
//    private var profileTableView: UITableView = UITableView()
//    private let presenter: ProfilePresenter
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init(presenter: ProfilePresenter) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//}
//
//extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ControlTableViewCell.identifier, for: indexPath) as? ControlTableViewCell else {
//            return UITableViewCell()
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//}
//
//private extension ProfileViewController {
//    func setup() {
//        setupTableView()
//    }
//
//    func setupTableView() {
//        profileTableView.translatesAutoresizingMaskIntoConstraints = false
//        profileTableView.delegate = self
//        profileTableView.dataSource = self
//
//        profileTableView.register(ControlTableViewCell.self, forCellReuseIdentifier: ControlTableViewCell.identifier)
//        view.addSubview(profileTableView)
//
//        NSLayoutConstraint.activate([
//            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
//            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
//
//final class ActualCollectionViewCell: UICollectionViewCell {
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupUI() {
//        backgroundColor = .red
//    }
//}
//
//final class ControlTableViewCell: UITableViewCell {
//
//    private var actualStoriesCollectionView: UICollectionView!
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setup()
//    }
//}
//
//extension ControlTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10 // Adjust this based on your data source
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActualCollectionViewCell.identifier, for: indexPath) as? ActualCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        return cell
//    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        // Adjust the size of each cell
////        return CGSize(width: 50, height: 50)
////    }
//}
//
//private extension ControlTableViewCell {
//    func setup() {
//        backgroundColor = .yellow
//        selectionStyle = .none
//
//        actualStoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomCollectioViewLayout.createStoriesLayout())
//
//        actualStoriesCollectionView.showsHorizontalScrollIndicator = false
//        actualStoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        actualStoriesCollectionView.delegate = self
//        actualStoriesCollectionView.dataSource = self
//
//        actualStoriesCollectionView.backgroundColor = .clear
//        actualStoriesCollectionView.isUserInteractionEnabled = true
//        actualStoriesCollectionView.register(ActualCollectionViewCell.self, forCellWithReuseIdentifier: ActualCollectionViewCell.identifier)
//
//        contentView.addSubview(actualStoriesCollectionView)
//
//        NSLayoutConstraint.activate([
//            actualStoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            actualStoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            actualStoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            actualStoriesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//}
