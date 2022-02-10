import UIKit
import CoreData

class DictionaryViewController: UIViewController {
    
    // MARK: - Propirties
    var dataModel: [Collection] = []
    var output: DictionaryViewOutput!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        output.loadDataUserInVC()
        
        
        navigationItem.title = "Словарик"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addNewWord))
    }
    
    
    // MARK: - Func
    
    @objc func addNewWord() {
        
    }
    
    func setupTableView() {
        
        tableView.register(UINib(nibName:  DictionaryCell.reuseId, bundle: nil), forCellReuseIdentifier:  DictionaryCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
    
    
    
}

extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataModel[section].wordArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(dataModel[section].wrappedNameCollection)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DictionaryCell.reuseId, for: indexPath) as? DictionaryCell {
            
            if let data = dataModel.first?.wordArray[indexPath.row] {
                cell.setupCell(with: data)
            }

            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
}

// MARK: - DictionaryViewInput
extension DictionaryViewController: DictionaryViewInput {
    
    func showCollections(_ user: User) {
        self.dataModel = user.collectionArray
    }
}
