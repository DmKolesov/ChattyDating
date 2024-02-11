import UIKit

class MatchedViewController: UIViewController {
    
    private var matchedCollectionView: UICollectionView!
    private let presenter: MatchedPresenter
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(presenter: MatchedPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchMockData()
    }
    
}

extension MatchedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = presenter.item(at: indexPath) else { return UICollectionViewCell() }
        switch item {
        
        case .post(let viewModel):
            return collectionView
                .dequeueReusableCell(MatchedCollectionViewCell.self, for: indexPath)
                .bind(viewModel)
        }
    }
}

private extension MatchedViewController {
    func setupUI() {
        let layout = CustomCollectioViewLayout.createCarouselLayout()
        matchedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        matchedCollectionView.delegate = self
        matchedCollectionView.dataSource = self
        matchedCollectionView.register(MatchedCollectionViewCell.self, forCellWithReuseIdentifier: MatchedCollectionViewCell.identifier)
        
        view.addSubview(matchedCollectionView)
        matchedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            matchedCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            matchedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            matchedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            matchedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
