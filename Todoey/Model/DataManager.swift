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
                   if let jsonResponse = try JSONSerialization.jsonObject(with:dataResponse, options: []) as? [[String:Any]] {
                    onSuccess(jsonResponse )
                   }
                 } catch let parsingError {
                    print("Error", parsingError)
                     onSuccess([])
               }
        }
        task.resume()
        
    }
    

    
   

    }

