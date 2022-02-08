import CoreData


protocol DataProtocolSave {

    func createNewUser(name: String, language: String, city: String)


}

class DataManager: DataProtocolSave {

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
    
    func createNewUser(name: String, language: String, city: String) {

        let viewContext = persistentContainer.viewContext

//        _ = User(name: name, language: language, city: city, context: viewContext)

        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Error save obtainMainCommand \(error.localizedDescription)")
        }
    }
    
    func createNewCollection() {
        
    }
    
    func createNewWord() {
        
    }
}


