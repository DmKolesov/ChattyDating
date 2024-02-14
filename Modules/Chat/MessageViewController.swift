import UIKit

final class MessageViewController: UIViewController {
    private let backgroundView = ChatGradientView()
    private let settingsButton = UIButton()
    private let notificationButton = UIButton()
    private var topStackView = UIStackView()
    private let searchBar = CustomSearchBar()
    private var messageTableView = UITableView()
    
    private let presenter: MessagePresenter
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(presenter: MessagePresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.item(at: indexPath) else { return UITableViewCell() }
        switch item {
        
        case .message(let viewModel):
            return tableView.dequeueReusableCell(
                MessageCell.self,
                for: indexPath).bind(viewModel)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

private extension MessageViewController {
    func setup() {
        setupBackroundView()
        setupMainStack()
        setupSearchBar()
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
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.05),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.05),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width * 0.05),
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
    func setupTableView() {
        messageTableView.translatesAutoresizingMaskIntoConstraints = false
        messageTableView.backgroundColor = .clear
        messageTableView.showsVerticalScrollIndicator = false
        messageTableView.showsHorizontalScrollIndicator = false
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        view.addSubview(messageTableView)
        NSLayoutConstraint.activate([
            messageTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            messageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
