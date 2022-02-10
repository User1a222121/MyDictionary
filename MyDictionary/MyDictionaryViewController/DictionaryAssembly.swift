import UIKit

class DictionaryAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? DictionaryViewController else { return }
        
        let presenter = DictionaryPresenter()
        let dataManager = DataManager()
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
    }
}
