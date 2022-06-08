//
//  Company+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 08/06/22.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var bs: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var cname: String?
    @NSManaged public var ofUserDetails: UserDetails?

}

extension Company : Identifiable {

}
