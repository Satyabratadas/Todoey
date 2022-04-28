//
//  DataManager.swift
//  Todoey
//
//  Created by ARC on 28/04/22.
//

import Foundation


class dataModelManager{
    let userUrl = "https://jsonplaceholder.typicode.com/users"
    
    func userRequest(){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string:userUrl)!){ (data, response, error) in
            
                if let data = data, let string = String(data: data, encoding: .utf8){
                    print(string)
                }
            }

            task.resume()
        
    }
    
    func userfetch(){
        let task = URLSession.shared.dataTask(with: URL(string:userUrl)!){data, response, error in
                let decoder = JSONDecoder()
                if let data = data{
                    do{
                        let users = try decoder.decode(UserDetails.self, from: data)
                        strudetails(users)
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
    }
    
    func strudetails(){
        
    }
    
    
}
