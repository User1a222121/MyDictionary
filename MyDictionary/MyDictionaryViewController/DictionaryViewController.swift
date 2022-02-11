import UIKit
import CoreData

class DictionaryViewController: UIViewController {
    
    // MARK: - Propirties
    var dataModel: [Collection] = []
    var output: DictionaryViewOutput!
    var pickerView = UIPickerView()
    var nameCollection = ""
    
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
        
        let alert = UIAlertController(title: "Добавть слово \n в коллекцию:", message: "\n\n\n\n\n", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "English word"
        }
        alert.addTextField { textField in
            textField.placeholder = "Russian word"
        }
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 60, width: 250, height: 100))
        alert.view.addSubview(pickerFrame)
                pickerFrame.dataSource = self
                pickerFrame.delegate = self
        
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let engWord = alert.textFields?[0].text,
                  let rusWord = alert.textFields?[1].text
            else { return }
            self.output.createNewWordInCollection(engWord: engWord, rusWord: rusWord, collection: self.nameCollection)
            self.tableView.reloadData()
        }
        
        let canselAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(canselAction)
        
        self.present(alert, animated: true, completion: nil)

    }
    
    func setupTableView() {
        
        tableView.register(UINib(nibName:  DictionaryCell.reuseId, bundle: nil), forCellReuseIdentifier:  DictionaryCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
    
    
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
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
            
            cell.output = self
            cell.tag = indexPath.row
            let data = dataModel[indexPath.section].wordArray[indexPath.row]
                cell.setupCell(with: data)
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

// MARK: - DictionaryViewInput
extension DictionaryViewController: DictionaryViewInput {
    
    func showCollections(_ user: User) {
        self.dataModel = user.collectionArray
        self.nameCollection = user.collectionArray.first?.wrappedNameCollection ?? ""
    }
}

extension DictionaryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataModel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataModel[row].nameCollection
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.nameCollection = dataModel[row].nameCollection ?? ""
    }
    
    
}
// MARK: - extension CellOutput
extension DictionaryViewController: CellOutput {
    
    func deletButtonDidTap(button sender: DictionaryCell) {
        guard let word = sender.engWordOutlet.text else { return }
        output.deleteWord(engWord: word)
        tableView.reloadData()
    }
    
}
