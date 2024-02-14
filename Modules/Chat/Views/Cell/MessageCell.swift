import UIKit

final class MessageCell: UITableViewCell {

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
    private var nameLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.titleDescription
        view.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor

        return view
    }()

    @UsesAutoLayout
    private var messageLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.titleDescriptionCell
        view.textColor = StyleConstants.Colors.TextColor.titleDescriptionColor

        return view
    }()

    @UsesAutoLayout
    private var leftStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = TabsLayoutConstants.Main.headerStackViewSpacing
        view.alignment = .center

        return view
    }()
// right part
    @UsesAutoLayout
    private var backgroundCountMessage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back_ellipse_message_count")

        return view
    }()
    
    @UsesAutoLayout
    private var countMessageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = StyleConstants.Font.titleDescriptionCell

        return view
    }()
    
    @UsesAutoLayout
    private var timeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = StyleConstants.Font.titleDescriptionCell

        return view
    }()
    
    @UsesAutoLayout
    private var rightVStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 18
        view.alignment = .center

        return view
    }()

    @UsesAutoLayout
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AssetConstants.Image.Common.backgroundStars

        return imageView
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func bind(_ item: MessageViewModel) -> Self {
        avatarImage.image = item.avatarImage
        nameLabel.text = item.userName
        messageLabel.text = item.messageTitle
        timeLabel.text = item.timeSent
        countMessageLabel.text = item.numerOfUnread
        return self
    }

}

//private extension MessageCell {
//    func setup() {
//        backgroundColor = .clear
//        selectionStyle = .none
//        contentView.addSubview(leftStackView)
//        contentView.addSubview(backgroundImageView)
//        leftStackView.addArrangedSubview(avatarImage)
//
//        backgroundCountMessage.addSubview(countMessageLabel)
//
//        rightVStackView.addArrangedSubview(timeLabel)
//        rightVStackView.addArrangedSubview(backgroundCountMessage)
//
//        let textStackView = UIStackView(arrangedSubviews: [nameLabel, messageLabel])
//        textStackView.axis = .vertical
//        textStackView.alignment = .leading
//        textStackView.spacing = TabsLayoutConstants.Main.headerTextStackViewSpacing
//
//        leftStackView.addArrangedSubview(textStackView)
//
//        NSLayoutConstraint.activate([
//                    countMessageLabel.centerXAnchor.constraint(equalTo: backgroundCountMessage.centerXAnchor),
//                    countMessageLabel.centerYAnchor.constraint(equalTo: backgroundCountMessage.centerYAnchor)
//                ])
//
//        NSLayoutConstraint.activate([
//            avatarImage.widthAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerAvatarImageSize),
//            avatarImage.heightAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerAvatarImageSize),
//
//            leftStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            leftStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
//
//        ])
//
//        NSLayoutConstraint.activate([
//            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
//        ])
//
//        NSLayoutConstraint.activate([
//            backgroundCountMessage.widthAnchor.constraint(equalToConstant: 30),
//            backgroundCountMessage.heightAnchor.constraint(equalToConstant: 30),
//
//
//            timeLabel.bottomAnchor.constraint(equalTo: rightVStackView.bottomAnchor),
//            timeLabel.trailingAnchor.constraint(equalTo: rightVStackView.trailingAnchor),
//        ])
//
//        // Background image setup
//        NSLayoutConstraint.activate([
//            rightVStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            rightVStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//        ])
//    }
//}
private extension MessageCell {
    func setup() {
        backgroundColor = .clear
        selectionStyle = .none

        contentView.addSubview(leftStackView)
        contentView.addSubview(rightVStackView)
        contentView.addSubview(backgroundImageView)

        leftStackView.addArrangedSubview(avatarImage)
        
        // Creating a container view for backgroundCountMessage and countMessageLabel
        let backgroundCountMessageContainer = UIView()
        backgroundCountMessage.addSubview(countMessageLabel)
        backgroundCountMessageContainer.addSubview(backgroundCountMessage)
        
        rightVStackView.addArrangedSubview(timeLabel)
        rightVStackView.addArrangedSubview(backgroundCountMessageContainer)

        let textStackView = UIStackView(arrangedSubviews: [nameLabel, messageLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = TabsLayoutConstants.Main.headerTextStackViewSpacing

        leftStackView.addArrangedSubview(textStackView)
        
        NSLayoutConstraint.activate([
            countMessageLabel.centerXAnchor.constraint(equalTo: backgroundCountMessage.centerXAnchor),
            countMessageLabel.centerYAnchor.constraint(equalTo: backgroundCountMessage.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            avatarImage.widthAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerAvatarImageSize),
            avatarImage.heightAnchor.constraint(equalToConstant: TabsLayoutConstants.Main.headerAvatarImageSize),

            leftStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            leftStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
        ])

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])

        NSLayoutConstraint.activate([
            backgroundCountMessage.widthAnchor.constraint(equalToConstant: 15),
            backgroundCountMessage.heightAnchor.constraint(equalToConstant: 15),

        ])


        NSLayoutConstraint.activate([
            rightVStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rightVStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15)

        ])
    }
}
