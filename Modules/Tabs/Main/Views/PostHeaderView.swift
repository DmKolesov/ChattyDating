import UIKit

final class PostHeaderView: UIView {
    @UsesAutoLayout
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = TabsLayoutConstants.Main.headerStackViewSpacing
        view.alignment = .center

        return view
    }()
    
    @UsesAutoLayout
    private var avatarImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = TabsLayoutConstants.Main.headerImageViewCornerRadius
        view.clipsToBounds = true
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.white.cgColor
        
        return view
    }()
    
    @UsesAutoLayout
    private var userNameLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.titleDescription
        view.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor

        return view
    }()
    
    @UsesAutoLayout
    private var lastOnlineLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.titleDescriptionCell
        view.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        
        return view
    }()
    
    @UsesAutoLayout
    private var moreButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            button.tintColor = .black
            
            return button
        }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    func bind(_ item: MainViewModel) {
        avatarImage.image = UIImage(named: item.avatarImage)
        userNameLabel.text = item.username
        lastOnlineLabel.text = item.lastOnline
    }
}

private extension PostHeaderView {
    func setupUI() {
        addSubview(stackView)
        addSubview(moreButton)
        stackView.addArrangedSubview(avatarImage)
        
        let textStackView = UIStackView(arrangedSubviews: [userNameLabel, lastOnlineLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = TabsLayoutConstants.Main.headerTextStackViewSpacing
        
        stackView.addArrangedSubview(textStackView)
        
        NSLayoutConstraint.activate([
            avatarImage.widthAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerAvatarImageSize),
            avatarImage.heightAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerAvatarImageSize),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: TabsLayoutConstants.Main.headerEdge),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: TabsLayoutConstants.Main.headerEdge),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -TabsLayoutConstants.Main.headerEdge),
            
            moreButton.widthAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerMoreButtonSize),
            moreButton.heightAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerMoreButtonSize),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -TabsLayoutConstants.Main.headerEdge),
            moreButton.topAnchor.constraint(equalTo: topAnchor, constant: TabsLayoutConstants.Main.headerEdge),
        ])
    }
}
