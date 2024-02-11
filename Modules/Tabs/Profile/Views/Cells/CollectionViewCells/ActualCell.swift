import UIKit

final class ActualCell: UICollectionViewCell {
    
    @UsesAutoLayout
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    private var viewModel: ActualStoriesCellViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(_ item: ActualStoriesCellViewModel) -> Self {
        self.viewModel = item
        profileImageView.image = item.stories
        
        return self
    }
}

//private extension ActualCell {
//
//    func setupCellShadow() {
//        contentView.layer.cornerRadius = 8
//        contentView.layer.masksToBounds = true
//
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.3
//        layer.shadowOffset = CGSize(width: 0, height: 2)
//        layer.shadowRadius = 4
//    }
//}

private extension ActualCell {
    func setupUI() {
        contentView.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
        ])
        
        profileImageView.layer.cornerRadius = contentView.frame.height * 0.5
    }
}
