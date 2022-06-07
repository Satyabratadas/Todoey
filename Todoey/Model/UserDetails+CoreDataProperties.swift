//
//  UserDetails+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 07/06/22.
//
//

import Foundation
import CoreData


extension UserDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetails> {
        return NSFetchRequest<UserDetails>(entityName: "UserDetails")
    }

    @NSManaged public var id: Int32
    @NSManaged public var todo: ToDo?
    @NSManaged public var post: Post?
    @NSManaged public var address: Address?
    @NSManaged public var company: Company?

}

extension UserDetails : Identifiable {

}
