import Foundation

class DictionaryPresenter: DictionaryViewOutput {
    
    weak var view: DictionaryViewInput!
    var dataManager: DataManagerProtocol!
    
    func loadDataUserInVC() {
        
        let dataUser = dataManager.obtainMainUserData()
        view.showCollections(dataUser)
    }
    
    func createNewWordInCollection(engWord: String, rusWord: String, collection: String) {
        dataManager.createNewWordInCollection(engWord: engWord, rusWord: rusWord, collection: collection)
    }
    
    func deleteWord(engWord: String) {
        dataManager.deleteWord(engWord: engWord)
    }
}
