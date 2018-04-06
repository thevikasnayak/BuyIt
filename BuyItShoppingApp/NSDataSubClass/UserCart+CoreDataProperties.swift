//
//  UserCart+CoreDataProperties.swift
//  
//
//  Created by Vikas Nayak on 06/04/18.
//
//

import Foundation
import CoreData


extension UserCart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCart> {
        return NSFetchRequest<UserCart>(entityName: "UserCart")
    }

    @NSManaged public var image: NSData?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var qty: String?

}
