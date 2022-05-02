//
//  UserListViewController.swift
//  Todoey
//
//  Created by ARC on 25/04/22.
//

import UIKit

class UserListViewController: UIViewController,UITableViewDataSource {
//    let tableViewData = Array(repeating: "Item", count: 10)
    
    let url = "https://jsonplaceholder.typicode.com/users"
    let datamanager = dataModelManager()
    var details: [UserDetails] = []
    
    
    

    @IBOutlet weak var userListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListTableView.dataSource = self
        self.datamanager.userRequest(url: url) { result in
            
           
            
            for item in result {
//                print("item \(item["address"])")
                let address = item["address"] as? [String:Any]
                let addressList = Address(street: address?["street"] as? String  , suite:address?["suite"] as? String , city:address?["city"] as? String , zipcode: address?["zipcode"] as? String )
                
                let companyList = Company(cname: item["name"] as? String, catchPhrase: item["catchPhrase"] as? String, bs: item["bs"] as? String)
                
                
//
//
                let detailsItem = UserDetails(id: item["id"] as! Int, name: item["name"] as? String, username: item["username"] as? String, email: item["email"] as? String, address: addressList , phone: item["phone"] as? String, website: item["website"] as? String, company: companyList)
                self.details.append(detailsItem)
                
                
            }
            print(self.details.count)
            
            for (_,_p) in self.details.enumerated(){
                print(_p.address)
            }
//
            
        }// send the url for api call
        
       
      
    }

    @IBAction func logoutBtn(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
        vc.modalPresentationStyle = .fullScreen
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // return UITableViewCell()
        
        let cell:UserListCell = self.userListTableView.dequeueReusableCell(withIdentifier: "UserListCell") as! UserListCell
        cell.userName.text = "test"
        return cell
                
    }
    
    
    
}
