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
        self.barTintColor = .blue
        self.layer.cornerRadius = LayoutConstants.Common.cornerRadius
        self.layer.masksToBounds = true
        
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
