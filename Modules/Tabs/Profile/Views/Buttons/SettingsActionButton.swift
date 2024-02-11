import UIKit

final class SettingsActionButton: UIView {
    @UsesAutoLayout
    private var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "settings_icon")
        
        return view
    }()
    
    @UsesAutoLayout
    var button: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)

        return view
    }()
    
    var handler: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @objc
    private func buttonDidPress() {
        handler?()
    }
}

private extension SettingsActionButton {
    func setup() {
        addSubview(backgroundImage)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor)
        ])
    }
}
