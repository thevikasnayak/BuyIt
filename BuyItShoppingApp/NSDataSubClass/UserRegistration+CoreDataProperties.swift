//
//  UserRegistration+CoreDataProperties.swift
//  
//
//  Created by Vikas Nayak on 04/04/18.
//
//

import Foundation
import CoreData


extension UserRegistration {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserRegistration> {
        return NSFetchRequest<UserRegistration>(entityName: "UserRegistration")
    }

    @NSManaged public var contact: String?
    @NSManaged public var email: String?
    @NSManaged public var fullName: String?
    @NSManaged public var image: NSData?
    @NSManaged public var password1: String?
    @NSManaged public var password2: String?

}
