
import UIKit

final class PasswordToggleHandler {
    var textField: UITextField
    var hidePassword: UIButton?
    var actionButton: UIAction?

    init(textField: UITextField) {
        self.textField = textField
    }

    func configureHidePasswordButton() {
        actionButton = UIAction { _ in
            self.textField.isSecureTextEntry.toggle()
            self.updateHidePasswordButtonImage()
        }

        hidePassword = {
            let button = UIButton(primaryAction: actionButton)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = StyleConstants.Colors.GeneralColors.lightGray
            button.setImage(AssetConstants.passwordHideEye, for: .normal)
            return button
        }()
    }

    private func updateHidePasswordButtonImage() {
        guard let hidePassword = hidePassword else { return }
        if textField.isSecureTextEntry {
            hidePassword.setImage(AssetConstants.passwordHideEye, for: .normal)
        } else {
            hidePassword.setImage(AssetConstants.passwordEye, for: .normal)
        }
    }
}
