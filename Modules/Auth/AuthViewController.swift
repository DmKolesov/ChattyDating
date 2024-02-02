
import UIKit

final class AuthViewController: UIViewController {

    private let gradientView = GradientView()
    private let titleLabel = UILabel()

    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()

    private var emailTextFieldView: CustomTextFieldView!
    private var passwordTextFieldView: CustomTextFieldView!

    private let forgotPasswordButton = UIButton()
    private let signInButton = UIButton()
    private let registerButton = GradientButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    @objc
    func didTapForgorPassword() {
        print("Forgot Password button tapped")
    }

    @objc
    func didTapSignIn() {
        print("SignIn button tapped")
    }
    @objc
    func didTapRegister() {
        print("Register button tapped")
    }
}

extension AuthViewController: UITextFieldDelegate {
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            print("Email Text: \(textField.text ?? "")")
        } else if textField == passwordTextField {
            print("Password Text: \(textField.text ?? "")")
        }
        return true
    }
}

private extension AuthViewController {
    func setupUI() {
        setupGradientView()
        setupLabel()
        setupTextFields()
        setupForgotPasswordButton()
        setupSigniInButton()
        setupRegisterButton()
    }
    func setupGradientView() {
        gradientView.layer.cornerRadius = AuthModuleLayoutConstants.gradientViewCornerRadius
        gradientView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
      
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: view.bounds.height / AuthModuleLayoutConstants.gradientViewHeightRatio),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    func setupLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = StyleConstants.Font.largeTitle
        titleLabel.numberOfLines = 2
        titleLabel.textColor = StyleConstants.Colors.TextColor.titleColor
        titleLabel.text = TextConstants.brandName
        gradientView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: view.bounds.width * AuthModuleLayoutConstants.titleLabelTopOffsetRatio),
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width * AuthModuleLayoutConstants.titleLabelWidthRatio)
        ])
    }
    func setupTextFields() {
        emailTextFieldView = CustomTextFieldView(textField: emailTextField, placeholder: TextConstants.emailPhonePlaceholder)
        passwordTextFieldView = CustomTextFieldView(textField: passwordTextField, placeholder: TextConstants.passwordPlaceHolder, isPassword: true)

        emailTextField.delegate = self
        passwordTextField.delegate = self

        let stackView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView])
        stackView.axis = .vertical
        stackView.spacing = AuthModuleLayoutConstants.textFieldSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        let stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.bounds.height * AuthModuleLayoutConstants.textFieldTopOffsetRatio)
        stackViewTopConstraint.priority = .required
        stackViewTopConstraint.isActive = true

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: AuthModuleLayoutConstants.stackViewAnchor),
            stackView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: -AuthModuleLayoutConstants.stackViewAnchor)
        ])
    }
    func setupForgotPasswordButton() {
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle(TextConstants.forgotPasswordButton, for: .normal)
        forgotPasswordButton.titleLabel?.font = StyleConstants.Font.placeholderTitle
        forgotPasswordButton.setTitleColor(StyleConstants.Colors.TextColor.titleColor, for: .normal)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgorPassword), for: .touchUpInside)

        gradientView.addSubview(forgotPasswordButton)
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: AuthModuleLayoutConstants.forgotPasswordButtonTopOffset),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor),
        ])
    }
    func setupSigniInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)

        let backGroundViewSignInButton: BackgroundViewButton = {
            let view = BackgroundViewButton()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = AuthModuleLayoutConstants.cornerRadius
            view.clipsToBounds = true
        
            return view
        }()

        let labelSignIn: UILabel = {
            let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.font = StyleConstants.Font.buttonTitle
            view.textColor = StyleConstants.Colors.TextColor.titleColor
            view.text = TextConstants.signInButton
            
            return view
        }()
        
        backGroundViewSignInButton.addSubview(labelSignIn)
        backGroundViewSignInButton.addSubview(signInButton)
        view.addSubview(backGroundViewSignInButton)

        NSLayoutConstraint.activate([
            backGroundViewSignInButton.topAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: AuthModuleLayoutConstants.signInButtonTopOffset),
            backGroundViewSignInButton.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            backGroundViewSignInButton.widthAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.authButtonWidth),
            backGroundViewSignInButton.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.authButtonHeight),

            labelSignIn.centerXAnchor.constraint(equalTo: backGroundViewSignInButton.centerXAnchor),
            labelSignIn.centerYAnchor.constraint(equalTo: backGroundViewSignInButton.centerYAnchor),
            labelSignIn.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.labelOffset),

            signInButton.topAnchor.constraint(equalTo: backGroundViewSignInButton.topAnchor),
            signInButton.leadingAnchor.constraint(equalTo: backGroundViewSignInButton.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: backGroundViewSignInButton.trailingAnchor),
            signInButton.bottomAnchor.constraint(equalTo: backGroundViewSignInButton.bottomAnchor)
        ])

    }
    func setupRegisterButton() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        registerButton.clipsToBounds = true
        registerButton.cornerRadius = AuthModuleLayoutConstants.cornerRadius

        let gradientLabel: UILabel = {
            let view = GradientLabel()
            view.translatesAutoresizingMaskIntoConstraints = false
      
            view.layer.cornerRadius = AuthModuleLayoutConstants.cornerRadius
            view.clipsToBounds = true
            view.font = StyleConstants.Font.buttonTitle
            view.text = TextConstants.registerButton
            view.textAlignment = .center
            
            return view
        }()

        view.addSubview(gradientLabel)
        view.addSubview(registerButton)

        NSLayoutConstraint.activate([

            registerButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: AuthModuleLayoutConstants.buttonOffset),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.authButtonWidth),
            registerButton.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.authButtonHeight),

            gradientLabel.topAnchor.constraint(equalTo: registerButton.topAnchor, constant: AuthModuleLayoutConstants.buttonOffset),
            gradientLabel.leadingAnchor.constraint(equalTo: registerButton.leadingAnchor, constant: AuthModuleLayoutConstants.buttonOffset),
            gradientLabel.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor, constant: -AuthModuleLayoutConstants.buttonOffset),
            gradientLabel.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: -AuthModuleLayoutConstants.buttonOffset)
        ])
    }
}
