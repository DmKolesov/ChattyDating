import UIKit

final class PostFooterView: UIView {
    @UsesAutoLayout
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
 
    @UsesAutoLayout
    private var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "likes_icon"), for: .normal)
        button.tintColor = .white
       
        return button
    }()
    
    @UsesAutoLayout
    private var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comments_icon"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    @UsesAutoLayout
    private var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "share_icon"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostFooterView {
    private func setupUI() {
        addSubview(stackView)

        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(commentButton)
        stackView.addArrangedSubview(shareButton)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
