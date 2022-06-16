//
//  Post+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 08/06/22.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var body: String?
    @NSManaged public var pid: Int32
    @NSManaged public var userId: Int32
    @NSManaged public var title: String?
    @NSManaged public var user: UserDetails?

}

extension Post : Identifiable {

}
