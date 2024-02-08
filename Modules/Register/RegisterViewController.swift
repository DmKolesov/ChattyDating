
import UIKit

final class RegisterViewController: UIViewController {
    
    private let gradientView = GradientView()
    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    private let phoneNumberMailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let repeatPasswordTextfield = UITextField()
    private let createProfileButton = UIButton()
    
    private let presenter: RegisterPresenter
    
    init(presenter: RegisterPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setupUI()
    }
    
    @objc func didTapCreateProfile() {
        print("didTapcreateProfile tapped!")
    }
    deinit {
        print("RegisterViewController dealloc")
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextField {
            print("Email Text: \(textField.text ?? "")")
        } else if textField == phoneNumberMailTextField {
            print("Password Text: \(textField.text ?? "")")
        } else if textField == passwordTextField {
            print("Password Text: \(textField.text ?? "")")
        } else if textField == repeatPasswordTextfield {
            print("Password Text: \(textField.text ?? "")")
        }
        return true
    }
}

private extension RegisterViewController {
    func setupUI() {
        setupGradientView()
        setupLabel()
        setupTextFields()
        setupCreateProfileButton()
    }
    func setupGradientView() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.layer.cornerRadius = AuthModuleLayoutConstants.gradientViewCornerRadius
        gradientView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = .white
        view.addSubview(gradientView)
        
        let heightMultiplier = AuthModuleLayoutConstants.heightMultiplier
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
            titleLabel.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: view.bounds.height * AuthModuleLayoutConstants.titleLabelTopOffsetRatio),
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width * AuthModuleLayoutConstants.titleLabelWidthRatio)
        ])
    }
    
    func setupTextFields() {
        let nameTextFieldView = RegisterCustomTextFieldView(
            textField: nameTextField,
            placeholder: TextConstants.enterYouName)
        let phoneNumberMailTextFieldView = RegisterCustomTextFieldView(
            textField: phoneNumberMailTextField,
            placeholder: TextConstants.phoneNumberOrEmail)
        let passwordTextFieldView = RegisterCustomTextFieldView(
            textField: passwordTextField,
            placeholder: TextConstants.createPassword,
            isPassword: true)
        let repeatPasswodrTextFieldView = RegisterCustomTextFieldView(
            textField: repeatPasswordTextfield,
            placeholder: TextConstants.repeatPassword,
            isPassword: true)
        
        [nameTextField, phoneNumberMailTextField, passwordTextField, passwordTextField].forEach { (textField) in
            textField.delegate = self
        }
        let stackView = UIStackView(
            arrangedSubviews: [
                nameTextFieldView,
                phoneNumberMailTextFieldView,
                passwordTextFieldView,
                repeatPasswodrTextFieldView
            ])
        stackView.axis = .vertical
        stackView.spacing = AuthModuleLayoutConstants.registerStackViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.bounds.height * AuthModuleLayoutConstants.stackViewTopOffsetRatio)
        stackViewTopConstraint.priority = .required
        stackViewTopConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: AuthModuleLayoutConstants.stackViewAnchor),
            stackView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: -AuthModuleLayoutConstants.stackViewAnchor)
        ])
    }
    
    func setupCreateProfileButton() {
        createProfileButton.translatesAutoresizingMaskIntoConstraints = false
        createProfileButton.addTarget(self, action: #selector(didTapCreateProfile), for: .touchUpInside)
        
        let backGroundViewCreateProfileButton: GradientView = {
            let view = GradientView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = AuthModuleLayoutConstants.cornerRadius
            view.clipsToBounds = true
            return view
        }()
        
        let labelСreateProfile: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = StyleConstants.Font.buttonTitle
            label.textColor = StyleConstants.Colors.TextColor.titleColor
            label.text = TextConstants.createProfileButton
            return label
        }()
        
        backGroundViewCreateProfileButton.addSubview(labelСreateProfile)
        backGroundViewCreateProfileButton.addSubview(createProfileButton)
        view.addSubview(backGroundViewCreateProfileButton)
        
        NSLayoutConstraint.activate([
            backGroundViewCreateProfileButton.topAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: AuthModuleLayoutConstants.buttonTopOffset),
            backGroundViewCreateProfileButton.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            backGroundViewCreateProfileButton.widthAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.buttonWidth),
            backGroundViewCreateProfileButton.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.buttonHeight),
            
            labelСreateProfile.centerXAnchor.constraint(equalTo: backGroundViewCreateProfileButton.centerXAnchor),
            labelСreateProfile.centerYAnchor.constraint(equalTo: backGroundViewCreateProfileButton.centerYAnchor),
            labelСreateProfile.heightAnchor.constraint(equalToConstant: AuthModuleLayoutConstants.labelHeight),
            
            createProfileButton.topAnchor.constraint(equalTo: backGroundViewCreateProfileButton.topAnchor),
            createProfileButton.leadingAnchor.constraint(equalTo: backGroundViewCreateProfileButton.leadingAnchor),
            createProfileButton.trailingAnchor.constraint(equalTo: backGroundViewCreateProfileButton.trailingAnchor),
            createProfileButton.bottomAnchor.constraint(equalTo: backGroundViewCreateProfileButton.bottomAnchor)
        ])
    }
}
