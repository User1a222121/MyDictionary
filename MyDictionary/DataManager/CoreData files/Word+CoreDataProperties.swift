//
//  Word+CoreDataProperties.swift
//  MyDictionary
//
//  Created by Сергей Карпов on 08.02.2022.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var engWord: String?
    @NSManaged public var levelOfKnowledge: NSNumber
    @NSManaged public var rusWord: String?
    @NSManaged public var collection: Collection?
    
    public var wrappedRusWord: String {
        rusWord ?? ""
    }
    
    public var wrappedEngWord: String {
        engWord ?? ""
    }
    
    public var wrappedLevelOfKnowledge: NSNumber {
        levelOfKnowledge
    }
    
    convenience init(rusWord: String, engWord: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.rusWord = rusWord
        self.engWord = engWord
    }

}

extension Word : Identifiable {

}
