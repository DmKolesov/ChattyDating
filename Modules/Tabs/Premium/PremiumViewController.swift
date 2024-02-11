import UIKit

final class PremiumViewController: UIViewController {
    
    private let backgroundView = FeedGradientView()
    private let settingsButton = UIButton()
    private let notificationButton = UIButton()
    private var mainStackView = UIStackView()
    private var premiumCollectionView: UICollectionView!
    private let mainView = UIView()
    private let presenter: PremiumPresenter
    
    var firstLikeStack = UIStackView()
    var secondBustStack = UIStackView()
    var thirdControlStack = UIStackView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(presenter: PremiumPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchMockData()
    }
    
    func fillMainFirstView() {
        let rectangleImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "background_premium_rectangle")
            view.translatesAutoresizingMaskIntoConstraints = false
           
            return view
        }()

        let firstStack = createPermissionView(permissonControl: true, title: "Безлимит лайков")
        let secondStack = createPermissionView(permissonControl: true, title: "Просмотр лайков")
        let thirdStack = createPermissionView(permissonControl: true, title: "Приоритетные лайки")
        
        firstLikeStack = UIStackView(arrangedSubviews: [firstStack, secondStack, thirdStack])
        firstLikeStack.translatesAutoresizingMaskIntoConstraints = false
        firstLikeStack.axis = .vertical
        firstLikeStack.spacing = 10
        firstLikeStack.distribution = .fillEqually
        mainView.addSubview(rectangleImage)
        
        NSLayoutConstraint.activate([
            rectangleImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 40),
            rectangleImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32),
            rectangleImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32),
            rectangleImage.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        view.addSubview(firstLikeStack)
        NSLayoutConstraint.activate([
            firstLikeStack.topAnchor.constraint(equalTo: rectangleImage.topAnchor, constant: 16),
            firstLikeStack.leadingAnchor.constraint(equalTo: rectangleImage.leadingAnchor, constant: 20),
            firstLikeStack.trailingAnchor.constraint(equalTo: rectangleImage.trailingAnchor),
            firstLikeStack.bottomAnchor.constraint(equalTo: rectangleImage.bottomAnchor, constant: -16)
        ])
    }
    
    func fillMainViewSecond() {
        let rectangleImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "background_premium_rectangle")
            view.translatesAutoresizingMaskIntoConstraints = false
           
            return view
        }()
        let firstStack = createPermissionView(permissonControl: false, title: "Перемотка без ограничений")
        let secondStack = createPermissionView(permissonControl: false, title: "1 бесплатный буст в месяц")
        let thirdStack = createPermissionView(permissonControl: false, title: "5 бесплатных суперлайков в неделю")
        
        secondBustStack = UIStackView(arrangedSubviews: [firstStack, secondStack, thirdStack])
        secondBustStack.translatesAutoresizingMaskIntoConstraints = false
        secondBustStack.axis = .vertical
        secondBustStack.spacing = 10
        secondBustStack.distribution = .fillEqually
        mainView.addSubview(rectangleImage)
        
        NSLayoutConstraint.activate([
            rectangleImage.topAnchor.constraint(equalTo: firstLikeStack.bottomAnchor, constant: 30),
            rectangleImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32),
            rectangleImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32),
            rectangleImage.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        view.addSubview(secondBustStack)
        NSLayoutConstraint.activate([
            secondBustStack.topAnchor.constraint(equalTo: rectangleImage.topAnchor, constant: 16),
            secondBustStack.leadingAnchor.constraint(equalTo: rectangleImage.leadingAnchor, constant: 20),
            secondBustStack.trailingAnchor.constraint(equalTo: rectangleImage.trailingAnchor),
            secondBustStack.bottomAnchor.constraint(equalTo: rectangleImage.bottomAnchor, constant: -16)
        ])
    }
    
    func fillMainThird() {
        let rectangleImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "background_premium_rectangle")
            view.translatesAutoresizingMaskIntoConstraints = false
           
            return view
        }()
      
        let firstStack = createPermissionView(permissonControl: false, title: "Управление профилем")
        let secondStack = createPermissionView(permissonControl: true, title: "Кто видет тебя")
        let thirdStack = createPermissionView(permissonControl: true, title: "Никакой рекламы")
        
        thirdControlStack = UIStackView(arrangedSubviews: [firstStack, secondStack, thirdStack])
        thirdControlStack.translatesAutoresizingMaskIntoConstraints = false
        thirdControlStack.axis = .vertical
        thirdControlStack.spacing = 10
        thirdControlStack.distribution = .fillEqually
        mainView.addSubview(rectangleImage)
        
        NSLayoutConstraint.activate([
            rectangleImage.topAnchor.constraint(equalTo: secondBustStack.bottomAnchor, constant: 30),
            rectangleImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32),
            rectangleImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32),
            rectangleImage.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        view.addSubview(thirdControlStack)
        NSLayoutConstraint.activate([
            thirdControlStack.topAnchor.constraint(equalTo: rectangleImage.topAnchor, constant: 16),
            thirdControlStack.leadingAnchor.constraint(equalTo: rectangleImage.leadingAnchor, constant: 20),
            thirdControlStack.trailingAnchor.constraint(equalTo: rectangleImage.trailingAnchor),
            thirdControlStack.bottomAnchor.constraint(equalTo: rectangleImage.bottomAnchor, constant: -16)
        ])
    }
    
    
    private func createPermissionView(permissonControl: Bool, title: String) -> UIStackView {
        let permissionImage = UIImageView()
        permissionImage.translatesAutoresizingMaskIntoConstraints = false
        permissionImage.widthAnchor.constraint(equalToConstant: 27).isActive = true
        permissionImage.heightAnchor.constraint(equalToConstant: 21).isActive = true
        permissionImage.contentMode = .scaleAspectFit
        permissionImage.clipsToBounds = true
//        permissionImage.border(width: 2, color: .yellow)
        if permissonControl {
            permissionImage.image = UIImage(systemName: "checkmark")
            permissionImage.tintColor = UIColor.purple
        } else {
            permissionImage.image = UIImage(systemName: "lock.fill")
            permissionImage.tintColor = UIColor.gray
        }
        
        let titleLabel = UILabel()
        titleLabel.font = StyleConstants.Font.premiumPermissionTitle
        titleLabel.textColor = .black
        titleLabel.text = title
        titleLabel.widthAnchor.constraint(equalToConstant: 133).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        titleLabel.border(width: 2, color: .green)
        
        let hStack = UIStackView(arrangedSubviews: [permissionImage, titleLabel])
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.alignment = .center
//        hStack.distribution = .fillEqually
        hStack.translatesAutoresizingMaskIntoConstraints = false
//        hStack.border(width: 2, color: .blue)
        
        
        hStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        hStack.widthAnchor.constraint(equalToConstant: 160).isActive = true
        return hStack
    }
}

extension PremiumViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = presenter.item(at: indexPath) else { return UICollectionViewCell() }
        
        switch item {
        
        case .post(let viewModel):
            return collectionView
                .dequeueReusableCell(PremiumCollectionViewCell.self, for: indexPath)
                .bind(viewModel)
        }
    }
}

private extension PremiumViewController {
    func setupUI() {
        setupBackroundView()
        setupMainStack()
        setupCollectionView()
        setupMainView()
        fillMainFirstView()
        fillMainViewSecond()
        fillMainThird()
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
        
//        mainStackView.border(width: 2, color: .yellow)
    }
    
    func setupCollectionView() {
        premiumCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomCollectioViewLayout.createPremiumLayout())
        premiumCollectionView.translatesAutoresizingMaskIntoConstraints = false
        premiumCollectionView.showsHorizontalScrollIndicator = false
        premiumCollectionView.showsVerticalScrollIndicator = false
        premiumCollectionView.delegate = self
        premiumCollectionView.dataSource = self
        premiumCollectionView.backgroundColor = .clear
        premiumCollectionView.register(PremiumCollectionViewCell.self, forCellWithReuseIdentifier: PremiumCollectionViewCell.identifier)
        view.addSubview(premiumCollectionView)
        
        NSLayoutConstraint.activate([
            premiumCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            premiumCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            premiumCollectionView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 16),
            premiumCollectionView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
//        premiumCollectionView.border(width: 2, color: .red)
        
    }
    
    func setupMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        mainView.layer.cornerRadius = 50
        mainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        mainView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.topAnchor.constraint(equalTo: premiumCollectionView.bottomAnchor, constant: 10)
        ])
    }

}

