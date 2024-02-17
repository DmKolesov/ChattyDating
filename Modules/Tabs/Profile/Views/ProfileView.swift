import UIKit

final class UserProfileView: UIView {

    private let titleLabel: UILabel = UILabel()
    private let avatarEllipseView: AvatarView = AvatarView()
    
    // MARK: - Buttons
    
    private var settingsButton = SettingsActionButton()
    private var notificationButton = NotificationActionButton()
    private var matchButton = MatchActionButton()
    private var messageButton = MessageActionButton()

//    var handlers: ProfileDataSource.UserProfileViewHandlers?
    var handlers: ProfilePresenter.Handlers?

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    // MARK: - ButtonActions
    @objc
    private func settingButtonDidPressed() {
        handlers?.settingsAction?()
    }
    @objc
    private func notificationButtonDidPressed() {
        handlers?.notificationsAction?()
    }
    @objc
    private func matchButtonDidPressed() {
        handlers?.matchAction?()
    }
    @objc
    private func messageButtonDidPressed() {
        handlers?.messageAction?()
    }
}

private extension UserProfileView {
    func setup() {
        setupTitleLabel()
        setupAvatarView()
        setupButtons()
    }
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = StyleConstants.Font.regularTitle
        titleLabel.textColor = StyleConstants.Colors.TextColor.titleColor
        titleLabel.text = TextConstants.regularName
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
        ])
    }
    func setupAvatarView() {
        avatarEllipseView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarEllipseView)
        
        NSLayoutConstraint.activate([
            avatarEllipseView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            avatarEllipseView.heightAnchor.constraint(equalToConstant: 250),
            avatarEllipseView.widthAnchor.constraint(equalToConstant: 250),
            avatarEllipseView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    func setupButtons() {
        settingsButton.button.addTarget(self, action: #selector(settingButtonDidPressed), for: .touchUpInside)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(settingsButton)
        
        notificationButton.button.addTarget(self, action: #selector(notificationButtonDidPressed), for: .touchUpInside)
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(notificationButton)
        
        matchButton.button.addTarget(self, action: #selector(matchButtonDidPressed), for: .touchUpInside)
        matchButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(matchButton)
        
        messageButton.button.addTarget(self, action: #selector(messageButtonDidPressed), for: .touchUpInside)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageButton)
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            settingsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            settingsButton.heightAnchor.constraint(equalToConstant: 40),
            settingsButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55),
            notificationButton.heightAnchor.constraint(equalToConstant: 40),
            notificationButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            matchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            matchButton.centerYAnchor.constraint(equalTo: avatarEllipseView.centerYAnchor),
            matchButton.heightAnchor.constraint(equalToConstant: 40),
            matchButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            messageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            messageButton.centerYAnchor.constraint(equalTo: avatarEllipseView.centerYAnchor),
            messageButton.heightAnchor.constraint(equalToConstant: 40),
            messageButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
