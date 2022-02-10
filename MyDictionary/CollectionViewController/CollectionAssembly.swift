import UIKit

class CollectionAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? CollectionViewController else { return }
        
        let presenter = CollectionPresenter()
        let dataManager = DataManager()
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
    }
}
