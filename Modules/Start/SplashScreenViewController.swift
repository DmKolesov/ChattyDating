import UIKit

final class SplashScreenViewController: UIViewController {
    private let titleLabel = UILabel()
    private let backgroundView = GradientView()
    
    private let presenter: SplashPresenter
    
    init(presenter: SplashPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.display()
        titleLabel.text = presenter.updateTitle()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            guard let self = self else { return }
            self.presenter.openAuth(from: self)
        }
    }
    deinit {
        print("SplashScreenViewController dealloc")
    }
}

private extension SplashScreenViewController {
    func setup() {
        setupBackgroundView()
        setupTitleLabel()
    }
    func setupBackgroundView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupTitleLabel() {
        view.backgroundColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = StyleConstants.Font.largeTitle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
