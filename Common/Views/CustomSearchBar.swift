import UIKit

final class CustomSearchBar: UISearchBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchBar()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSearchBar()
    }

    private func setupSearchBar() {
        self.placeholder = TextConstants.searchBarAttributedText
        self.backgroundColor = .clear

        if let backgroundImage = UIImage(named: "back_main_stories") {
            self.backgroundImage = backgroundImage.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }

        if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.textColor = StyleConstants.Colors.GeneralColors.searchBarPlaceholderColor
            textFieldInsideSearchBar.font = StyleConstants.Font.searchBarPlaceholder

            let attributedPlaceholder = NSAttributedString(string: TextConstants.searchBarAttributedText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            textFieldInsideSearchBar.attributedPlaceholder = attributedPlaceholder
        }

        if let searchIcon = AssetConstants.Image.Common.searchBarGlass {
            self.setImage(searchIcon, for: .search, state: .normal)
        }
    }
}

