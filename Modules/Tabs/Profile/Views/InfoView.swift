import UIKit

final class InfoView: UIView {
    private let contentProfileView: ContentProfileView = ContentProfileView()
    private let personInfoStackView: InfoStackView = InfoStackView()
    private let followersStackView: FollowersStackView = FollowersStackView()
    private let subcriptionsStackView: SubcriptionsStackView = SubcriptionsStackView()
    private let linesWithText: LinesWithTextView = LinesWithTextView()
    
    private var editProfileButton = EditButton() {
        didSet {
            editProfileButton.handler = editProfileAction
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    @objc
    private func editProfileButtonDidPressed() {
        editProfileAction()
    }
    private func editProfileAction() {
        print("editProfileActionPressed()")
    }
}
private extension InfoView {
    func setup() {
        setupContentView()
        setupPersonInfoStackView()
        setupEditButton()
        setupFollowersStackView()
        setupSubcriptionsStackView()
        setupLinesWithText()
    }
    func setupContentView() {
        contentProfileView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentProfileView)
        
        NSLayoutConstraint.activate([
            contentProfileView.topAnchor.constraint(equalTo: topAnchor),
            contentProfileView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentProfileView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentProfileView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func setupPersonInfoStackView() {
        personInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(personInfoStackView)
        
        NSLayoutConstraint.activate([
            personInfoStackView.topAnchor.constraint(equalTo: contentProfileView.topAnchor, constant: 20),
            personInfoStackView.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor, constant: 20)
        ])
        
        personInfoStackView.age = "24"
        personInfoStackView.name = "Diana,"
    }
    
    func setupEditButton() {
        editProfileButton.button.addTarget(self, action: #selector(editProfileButtonDidPressed), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(editProfileButton)
        
        NSLayoutConstraint.activate([
            editProfileButton.heightAnchor.constraint(equalToConstant: 40),
            editProfileButton.widthAnchor.constraint(equalToConstant: 40),
            editProfileButton.topAnchor.constraint(equalTo: contentProfileView.topAnchor, constant: 23),
            editProfileButton.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor, constant: -20)
        ])
    }
    func setupFollowersStackView() {
        followersStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(followersStackView)
        
        NSLayoutConstraint.activate([
            followersStackView.leadingAnchor.constraint(equalTo: personInfoStackView.leadingAnchor),
            followersStackView.topAnchor.constraint(equalTo: personInfoStackView.bottomAnchor, constant: 50)
        ])
        followersStackView.followersCount = "220"
    }
    func setupSubcriptionsStackView() {
        subcriptionsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subcriptionsStackView)
        
        NSLayoutConstraint.activate([
            subcriptionsStackView.topAnchor.constraint(equalTo: personInfoStackView.bottomAnchor, constant: 50),
            subcriptionsStackView.leadingAnchor.constraint(equalTo: followersStackView.trailingAnchor, constant: 100)
        ])
        
        subcriptionsStackView.subcriptionsCount = "55"
    }
    func setupLinesWithText() {
        linesWithText.translatesAutoresizingMaskIntoConstraints = false
        addSubview(linesWithText)

        NSLayoutConstraint.activate([
            linesWithText.topAnchor.constraint(equalTo: subcriptionsStackView.bottomAnchor, constant: 40),
            linesWithText.leadingAnchor.constraint(equalTo: personInfoStackView.leadingAnchor),
            linesWithText.trailingAnchor.constraint(equalTo: editProfileButton.trailingAnchor)
        ])


        linesWithText.text = "Et harum quidem rerum facilis est et expedita distinctio, consectetur adipiscing elit.Et harum quidem rerum facilis est et expedita distinctio."
        linesWithText.border(width: 2.0, color: .yellow)
    }
}
