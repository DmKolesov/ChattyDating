import UIKit

final class PostImageCell: UITableViewCell {
    @UsesAutoLayout
    private var headerContainerView: PostHeaderView = PostHeaderView()
    @UsesAutoLayout
    private var footerContainerView: PostFooterView = PostFooterView()
    
    @UsesAutoLayout
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AssetConstants.Image.Common.backgroundStars

        return imageView
    }()
    @UsesAutoLayout
    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.cornerRadius = 10
        
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
    }
    
    func bind(_ item: MainViewModel) -> Self {
        headerContainerView.bind(item)
        postImageView.image = item.postImage
        return self
    }
}

extension PostImageCell {
    func setupUI() {
        addSubview(backgroundImageView)
        addSubview(headerContainerView)
        addSubview(footerContainerView)
        addSubview(postImageView)
        
        NSLayoutConstraint.activate([
            headerContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            headerContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            headerContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            footerContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            footerContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: 5),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            postImageView.bottomAnchor.constraint(equalTo: footerContainerView.topAnchor, constant: -5)
        ])
    }
}
