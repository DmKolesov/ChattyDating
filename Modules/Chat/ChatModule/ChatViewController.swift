import UIKit

final class ChatViewController: UIViewController {
    
    private let chatTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

private extension ChatViewController {
    func setup() {
        
    }
}
