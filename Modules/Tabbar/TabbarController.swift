import UIKit

final class TabbarController: UITabBarController {
    
    lazy var tabsView: TabsView = {
        let view = TabsView()
    
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        
        setupViews()
        setupControllers()
        let tabs = [
            TabsView.Tab(image:  AssetConstants.Image.Tabs.main, selectedImage: nil) { [weak self] in
                self?.changeTab(to: 0)
            },
            TabsView.Tab(image: AssetConstants.Image.Tabs.search, selectedImage: nil) { [weak self] in
                self?.changeTab(to: 1)
            },
            TabsView.Tab(image:  AssetConstants.Image.Tabs.match, selectedImage: nil) { [weak self] in
                self?.changeTab(to: 2)
            },
            TabsView.Tab(image:  AssetConstants.Image.Tabs.premium, selectedImage: nil) { [weak self] in
                self?.changeTab(to: 3)
            },
            TabsView.Tab(image:  AssetConstants.Image.Tabs.profile, selectedImage: nil) { [weak self] in
                self?.changeTab(to: 4)
            }
        ]

        tabsView.items = tabs

    }
    
    private func setupViews() {
        view.addSubview(tabsView)
        tabsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupControllers() {
        let mainPresenter = MainPresenter()
        let main = MainViewController(presenter: mainPresenter)
        
        let searchPresenter = SearchPresenter()
        let search = SearchViewController(presenter: searchPresenter)
        
        let matchedPresenter = MatchedPresenter()
        let matched = MatchedViewController(presenter: matchedPresenter)
        
        let premiumPresenter = PremiumPresenter()
        let premium = PremiumViewController(presenter: premiumPresenter)
        
        let profilePresenter = ProfilePresenter()
        let profile = ProfileViewController(presenter: profilePresenter)
        
        viewControllers = [
            NavigationController(rootViewController: main),
            NavigationController(rootViewController: search),
            NavigationController(rootViewController: matched),
            NavigationController(rootViewController: premium),
            NavigationController(rootViewController: profile)
        ]

    }
    
    private func changeTab(to index: Int) {
        selectedIndex = index
        tabBar.isHidden = true

        let controllers = viewControllers ?? []

        guard
            0..<controllers.count ~= index,
            let navi = controllers[index] as? UINavigationController, let visible = navi.visibleViewController
        else {
            return
        }

        tabsView.isHidden = visible.hidesBottomBarWhenPushed
    }
}
