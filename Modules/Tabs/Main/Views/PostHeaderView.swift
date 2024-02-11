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
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = TabsLayoutConstants.Main.headerImageViewCornerRadius
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    @UsesAutoLayout
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.titleDescription
        label.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor

        return label
    }()
    
    @UsesAutoLayout
    private var lastOnlineLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.titleDescriptionCell
        label.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        
        return label
    }()
    
    @UsesAutoLayout
    private var moreButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            button.tintColor = .black
            
            return button
        }()
    
    // add actionButton
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    // add activity indicator
    
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
