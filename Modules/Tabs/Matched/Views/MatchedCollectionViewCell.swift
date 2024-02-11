import UIKit

final class MatchedCollectionViewCell: UICollectionViewCell {
    @UsesAutoLayout
    private var cardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        return imageView
    }()

    @UsesAutoLayout
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.matchedUserName
        label.tintColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        
        return label
    }()
    
    @UsesAutoLayout
    private var userAgeLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.matchedUserName
        label.tintColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        
        return label
    }()
    
    @UsesAutoLayout
    private var userInfoHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fill
        stack.alignment = .center

        return stack
    }()
    
    @UsesAutoLayout
    private var locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.tintColor = .white
        NSLayoutConstraint.activate([
                image.widthAnchor.constraint(equalToConstant: 20),
                image.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        return image
    }()
    
    @UsesAutoLayout
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.geoInfoUser
        label.tintColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        
        return label
    }()
    
    @UsesAutoLayout
    private var locationHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        
        stack.distribution = .fill
        stack.alignment = .center
        
//        stack.border(width: 2.0, color: UIColor.blue)
        return stack
    }()
    
    @UsesAutoLayout
    private var distanceImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "mappin.and.ellipse")
        image.tintColor = .white
        NSLayoutConstraint.activate([
                image.widthAnchor.constraint(equalToConstant: 20),
                image.heightAnchor.constraint(equalToConstant: 20)
            ])
        return image
    }()
    
    @UsesAutoLayout
    private var distanceLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.geoInfoUser
        label.tintColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        
        return label
    }()
    
    @UsesAutoLayout
    private var distanceHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fill
        stack.alignment = .center
//        stack.border(width: 2.0, color: UIColor.white)
        return stack
    }()
    
    @UsesAutoLayout
    private var dislikeButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(named: "dislike"), for: .normal)
        
        return button
    }()
    @UsesAutoLayout
    private var dislikeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dislike")
        return view
    }()
    
    @UsesAutoLayout
    private var refreshButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "refresh"), for: .normal)
        
        return button
    }()
    @UsesAutoLayout
    private var refreshImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "refresh")
        return view
    }()
    
    @UsesAutoLayout
    private var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        
        return button
    }()
    @UsesAutoLayout
    private var likeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "like")
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ item: MatchedViewModel) -> Self {
        cardImage.image = item.userPhotos
        userNameLabel.text = item.userName
        userAgeLabel.text = item.userAge
        locationLabel.text = item.userLocation
        distanceLabel.text = item.userDistance
        
        return self
    }
}

extension MatchedCollectionViewCell {
    func setupUI() {

        contentView.addSubview(cardImage)
        
        userInfoHStack.addArrangedSubview(userNameLabel)
        userInfoHStack.addArrangedSubview(userAgeLabel)
        contentView.addSubview(userInfoHStack)
        
        locationHStack.addArrangedSubview(locationImage)
        locationHStack.addArrangedSubview(locationLabel)
        contentView.addSubview(locationHStack)

        distanceHStack.addArrangedSubview(distanceImage)
        distanceHStack.addArrangedSubview(distanceLabel)
        contentView.addSubview(distanceHStack)
//        let screenHeight = UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            cardImage.heightAnchor.constraint(equalToConstant: screenHeight)
        ])
        
        NSLayoutConstraint.activate([
            userInfoHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 500),
            userInfoHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            userInfoHStack.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            locationHStack.topAnchor.constraint(equalTo: userInfoHStack.bottomAnchor, constant: 10),
            locationHStack.leadingAnchor.constraint(equalTo: userInfoHStack.leadingAnchor),
            locationHStack.trailingAnchor.constraint(equalTo: userInfoHStack.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            distanceHStack.topAnchor.constraint(equalTo: locationHStack.bottomAnchor, constant: 10),
            distanceHStack.leadingAnchor.constraint(equalTo: userInfoHStack.leadingAnchor),
            distanceHStack.trailingAnchor.constraint(equalTo: userInfoHStack.trailingAnchor)
        ])
        
//
//        contentView.border(width: 2.0, color: UIColor.yellow)
    }
    
    func setupButton() {
        contentView.addSubview(dislikeImage)
        contentView.addSubview(likeImage)
        contentView.addSubview(refreshImage)
        
        NSLayoutConstraint.activate([
            dislikeImage.topAnchor.constraint(equalTo: distanceHStack.bottomAnchor, constant: 30),
            dislikeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            dislikeImage.heightAnchor.constraint(equalToConstant: 99),
            dislikeImage.widthAnchor.constraint(equalToConstant: 99),
        ])
        
        NSLayoutConstraint.activate([
            likeImage.topAnchor.constraint(equalTo: distanceHStack.bottomAnchor, constant: 30),
            likeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            likeImage.heightAnchor.constraint(equalToConstant: 99),
            likeImage.widthAnchor.constraint(equalToConstant: 99),
        ])
        NSLayoutConstraint.activate([
            refreshImage.heightAnchor.constraint(equalToConstant: 36),
            refreshImage.widthAnchor.constraint(equalToConstant: 36),
            refreshImage.centerYAnchor.constraint(equalTo: dislikeImage.centerYAnchor),
            refreshImage.leadingAnchor.constraint(equalTo: dislikeImage.trailingAnchor, constant: 33)
        ])
        
    }
}
