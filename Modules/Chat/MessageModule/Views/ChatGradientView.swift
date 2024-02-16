import UIKit

final class ChatGradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradientForContentProfileView()
    }

    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
