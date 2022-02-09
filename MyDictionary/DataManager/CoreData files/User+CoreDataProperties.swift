import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var city: String?
    @NSManaged public var language: String?
    @NSManaged public var name: String?
    @NSManaged public var isMain: Bool
    @NSManaged public var collection: NSSet?
    
    public var wrappedName: String {
        name ?? ""
    }
    
    public var wrappedLanguage: String {
        language ?? ""
    }
    
    public var wrappedCity: String {
        city ?? ""
    }
    
    
    public var collectionArray: [Collection] {
        let set = collection as? Set<Collection> ?? []
        return set.sorted { $0.wrappedNameCollection < $1.wrappedNameCollection}
    }
    
    convenience init(name: String, language: String, city: String, isMain: Bool, collection: NSSet, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = name
        self.language = language
        self.city = city
        self.collection = collection
    }

}

extension User : Identifiable {

}
