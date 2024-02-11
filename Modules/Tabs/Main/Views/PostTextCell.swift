import UIKit

final class PostTextCell: UITableViewCell {
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
//label count strings
    @UsesAutoLayout
    private var textView: UITextView = {
        let view = UITextView()
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor
        view.font = StyleConstants.Font.titleDescriptionCell
        
        return view
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
        textView.text = item.postMessage
        return self
    }
}

extension PostTextCell {
    func setupUI() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(headerContainerView)
        contentView.addSubview(footerContainerView)
        contentView.addSubview(textView)
        
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
            textView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            textView.bottomAnchor.constraint(equalTo: footerContainerView.topAnchor, constant: -10)
        ])
    }
}
