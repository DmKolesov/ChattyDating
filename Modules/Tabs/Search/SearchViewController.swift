import UIKit

final class SearchViewController: UIViewController {
    
    private let backgroundView = FeedGradientView()
    private let settingsButton = UIButton()
    private let notificationButton = UIButton()
    private var mainStackView = UIStackView()
    private let searchBar = CustomSearchBar()
    private var collectionView: UICollectionView!
    
    private let presenter: SearchPresenter
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(presenter: SearchPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchMockData()
    }
    
    @objc
    func didTapSettingsButton() {
        print("didTapSettingsButton")
    }
    @objc
    func didTapNotificationButton() {
        print("didTapNotificationButton")
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = presenter.item(at: indexPath) else { return UICollectionViewCell() }
        
        switch item {
        case .post(let viewModel):
            return collectionView
                .dequeueReusableCell(SearchCell.self, for: indexPath)
                .bind(viewModel)
        }
    }
}

private extension SearchViewController {
    func setupUI() {
        setupBackroundView()
        setupMainStack()
        setupButton()
        setupSearchBar()
        setupCollectionView()
    }
    func setupBackroundView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupButton() {
        settingsButton.addTarget(self, action:  #selector(didTapSettingsButton), for: .touchUpInside)
        notificationButton.addTarget(self, action:  #selector(didTapNotificationButton), for: .touchUpInside)
    }
    
    func setupMainStack() {
        mainStackView = SettingsNotificationView(settingsButton: settingsButton, notificationButton: notificationButton)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStackView)
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight * 0.05),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidth * 0.05),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidth * 0.05),
        ])
    }
    
    func setupSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func setupCollectionView() {
        let layout = CustomCollectioViewLayout.createPhotoCompositionalLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

