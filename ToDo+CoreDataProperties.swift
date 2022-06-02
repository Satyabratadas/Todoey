//
//  ToDo+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 02/06/22.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var tid: Int32
    @NSManaged public var title: String?
    @NSManaged public var complete: Bool

}

extension ToDo : Identifiable {

}
