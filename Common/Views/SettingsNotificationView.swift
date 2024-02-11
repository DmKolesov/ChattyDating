import UIKit

final class SettingsNotificationView: UIStackView {
    
    private var settingsButton: UIButton!
    private var notificationButton: UIButton!
    private let screenWidth = UIScreen.main.bounds.width
    
    convenience init(settingsButton: UIButton, notificationButton: UIButton) {
        self.init()
        self.settingsButton = settingsButton
        self.notificationButton = notificationButton
        
        setupStackView()
    }
    
    // MARK: - Left side
    
    private lazy var ellipseLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AssetConstants.Image.Common.backgroundEllipse
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var gearImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gearshape")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var settingsView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.clipsToBounds = true
        
        return stack
    }()
    
    // MARK: - Middle
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  StyleConstants.Font.regularTitle
        label.textColor = StyleConstants.Colors.TextColor.titleColor
        label.text = TextConstants.regularName
        label.textAlignment = .center
    
        return label
    }()
    
    // MARK: - Right side
    private lazy var bellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var ellipseRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AssetConstants.Image.Common.backgroundEllipse
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var notificationView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.clipsToBounds = true
        
        return stack
    }()
    
    private lazy var mainStack: UIStackView = {
        let main = UIStackView()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.axis = .horizontal
        main.spacing = screenWidth * 0.078
        self.addSubview(main)
        return main
    }()
    
}
private extension SettingsNotificationView {
    
    func setupStackView() {
        
        settingsView.addSubview(ellipseLeftImageView)
        settingsView.addSubview(gearImageView)
        settingsView.addSubview(settingsButton)
        
        notificationView.addSubview(ellipseRightImageView)
        notificationView.addSubview(bellImageView)
        notificationView.addSubview(notificationButton)
        
        mainStack.addArrangedSubview(settingsView)
        mainStack.addArrangedSubview(titleLabel)
        mainStack.addArrangedSubview(notificationView)
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            settingsView.widthAnchor.constraint(equalToConstant: 40),
            ellipseLeftImageView.widthAnchor.constraint(equalTo: settingsView.widthAnchor),

            gearImageView.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 8),
            gearImageView.centerXAnchor.constraint(equalTo: settingsView.centerXAnchor),
            gearImageView.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 0.6),
            gearImageView.heightAnchor.constraint(equalTo: settingsView.heightAnchor, multiplier: 0.6),

            notificationView.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            notificationView.topAnchor.constraint(equalTo: mainStack.topAnchor),
            notificationView.bottomAnchor.constraint(equalTo: mainStack.bottomAnchor),
            notificationView.widthAnchor.constraint(equalToConstant: 40),

            titleLabel.centerYAnchor.constraint(equalTo: mainStack.centerYAnchor),

            bellImageView.topAnchor.constraint(equalTo: notificationView.topAnchor, constant: 8),
            bellImageView.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            bellImageView.widthAnchor.constraint(equalTo: notificationView.widthAnchor, multiplier: 0.6),
            bellImageView.heightAnchor.constraint(equalTo: notificationView.heightAnchor, multiplier: 0.6),

            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

