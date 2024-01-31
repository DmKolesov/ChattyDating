

import UIKit

final class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradientMajor()
    }

    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false

    }
}
