import CoreData

protocol DataManagerProtocol {
    
    func obtainMainUserData() -> User
    func createNewWordInCollection(engWord: String, rusWord: String, collection: String) 
    func deleteWord(engWord: String)
    func createNewCollection(collectionName: String)
    
}

class DataManager: DataManagerProtocol {

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyDictionary")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext : NSManagedObjectContext = persistentContainer.viewContext

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Core Data delete support
    func deleteContext(with object: String) {
    }
    
    // MARK: - Core Data update support
    func updateMethod() {
    }

    // MARK: - Core Data create support
    
    func createNewCollection(collectionName: String) {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isMain == true")
        
        if let users = try? viewContext.fetch(fetchRequest) {
            guard let user = users.first else { return }
            user.addToCollection(Collection(nameCollection: "\(collectionName)", imageCollection: "noimage", word: [], context: viewContext))
        }
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            fatalError("error createNewCollection \(error.localizedDescription)")
        }
        
        
    }
    
    func createNewWordInCollection(engWord: String, rusWord: String, collection: String) {
        
        let fetchRequest: NSFetchRequest<Collection> = Collection.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "nameCollection == %@", collection)
        
        if let collections = try? viewContext.fetch(fetchRequest) {
            guard let collection = collections.first else { return }
            collection.addToWord(Word(rusWord: rusWord, engWord: engWord, context: viewContext))
        }
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            fatalError("error createNewWordInCollection \(error.localizedDescription)")
        }
    }
    
    func deleteWord(engWord: String) {
        
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "engWord == %@", engWord)
        
        if let words = try? viewContext.fetch(fetchRequest) {
            guard let word = words.first else { return }
            viewContext.delete(word)
        }
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            fatalError("error deleteWordInCollection \(error.localizedDescription)")
        }
    }
    
    func deleteCollection(collectionName: String) {
        
        let fetchRequest: NSFetchRequest<Collection> = Collection.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "nameCollection == %@", collectionName)
        
        if let collections = try? viewContext.fetch(fetchRequest) {
            guard let collection = collections.first else { return }
            viewContext.delete(collection)
        }
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            fatalError("error deleteWordInCollection \(error.localizedDescription)")
        }
    }
    
    func createNewUser(name: String, language: String, city: String, isMain: Bool) {

        let viewContext = persistentContainer.viewContext
        let _ = User(name: name, language: language, city: city, isMain: isMain, collection: [startCollection()], context: viewContext)

        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Error save User \(error.localizedDescription)")
        }
    }
    
    // MARK: - Core Data obtain support
    func obtainMainUserData() -> User {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isMain == true")
        
//        if let data = try? viewContext.fetch(fetchRequest), !data.isEmpty {
//            return data.first!
//        }
        do {
            let data = try viewContext.fetch(fetchRequest)
            if let mainUser = data.first {
                return mainUser
            }

        } catch let error as NSError {
            print("Error obtainDataCollection \(error.localizedDescription)")
        }
        return User()
    }
}

// MARK: - extension StartCollection
extension DataManager {
    
    func startCollection() -> Collection {

        let startCollection = Collection(nameCollection: "100 ?????????? ???????????????????? ????????", imageCollection: "noimage", word: [
        Word(rusWord: "??????????", engWord: "word", context: viewContext),
        Word(rusWord: "??????????", engWord: "have", context: viewContext),
        Word(rusWord: "??????", engWord: "or", context: viewContext),
        Word(rusWord: "????", engWord: "but", context: viewContext),
        Word(rusWord: "??????", engWord: "as", context: viewContext),
        Word(rusWord: "??", engWord: "with", context: viewContext),
        Word(rusWord: "????", engWord: "on", context: viewContext),
        Word(rusWord: "??????", engWord: "for", context: viewContext),
        Word(rusWord: "??", engWord: "in", context: viewContext),
        Word(rusWord: "??", engWord: "to", context: viewContext),
        Word(rusWord: "????????????????????????", engWord: "public", context: viewContext),
        Word(rusWord: "??????????????", engWord: "few", context: viewContext),
        Word(rusWord: "??????????????", engWord: "young", context: viewContext),
        Word(rusWord: "??????????????????", engWord: "next", context: viewContext),
        Word(rusWord: "??????????????", engWord: "large", context: viewContext),
        Word(rusWord: "??????????????????", engWord: "small", context: viewContext),
        Word(rusWord: "????????????", engWord: "other", context: viewContext),
        Word(rusWord: "??????????????", engWord: "little", context: viewContext),
        Word(rusWord: "????????????", engWord: "long", context: viewContext),
        Word(rusWord: "??????????????????", engWord: "last", context: viewContext)
        ], context: viewContext)

        return startCollection
    }
}

