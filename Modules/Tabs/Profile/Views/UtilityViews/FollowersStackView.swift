import UIKit

final class FollowersStackView: UIView {
    @UsesAutoLayout
    private var followersCountLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.titleDescription
        view.textColor = StyleConstants.Colors.TextColor.titleColor
        view.textAlignment = .center
        
        return view
    }()
    
    @UsesAutoLayout
    private var followersTitleLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.storiesTitle
        view.textColor = StyleConstants.Colors.TextColor.titleColor
        view.textAlignment = .center
        
        view.text = "подписчики"
        
        return view
    }()
    
    @UsesAutoLayout
    private var followersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        
        return stackView
    }()
    
    var followersCount: String? {
        didSet {
            followersCountLabel.text = followersCount
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FollowersStackView {
    func setupUI() {
        followersStackView.addArrangedSubview(followersCountLabel)
        followersStackView.addArrangedSubview(followersTitleLabel)
        addSubview(followersStackView)
        
        NSLayoutConstraint.activate([
            followersStackView.topAnchor.constraint(equalTo: topAnchor),
            followersStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
