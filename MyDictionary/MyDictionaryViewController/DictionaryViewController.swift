import UIKit
import CoreData

class DictionaryViewController: UIViewController {
    
    // MARK: - Propirties
    var dataManager = DataManager()
    var dataModel: [Collection] = []
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataModel()
        setupTableView()
        
        
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
    
    private func loadDataModel(){
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isMain == true")
        let viewContext = dataManager.viewContext
        guard let data = try? viewContext.fetch(fetchRequest) else { return }
        self.dataModel = data.first!.collectionArray
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
