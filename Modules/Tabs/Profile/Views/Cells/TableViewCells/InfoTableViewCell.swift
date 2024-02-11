import UIKit

final class UserPersonalInfoTableViewCell: UITableViewCell {
    @UsesAutoLayout
    private var containerView: UserPersonalInfoView = UserPersonalInfoView()

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }
}

private extension UserPersonalInfoTableViewCell {
    func setup() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
