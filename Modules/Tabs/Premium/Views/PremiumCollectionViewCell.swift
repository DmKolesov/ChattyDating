import UIKit

final class PremiumCollectionViewCell: UICollectionViewCell {
    @UsesAutoLayout
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_premium_silver")
        
        return imageView
    }()
    
    
    @UsesAutoLayout
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.text = TextConstants.regularName
        label.font = StyleConstants.Font.premiumTitle
        label.textColor = StyleConstants.Colors.TextColor.titleColor
        
        return label
    }()
    
    @UsesAutoLayout
    private var typeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_premium")
        
        return imageView
    }()
    
    @UsesAutoLayout
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        label.font = StyleConstants.Font.premiumType
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func bind(_ item: PremiumViewModel) -> Self {
        typeLabel.text = item.type
        return self
    }
}

extension PremiumCollectionViewCell {
    func setupUI() {
        setupBackgroundImage()
        setupTitleLabel()
        setupTypeImage()
        setupTypeTitleLabel()
    }
    
    func setupBackgroundImage() {
        contentView.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupTitleLabel() {
        contentView.addSubview(titleLabel)
    
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 50),
            titleLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -20),
            titleLabel.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func setupTypeImage() {
        contentView.addSubview(typeImage)
        
        NSLayoutConstraint.activate([
            typeImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 3),
            typeImage.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -3),
            typeImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            typeImage.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -40)
        ])
    }
    
    func setupTypeTitleLabel() {
        contentView.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            typeLabel.centerYAnchor.constraint(equalTo: typeImage.centerYAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: typeImage.centerXAnchor)
            
        ])
    }
}
