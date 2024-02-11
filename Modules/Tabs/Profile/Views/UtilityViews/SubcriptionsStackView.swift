import UIKit

final class SubcriptionsStackView: UIView {
    @UsesAutoLayout
    private var subcriptionsCountLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.titleDescription
        view.textColor = StyleConstants.Colors.TextColor.titleColor
        view.textAlignment = .center
        
        return view
    }()
    
    @UsesAutoLayout
    private var subcriptionsTitleLabel: UILabel = {
        let view = UILabel()
        view.font = StyleConstants.Font.storiesTitle
        view.textColor = StyleConstants.Colors.TextColor.titleColor
        view.textAlignment = .center
        
        view.text = "подписки"
        
        return view
    }()
    
    @UsesAutoLayout
    private var subcriptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        
        return stackView
    }()
    
    var subcriptionsCount: String? {
        didSet {
            subcriptionsCountLabel.text = subcriptionsCount
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

private extension SubcriptionsStackView {
    func setupUI() {
        subcriptionsStackView.addArrangedSubview(subcriptionsCountLabel)
        subcriptionsStackView.addArrangedSubview(subcriptionsTitleLabel)
        addSubview(subcriptionsStackView)
        
        NSLayoutConstraint.activate([
            subcriptionsStackView.topAnchor.constraint(equalTo: topAnchor),
            subcriptionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
