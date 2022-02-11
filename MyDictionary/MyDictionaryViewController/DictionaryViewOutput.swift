import Foundation

protocol DictionaryViewOutput: AnyObject {
    
    func loadDataUserInVC()
    func createNewWordInCollection(engWord: String, rusWord: String, collection: String)
    func deleteWord(engWord: String)
}
