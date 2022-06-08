//
//  UserDetails+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 08/06/22.
//
//

import Foundation
import CoreData


extension UserDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetails> {
        return NSFetchRequest<UserDetails>(entityName: "UserDetails")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var website: String?
    @NSManaged public var address: Address?
    @NSManaged public var company: Company?
    @NSManaged public var post: Post?
    @NSManaged public var todo: ToDo?

}

extension UserDetails : Identifiable {

}
