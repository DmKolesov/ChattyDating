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
                            button.setImage(item.image, for: .normal)
                            button.setImage(item.selectedImage, for: .selected)
                
                            tabsView.addArrangedSubview(button)
            }
            if selectedIndex == -1 {
                selectedIndex = 0
            }
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
                ? tintColor
                : UIColor.gray
        }

        items[index].handler()
    }
}

private extension TabsView {
    func setupUI() {
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

