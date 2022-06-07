//
//  Post+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 06/06/22.
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
    @NSManaged public var title: String?

}

extension Post : Identifiable {

}
