//import UIKit
//
//final class TabsView: UIView {
//
//    struct Tab {
//
//        let image: UIImage?
//        let selectedImage: UIImage?
//        let handler: () -> Void
//    }
//
//    var selectedIndex: Int = -1 {
//        didSet {
//            selectItem(at: selectedIndex)
//        }
//    }
//
//    var items: [Tab] = [] {
//        didSet {
//            tabsView.subviews.forEach { view in
//                tabsView.removeArrangedSubview(view)
//                view.removeFromSuperview()
//            }
//
//            for (index, item) in items.enumerated() {
//                            let button = UIButton()
//                            button.addTarget(self, action: #selector(didSelectTab), for: .touchUpInside)
//                            button.tag = index
//                            button.setImage(item.image, for: .normal)
//                            button.setImage(item.selectedImage, for: .selected)
//
//                            tabsView.addArrangedSubview(button)
//            }
//            if selectedIndex == -1 {
//                selectedIndex = 0
//            }
//        }
//    }
//
//    @UsesAutoLayout
//    private var tabsView: UIStackView = {
//        let view = UIStackView()
//        view.axis = .horizontal
//        view.distribution = .fillEqually
//
//        return view
//    }()
//
//    @UsesAutoLayout
//    private var contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .black
//
//        return view
//    }()
//
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        setupUI()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupUI()
//    }
//    @objc
//    private func didSelectTab(_ sender: UIButton) {
//        selectItem(at: sender.tag)
//    }
//
//    private func selectItem(at index: Int) {
//        guard 0..<items.count ~= index else { return }
//
//        tabsView.subviews.forEach { view in
//            (view as? UIButton)?.isSelected = view.tag == index
//            (view as? UIButton)?.tintColor = view.tag == index
//                ? tintColor
//                : UIColor.gray
//        }
//
//        items[index].handler()
//    }
//}
//
//private extension TabsView {
//    func setupUI() {
//        addSubview(contentView)
//
//        let screenWidth = UIScreen.main.bounds.width
//
//        NSLayoutConstraint.activate([
//            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
//            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            contentView.widthAnchor.constraint(equalToConstant: screenWidth),
//            contentView.heightAnchor.constraint(equalToConstant: 75),
//            contentView.centerXAnchor.constraint(equalTo: centerXAnchor)
//
//        ])
//        contentView.addSubview(tabsView)
//
//        NSLayoutConstraint.activate([
//            tabsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            tabsView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            tabsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            tabsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//}
import UIKit

final class TabsView: UIView {
    
    struct Tab {
        let image: UIImage?
        let selectedImage: UIImage?
        let handler: () -> Void
    }
    
    var selectedIndex: Int = -1 {
        didSet {
            selectItem(at: selectedIndex)
        }
    }
    
    var items: [Tab] = [] {
        didSet {
            tabsView.subviews.forEach { view in
                tabsView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            
            for (index, item) in items.enumerated() {
                let button = UIButton()
                button.addTarget(self, action: #selector(didSelectTab), for: .touchUpInside)
                button.tag = index

                if index == 4 {
                    let avatarImageView = UIImageView()
                    avatarImageView.image = UIImage(named: "diana")
    
                    avatarImageView.clipsToBounds = true
                    avatarImageView.contentMode = .scaleAspectFit

                    avatarImageView.layer.masksToBounds = true
                    avatarImageView.layer.cornerRadius = 20
                    avatarImageView.layer.borderWidth = 2.0
                    avatarImageView.layer.borderColor = UIColor.white.cgColor
                    button.addSubview(avatarImageView)
             
                    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        avatarImageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                        avatarImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                        avatarImageView.widthAnchor.constraint(equalToConstant: 40),
                        avatarImageView.heightAnchor.constraint(equalToConstant: 40)
                    ])
                
                    button.setTitle("", for: .normal)
                } else {
            
                    button.setImage(item.image, for: .normal)
                    button.setImage(item.selectedImage, for: .selected)
                }

                tabsView.addArrangedSubview(button)
            }
        
            selectedIndex = 4
        }
    }
    
    @UsesAutoLayout
    private var tabsView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    @UsesAutoLayout
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    


    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
        
    @objc
    private func didSelectTab(_ sender: UIButton) {
        selectItem(at: sender.tag)
    }

    private func selectItem(at index: Int) {
        guard 0..<items.count ~= index else { return }
     
        tabsView.subviews.forEach { view in
            (view as? UIButton)?.isSelected = view.tag == index
            (view as? UIButton)?.tintColor = view.tag == index
                ? UIColor.magenta.withAlphaComponent(0.7)
                : UIColor.gray
        }

        items[index].handler()
    }
   
    private func setupUI() {
        addSubview(contentView)
        let screenWidth = UIScreen.main.bounds.width
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: screenWidth),
            contentView.heightAnchor.constraint(equalToConstant: 75),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        contentView.addSubview(tabsView)
        NSLayoutConstraint.activate([
            tabsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tabsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tabsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tabsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension UIColor {
    static let lightPurple = UIColor(red: 200/255, green: 150/255, blue: 255/255, alpha: 1.0)
    static let darkPurple = UIColor(red: 100/255, green: 50/255, blue: 150/255, alpha: 1.0)
}

extension UIColor {
    static var gradientPurple: UIColor {
        return UIColor.gradientPurple(topColor: UIColor(red: 200/255, green: 150/255, blue: 255/255, alpha: 1.0), bottomColor: UIColor(red: 100/255, green: 50/255, blue: 150/255, alpha: 1.0), height: 100)
    }
    
    static func gradientPurple(topColor: UIColor, bottomColor: UIColor, height: CGFloat) -> UIColor {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 1, height: height)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return .clear }

        gradientLayer.render(in: context)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return UIColor(patternImage: gradientImage ?? UIImage())
    }
}
