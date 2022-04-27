//
//  dataModel.swift
//  Todoey
//
//  Created by ARC on 27/04/22.
//

import Foundation

struct UserDetails:Decodable{
    let id : Int
    let name : String
    let username : String
    let email : String
    let phone : String
    let website : String
    let address : Address
    let company : Company
}

struct Address : Decodable{
    let street : String
    let suite : String
    let city : String
    let zipcode : String
}
struct Company : Decodable{
    let cname : String
    let catchPhrase : String
    let bs : String
}

struct ToDo : Decodable{
    let id : Int
    let tid : Int
    let title : String
    let complete : Bool
}
struct Post : Decodable{
    let id : Int
    let pid : Int
    let title : String
    let body : String
}
