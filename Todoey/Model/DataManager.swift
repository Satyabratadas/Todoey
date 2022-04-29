//
//  DataManager.swift
//  Todoey
//
//  Created by ARC on 28/04/22.
//

import Foundation


class dataModelManager{
    
    
    func userRequest(url : String, onSuccess: @escaping ([[String:Any]]) -> (Void)){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string : url)!){ (data, response, error) in
            
            guard let dataResponse = data,
                      error == nil else {
                      print(error?.localizedDescription ?? "Response Error")
                      return }
                do{
                    //here dataResponse received from a network request
                   if let jsonResponse = try JSONSerialization.jsonObject(with:dataResponse, options: []) as? [[String:Any]] {
                    print(jsonResponse) //Response result
                    onSuccess(jsonResponse )
                   }
                 } catch let parsingError {
                    print("Error", parsingError)
                     onSuccess([])
               }
        }
        task.resume()
        
    }
    
    
    
    func parseUserDetails(data : Data){
        let decoder = JSONDecoder()
        
        



    }
   

    }

