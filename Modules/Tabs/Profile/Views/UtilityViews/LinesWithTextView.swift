import UIKit

final class LinesWithTextView: UIView {
    private let topLine = UIView()
    private let bottomLine = UIView()
    private let textLabel = UILabel()

    var text: String? {
        get { return textLabel.text }
        set { textLabel.text = newValue }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // Draw the top line
        topLine.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        topLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topLine)

        NSLayoutConstraint.activate([
            topLine.topAnchor.constraint(equalTo: topAnchor),
            topLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 2),
        ])

        // Draw the bottom line
        bottomLine.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLine)

        // Add text label between the lines
//        textLabel.font = StyleConstants.Font.titleDescription
        
        textLabel.textColor = StyleConstants.Colors.TextColor.titleColor
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0  // Allow multiple lines
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomLine.topAnchor, constant: -5), // Adjust the spacing here
        ])

        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}
