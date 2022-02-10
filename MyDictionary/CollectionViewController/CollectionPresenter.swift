import Foundation

class CollectionPresenter: CollectionViewOutput {
    
    weak var view: CollectionViewInput!
    var dataManager: DataManagerProtocol!
    
    func loadDataUserInVC() {
        
        let dataUser = dataManager.obtainMainUserData()
        view.showCollections(dataUser)
    }
}
