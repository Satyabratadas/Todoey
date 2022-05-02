//
//  dataModel.swift
//  Todoey
//
//  Created by ARC on 27/04/22.
//

import Foundation

struct UserDetailsArray:Codable{
    let array : [UserDetails]
}



struct UserDetails:Codable{
    var id : Int
    var name : String?
    var username : String?
    var email : String?
    var address : Address
    var phone : String?
    var website : String?
    var company : Company
    
}
//struct Geo : Codable{
//    var lat : String?
//    var lng : String?
//}

struct Address : Codable{
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
//    var geo : Geo
}
struct Company : Codable{
    var cname : String?
    var catchPhrase : String?
    var bs : String?
}

struct ToDo : Codable{
    var id : Int
    var tid : Int
    var title : String?
    var complete : Bool?
}
struct Post : Codable{
    var id : Int
    var pid : Int
    var title : String?
    var body : String?
}
