import UIKit
import CoreData

class CollectionViewController: UIViewController {
    
    // MARK: - Propirties
    var dataManager = DataManager()
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
        
        loadDataModel()
        setupCollectionView()
        
        navigationItem.title = "Коллекции"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addNewCollection))
    }
    
    // MARK: - Func
    
    @objc func addNewCollection() {
        
    }
    
    func setupCollectionView() {

        collectionVeiw.register(UINib(nibName:  CollectionCell.reuseId, bundle: nil), forCellWithReuseIdentifier:  CollectionCell.reuseId)
        
        collectionVeiw.delegate = self
        collectionVeiw.dataSource = self
    }
    
    private func loadDataModel(){
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isMain == true")
        let viewContext = dataManager.viewContext
        guard let data = try? viewContext.fetch(fetchRequest) else { return }
        self.dataModel = data.first!.collectionArray
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
