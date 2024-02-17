import UIKit

final class ActualStoriesTableViewCell: UITableViewCell {
    
    private var actualStoriesCollectionView: UICollectionView!
    private var viewModel: ActualStoriesSectionViewModel?
    
    var handlers: ActualStoriesSectionViewModel.Handler?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupActuAlStoriesCollectionView()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupActuAlStoriesCollectionView()
    }

//    func bind(_ item: ActualStoriesSectionViewModel) -> Self {
//        self.viewModel = item
//        self.handlers = item.handler
//        return self
//    }
    
    func bind(_ item: ActualStoriesSectionViewModel, collectionViewHandlers: ActualStoriesSectionViewModel.Handler) -> Self {
        self.viewModel = item
        self.handlers = collectionViewHandlers
        actualStoriesCollectionView.reloadData()
        item.items.forEach { item in
            switch item {
            case .actual(let actualViewModel):
                print("case .actual in ActualStoriesTableViewCell")
            case .addActual(let addActualViewModel):
                print("case .addActual in ActualStoriesTableViewCell")
            }
        }

        return self
    }

}

extension ActualStoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = viewModel?.items[indexPath.row] else { return UICollectionViewCell() }
        
        switch item {
        
        case .actual(let viewModel):
            return collectionView
                .dequeueReusableCell(ActualCell.self, for: indexPath)
                .bind(viewModel)
        case .addActual:
            return collectionView
                .dequeueReusableCell(AddActualStoriesCell.self, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select item at indexPath: \(indexPath)")

        guard let item = viewModel?.items[indexPath.row] else {
            print("Item is nil")
            return
        }

        viewModel?.handler.selected(item)
        print("Selected item at indexPath: \(indexPath) in ActualStoriesTableViewCell")
    }

}

private extension ActualStoriesTableViewCell {
    func setupActuAlStoriesCollectionView() {
        backgroundColor = .clear
        selectionStyle = .none
        actualStoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomCollectioViewLayout.createStoriesLayout())
        actualStoriesCollectionView.showsHorizontalScrollIndicator = false
        actualStoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        actualStoriesCollectionView.delegate = self
        actualStoriesCollectionView.dataSource = self
        
        actualStoriesCollectionView.showsHorizontalScrollIndicator = false
        actualStoriesCollectionView.backgroundColor = .clear
        actualStoriesCollectionView.isUserInteractionEnabled = true
        actualStoriesCollectionView.register(ActualCell.self, forCellWithReuseIdentifier: ActualCell.identifier)
        actualStoriesCollectionView.register(AddActualStoriesCell.self, forCellWithReuseIdentifier: AddActualStoriesCell.identifier)
        contentView.addSubview(actualStoriesCollectionView)
        
        NSLayoutConstraint.activate([
            actualStoriesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            actualStoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            actualStoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            actualStoriesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
