//
//  UserDeatils+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 02/06/22.
//
//

import Foundation
import CoreData


extension UserDeatils {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDeatils> {
        return NSFetchRequest<UserDeatils>(entityName: "UserDeatils")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var website: String?

}

extension UserDeatils : Identifiable {

}
