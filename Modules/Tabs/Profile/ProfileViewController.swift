import UIKit

final class ProfileViewController: UIViewController {
    
    private let backgroundGradientView: ProfileGradientView = ProfileGradientView()
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
        presenter.display(on: self)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = presenter.sections[indexPath.row]
        
        switch section {
        
        case .userProfileInfo(let viewModel):
            let cell: ControlTableViewCell = tableView
                .dequeueReusableCell(
                    withIdentifier: ControlTableViewCell.identifier,
                    for: indexPath)
            return cell.bind(viewModel)
            
        case .actualStories(let viewModel):
            let cell: ActualStoriesTableViewCell = tableView
                .dequeueReusableCell(
                    withIdentifier: ActualStoriesTableViewCell.identifier,
                    for: indexPath)
            return cell.bind(viewModel, collectionViewHandlers: viewModel.handler)
        case .userPersonalInfo(_):
            let cell: InfoTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: InfoTableViewCell.identifier,
                for: indexPath)
            return cell
        case .posts(let viewModel):
            let cell: UserPostsTableViewCell = tableView
                .dequeueReusableCell(
                    withIdentifier: UserPostsTableViewCell.identifier,
                    for: indexPath)
            return cell.bind(viewModel)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = presenter.sections[indexPath.row]

        switch section {

        case .userProfileInfo(_):
            return 370
        case .actualStories(_):
            return 100
        case .userPersonalInfo(_):
            return 200
        case .posts(_):
            return 1000
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
}

private extension ProfileViewController {
    func setup() {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.separatorStyle = .none
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.backgroundView = backgroundGradientView
        profileTableView.register(ControlTableViewCell.self, forCellReuseIdentifier: ControlTableViewCell.identifier)
        profileTableView.register(ActualStoriesTableViewCell.self, forCellReuseIdentifier: ActualStoriesTableViewCell.identifier)
        profileTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        profileTableView.register(UserPostsTableViewCell.self, forCellReuseIdentifier: UserPostsTableViewCell.identifier)
        view.addSubview(profileTableView)
        
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


