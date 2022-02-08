import UIKit

class DictionaryViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Словарик"
    }
}
