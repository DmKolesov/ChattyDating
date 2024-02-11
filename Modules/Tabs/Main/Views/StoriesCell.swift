import UIKit

final class StoriesCell: UICollectionViewCell {
    @UsesAutoLayout
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.link.cgColor
        
        return imageView
    }()
    @UsesAutoLayout
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = StyleConstants.Font.storiesTitle
        label.textColor = StyleConstants.Colors.TextColor.titleColor
        label.textAlignment = .center
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCellShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func bind(_ item: MainViewModel) -> Self {
        profileImageView.image = UIImage(named: item.avatarImage)
        nameLabel.text = item.username
        return self
    }
}

private extension StoriesCell {
    
    func setupCellShadow() {
//        contentView.layer.cornerRadius = 8
//        contentView.layer.masksToBounds = true
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.3
//        layer.shadowOffset = CGSize(width: 0, height: 2)
//        layer.shadowRadius = 4
    }
    
    func setupUI() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
  
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        profileImageView.layer.cornerRadius = contentView.frame.width * 0.4
    }
}

