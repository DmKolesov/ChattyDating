import UIKit

final class InfoStackView: UIView {
    @UsesAutoLayout
    private var nameLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.nameTitleProfile
        view.textColor = StyleConstants.Colors.TextColor.titleColor
        view.textAlignment = .center
        
        return view
    }()
    
    @UsesAutoLayout
    private var ageLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.nameTitleProfile
        view.textColor = StyleConstants.Colors.TextColor.titleColor
        view.textAlignment = .center
        
        return view
    }()
    
    @UsesAutoLayout
    private var personInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var age: String? {
        didSet {
            ageLabel.text = age
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonInfoStackView {
    func setupUI() {
        personInfoStackView.addArrangedSubview(nameLabel)
        personInfoStackView.addArrangedSubview(ageLabel)
        addSubview(personInfoStackView)
        
        NSLayoutConstraint.activate([
            personInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personInfoStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
