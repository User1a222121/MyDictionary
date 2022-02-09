import UIKit

class CollectionCell: UICollectionViewCell {
    
    // MARK: - Propirties
    static let reuseId = "CollectionCell"
    
    // MARK: - Outlets
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameCollectionOutlet: UILabel!
    
    
    
    // MARK: - Func
    func setupCell(with collection: Collection) {
        
//        print("===8 \(collection.wrappedImageCollection)")
//        imageOutlet.image = UIImage(named: collection.wrappedImageCollection)
        nameCollectionOutlet.text = collection.wrappedNameCollection
        
    }
    
    
    
}
