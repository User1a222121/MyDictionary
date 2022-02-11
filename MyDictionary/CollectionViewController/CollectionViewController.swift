import UIKit
import CoreData

class CollectionViewController: UIViewController {
    
    // MARK: - Propirties
    var output: CollectionViewOutput!
    var dataModel: [Collection] = []
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(
      top: 10.0,
      left: 20.0,
      bottom: 10.0,
      right: 20.0)
    
    @IBOutlet weak var collectionVeiw: UICollectionView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
        output.loadDataUserInVC()
        
        navigationItem.title = "Коллекции"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addNewCollection))
    }
    
    // MARK: - Func
    
    @objc func addNewCollection() {
        
        let alert = UIAlertController(title: "Создать коллекцию", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Название коллекции"
        }
        
        let actionCreate = UIAlertAction(title: "Создать", style: .default) { alertCreate in
            guard let collectionName = alert.textFields?[0].text else { return }
            self.output.createNewCollection(collectionName: collectionName)
            DispatchQueue.main.async {
                self.output.loadDataUserInVC()
                self.collectionVeiw.reloadData()
            }
            
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alert.addAction(actionCreate)
        alert.addAction(actionCancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func setupCollectionView() {

        collectionVeiw.register(UINib(nibName:  CollectionCell.reuseId, bundle: nil), forCellWithReuseIdentifier:  CollectionCell.reuseId)
        collectionVeiw.delegate = self
        collectionVeiw.dataSource = self
    }
    
    
}

// MARK: - extension UICollectionViewDelegate, UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseId, for: indexPath) as? CollectionCell {
            
            cell.setupCell(with: dataModel[indexPath.item])
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - extension
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem * 1.4
        
        return CGSize(width: widthPerItem, height: heightPerItem)
      }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
      return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
      return sectionInsets.left
    }
}

// MARK: - CollectionViewInput
extension CollectionViewController: CollectionViewInput {
    
    func showCollections(_ user: User) {
        self.dataModel = user.collectionArray
    }
}
