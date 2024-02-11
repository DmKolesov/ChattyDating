import UIKit

final class UserPostsTableViewCell: UITableViewCell {
    
    private var postsCollectionView: UICollectionView!
    private var viewModel: UserPostsSectionViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPostsCollectionView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPostsCollectionView()
    }
    
    func bind(_ item: UserPostsSectionViewModel) -> Self {
        self.viewModel = item
        
        return self
    }
}
extension UserPostsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = viewModel?.items[indexPath.row] else { return UICollectionViewCell() }
        switch item {
        
        case .posts(let viewModel):
            return collectionView
                .dequeueReusableCell(UserPostCollectionCell.self, for: indexPath)
                .bind(viewModel)
        }
        
    }
}

private extension UserPostsTableViewCell {
    func setupPostsCollectionView() {
        backgroundColor = .clear
        selectionStyle = .none
        postsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomCollectioViewLayout.createInstagramLikeGridLayout())
        postsCollectionView.showsHorizontalScrollIndicator = false
        postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        postsCollectionView.backgroundColor = .clear
        
        postsCollectionView.register(UserPostCollectionCell.self, forCellWithReuseIdentifier: UserPostCollectionCell.identifier)
        
        contentView.addSubview(postsCollectionView)
        
        NSLayoutConstraint.activate([
            postsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            postsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
