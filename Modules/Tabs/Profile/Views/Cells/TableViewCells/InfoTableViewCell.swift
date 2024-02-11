import UIKit

final class InfoTableViewCell: UITableViewCell {
    @UsesAutoLayout
    private var containerView: InfoView = InfoView()

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }
}

private extension InfoTableViewCell {
    func setup() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
