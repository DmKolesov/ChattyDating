

import Foundation
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
        setupUI()
    }

    @objc
    func didTapForgorPassword() {
        print("Forgot Password button tapped!")
    }

    @objc
    func didTapSignIn() {
        print("didTapSignIn()")
    }
    @objc
    func didTapRegister() {
        print("didTapRegister()")
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
        gradientView.layer.cornerRadius = 50
        gradientView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = .white
        view.addSubview(gradientView)
      
        gradientView.translatesAutoresizingMaskIntoConstraints = false

        let heightMultiplier: CGFloat = 0.7
        
        // завивисимость от устройства юай девайс каррент
        // градиент бабл
        
        // register aligment label textfield text

        let heightConstraint = gradientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: heightMultiplier)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true

        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
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
            titleLabel.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: view.bounds.height * 0.15),
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width * 0.8)
        ])
    }

    func setupTextFields() {
        emailTextFieldView = CustomTextFieldView(textField: emailTextField, placeholder: TextConstants.emailPhonePlaceholder)
        passwordTextFieldView = CustomTextFieldView(textField: passwordTextField, placeholder: TextConstants.passwordPlaceHolder, isPassword: true)

        emailTextField.delegate = self
        passwordTextField.delegate = self

        let stackView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        let stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.bounds.height * 0.09)
        stackViewTopConstraint.priority = .required
        stackViewTopConstraint.isActive = true

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: -40)
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
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 8),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: -40),
        ])
    }

    func setupSigniInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)

        let backGroundViewSignInButton: BackgroundViewButton = {
            let view = BackgroundViewButton()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
        
            return view
        }()

        let labelSignIn: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = StyleConstants.Font.buttonTitle
            label.textColor = StyleConstants.Colors.TextColor.titleColor
            label.text = TextConstants.signInButton
            return label
        }()

        backGroundViewSignInButton.addSubview(labelSignIn)
        backGroundViewSignInButton.addSubview(signInButton)
        view.addSubview(backGroundViewSignInButton)

        NSLayoutConstraint.activate([
            backGroundViewSignInButton.topAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: 60),
            backGroundViewSignInButton.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            backGroundViewSignInButton.widthAnchor.constraint(equalToConstant: 195),
            backGroundViewSignInButton.heightAnchor.constraint(equalToConstant: 40),

            labelSignIn.centerXAnchor.constraint(equalTo: backGroundViewSignInButton.centerXAnchor),
            labelSignIn.centerYAnchor.constraint(equalTo: backGroundViewSignInButton.centerYAnchor),
            labelSignIn.heightAnchor.constraint(equalToConstant: 20),

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
        registerButton.cornerRadius = 20

        let gradientLabel: UILabel = {
            let label = GradientLabel()
            label.translatesAutoresizingMaskIntoConstraints = false
      
            label.layer.cornerRadius = 20
            label.clipsToBounds = true
            label.font = StyleConstants.Font.buttonTitle
            label.text = TextConstants.registerButton
            label.textAlignment = .center
            
        
            return label
        }()

        view.addSubview(gradientLabel)
        view.addSubview(registerButton)

        NSLayoutConstraint.activate([

            registerButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 195),
            registerButton.heightAnchor.constraint(equalToConstant: 40),

            gradientLabel.topAnchor.constraint(equalTo: registerButton.topAnchor, constant: 10),
            gradientLabel.leadingAnchor.constraint(equalTo: registerButton.leadingAnchor, constant: 10),
            gradientLabel.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor, constant: -10),
            gradientLabel.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: -10)

        ])
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
