import UIKit

protocol AlertRouter {

    func presentInfoAlert(from controller: UIViewController, title: String, message: String?, handler: (() -> Void)?)

    func presentConfirmAlert(from controller: UIViewController, title: String, message: String?, actions: [UIAlertAction])
}

extension AlertRouter {

    func presentInfoAlert(from controller: UIViewController,
                          title: String = "",
                          message: String? = nil,
                          handler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: AlertInfo.ok, style: UIAlertAction.Style.default) { _ in
            handler?()
        })

        controller.present(alert, animated: true)
    }

    func presentConfirmAlert(from controller: UIViewController, title: String, message: String?, actions: [UIAlertAction]) {
        let confirm = UIAlertController(title: title, message: message, preferredStyle: .alert)

        for action in actions {
            confirm.addAction(action)
        }

        controller.present(confirm, animated: true)
    }
}

