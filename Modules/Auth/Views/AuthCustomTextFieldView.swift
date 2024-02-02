import UIKit

final class AuthCustomTextFieldView: UIView {
    
    private let textField: UITextField
    private let isPassword: Bool
    private var passwordToggleHandler: PasswordToggleHandler?

    init(textField: UITextField, placeholder: String, isPassword: Bool = false) {
        self.textField = textField
        self.isPassword = isPassword
        super.init(frame: .zero)
        setupViews(placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews(placeholder: String) {
        configureTextField()
        configurePasswordToggleHandler()
        let placeholderView = createPlaceholderView(title: placeholder)
        let fieldView = createFieldView()
        let stackView = UIStackView(arrangedSubviews: [placeholderView, fieldView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configureTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = isPassword
    }

    private func configurePasswordToggleHandler() {
        if isPassword {
            passwordToggleHandler = PasswordToggleHandler(textField: textField)
            passwordToggleHandler?.configureHidePasswordButton()
        }
    }

    private func createPlaceholderView(title: String) -> UIView {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = StyleConstants.Font.placeholderTitle
        titleLabel.textColor = StyleConstants.Colors.TextColor.placeholderColor

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.heightAnchorOffset).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AuthModuleLayoutConstants.titleLabelLeadingOffset).isActive = true

        return view
    }

    private func createFieldView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        view.backgroundColor = StyleConstants.Colors.GeneralColors.authTextFieldBackgroundColor
        view.layer.cornerRadius = AuthModuleLayoutConstants.cornerRadius
        view.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.fieldViewHeight).isActive = true

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor),
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AuthModuleLayoutConstants.buttonOffset),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AuthModuleLayoutConstants.buttonOffset)
        ])

        if isPassword, let hidePassword = passwordToggleHandler?.hidePassword {
            view.addSubview(hidePassword)
            hidePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AuthModuleLayoutConstants.hidePasswordButtonOffset).isActive = true
            hidePassword.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        return view
    }
}
