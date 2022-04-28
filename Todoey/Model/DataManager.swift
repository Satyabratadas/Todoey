//
//  DataManager.swift
//  Todoey
//
//  Created by ARC on 28/04/22.
//

import Foundation


class dataModelManager{
    
    
    func userRequest(url : String){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string : url)!){ (data, response, error) in
            
                if let data = data, let string = String(data: data, encoding: .utf8){
                    print(string)
                }
                guard let httpResponse = response as? HTTPURLResponse,
                            (200...299).contains(httpResponse.statusCode) else {
                                print("Error with the response, unexpected status code: \(String(describing: response) )")
                    return
                  }
            }

            task.resume()
        
    }
    
//    func userfetch(){
//        let task = URLSession.shared.dataTask(with: URL(string:userUrl)!){data, response, error in
//                let decoder = JSONDecoder()
//                if let data = data{
//                    do{
//                        let users = try decoder.decode([UserDetails].self, from: data)
//                        strudetails(users)
//                    }catch{
//                        print(error)
//                    }
//                }
//            }
//            task.resume()
//    }
//
//    func strudetails(){
//
//    }
    
    
}
