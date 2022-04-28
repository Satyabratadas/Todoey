//
//  dataModel.swift
//  Todoey
//
//  Created by ARC on 27/04/22.
//

import Foundation

struct UserDetails : Codable{
    let list : [UserList]
}

struct UserList:Codable{
    var id : Int
    var name : String
    var username : String
    var email : String
    var phone : String
    var website : String
    var address : Address
    var company : Company
}

struct Address : Codable{
    var street : String
    var suite : String
    var city : String
    var zipcode : String
}
struct Company : Codable{
    var cname : String
    var catchPhrase : String
    var bs : String
}

struct ToDo : Codable{
    var id : Int
    var tid : Int
    var title : String
    var complete : Bool
}
struct Post : Codable{
    var id : Int
    var pid : Int
    var title : String
    var body : String
}
