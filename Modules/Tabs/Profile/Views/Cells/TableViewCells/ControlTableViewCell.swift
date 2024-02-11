import UIKit

final class ControlTableViewCell: UITableViewCell {
    
    @UsesAutoLayout
    private var containerView: UserProfileView = UserProfileView()
    private var viewModel: UserProfileInfoSectionViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }
    
    func bind(_ item: UserProfileInfoSectionViewModel) -> Self {
        self.viewModel = item
        self.containerView.handlers = viewModel?.handlers
        return self
    }
}

private extension ControlTableViewCell {
    func setup() {
        contentView.addSubview(containerView)
        backgroundColor = .clear
        selectionStyle = .none

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
