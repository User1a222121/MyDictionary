import UIKit

class RegistrationAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? RegistrationViewController else { return }
        
        let presenter = RegistrationPresenter()
        let dataManager = DataManager()
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
    }
}
