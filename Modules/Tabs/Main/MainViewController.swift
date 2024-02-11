import UIKit

import UIKit

class MainViewController: UIViewController {
    
    //delete
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private let backgroundView = FeedGradientView()
    private let settingsButton = UIButton()
    private let notificationButton = UIButton()
    private var topStackView = UIStackView()
    private let searchBar = CustomSearchBar()
    private var storiesCollectionView: UICollectionView!
    private let storiesbackgoundView = UIImageView()
    private var postTableView = UITableView()
    
    private let presenter: MainPresenter
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(presenter: MainPresenter) {
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

// MARK: UICollectionView
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = presenter.item(at: indexPath) else { return UICollectionViewCell() }

        switch item {
        case .text(let viewModel):
            return collectionView
                .dequeueReusableCell(StoriesCell.self, for: indexPath)
                .bind(viewModel)
        case .image(let viewModel):
            return collectionView
                .dequeueReusableCell(StoriesCell.self, for: indexPath)
                .bind(viewModel)
        }
    }
}
// MARK: UITableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.itemCount
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let item = presenter.item(at: indexPath) else { return UITableView.automaticDimension }
        switch item {
        
        case .text(_):
            return 200
        case .image(_):
            return 500
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.item(at: indexPath) else { return UITableViewCell() }

        switch item {
        case .text(let viewModel):
            return tableView
                .dequeueReusableCell(PostTextCell.self, for: indexPath)
                .bind(viewModel)
        case .image(let viewModel):
            return tableView
                .dequeueReusableCell(PostImageCell.self, for: indexPath)
                .bind(viewModel)
        }
    }
}

private extension MainViewController {
    func setupUI() {
        setupBackroundView()
        setupMainStack()
        setupButton()
        setupSearchBar()
        setupStoriesBackgroundView()
        setupCollectionView()
        setupTableView()
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
    func setupMainStack() {
        topStackView = SettingsNotificationView(settingsButton: settingsButton, notificationButton: notificationButton)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight * 0.05),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidth * 0.05),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidth * 0.05),
        ])
    }
    
    func setupSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupStoriesBackgroundView() {
        storiesbackgoundView.image = AssetConstants.Image.Common.backgroundMainStories
        storiesbackgoundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storiesbackgoundView)
        
        let screenHeight = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            storiesbackgoundView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            storiesbackgoundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storiesbackgoundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storiesbackgoundView.heightAnchor.constraint(equalToConstant: screenHeight * 0.1068)
            
        ])
    }
    
    func setupCollectionView() {
        storiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomCollectioViewLayout.createStoriesLayout())
        storiesCollectionView.showsHorizontalScrollIndicator = false
        storiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        storiesCollectionView.backgroundColor = .clear
        storiesCollectionView.register(StoriesCell.self, forCellWithReuseIdentifier: StoriesCell.identifier)
        view.addSubview(storiesCollectionView)

        NSLayoutConstraint.activate([
            storiesCollectionView.topAnchor.constraint(equalTo: storiesbackgoundView.topAnchor),
            storiesCollectionView.leadingAnchor.constraint(equalTo: storiesbackgoundView.leadingAnchor),
            storiesCollectionView.trailingAnchor.constraint(equalTo: storiesbackgoundView.trailingAnchor, constant: -5),
            storiesCollectionView.bottomAnchor.constraint(equalTo: storiesbackgoundView.bottomAnchor)
        ])
    }
    func setupTableView() {
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postTableView)
        postTableView.showsVerticalScrollIndicator = false
        postTableView.showsHorizontalScrollIndicator = false
        postTableView.separatorStyle = .none
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(PostImageCell.self, forCellReuseIdentifier: PostImageCell.identifier)
        postTableView.register(PostTextCell.self, forCellReuseIdentifier: PostTextCell.identifier)
        postTableView.backgroundColor = .clear

        
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: storiesbackgoundView.bottomAnchor, constant: 5),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupButton() {
        settingsButton.addTarget(self, action:  #selector(didTapSettingsButton), for: .touchUpInside)
        notificationButton.addTarget(self, action:  #selector(didTapNotificationButton), for: .touchUpInside)
    }
}

