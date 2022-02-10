import Foundation

class DictionaryPresenter: DictionaryViewOutput {
    
    weak var view: DictionaryViewInput!
    var dataManager: DataManagerProtocol!
    
    func loadDataUserInVC() {
        
        let dataUser = dataManager.obtainMainUserData()
        view.showCollections(dataUser)
    }
}
