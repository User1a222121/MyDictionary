//
//  Collection+CoreDataProperties.swift
//  MyDictionary
//
//  Created by Сергей Карпов on 08.02.2022.
//
//

import Foundation
import CoreData


extension Collection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection")
    }

    @NSManaged public var imageCollection: String?
    @NSManaged public var nameCollection: String?
    @NSManaged public var user: User?
    @NSManaged public var word: NSSet?
    
    public var wrappedNameCollection: String {
        nameCollection ?? ""
    }
    
    public var wrappedImageCollection: String {
        imageCollection ?? ""
    }
    
    public var itemArray: [Word] {
        let set = word as? Set<Word> ?? []
        return set.sorted { $0.wrappedEngWord < $1.wrappedEngWord }

    }
    
    convenience init(nameCollection: String, imageCollection: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.nameCollection = nameCollection
    }

}

// MARK: Generated accessors for word
extension Collection {

    @objc(addWordObject:)
    @NSManaged public func addToWord(_ value: Word)

    @objc(removeWordObject:)
    @NSManaged public func removeFromWord(_ value: Word)

    @objc(addWord:)
    @NSManaged public func addToWord(_ values: NSSet)

    @objc(removeWord:)
    @NSManaged public func removeFromWord(_ values: NSSet)

}

extension Collection : Identifiable {

}
