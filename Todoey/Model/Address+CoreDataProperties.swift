//
//  Address+CoreDataProperties.swift
//  Todoey
//
//  Created by ARC on 08/06/22.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var ofUserDetails: UserDetails?

}

extension Address : Identifiable {

}
