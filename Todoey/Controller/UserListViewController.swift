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
//            print(result)
//            self.details.append(UserDetails( id: <#Int#>, name: <#T##String#>, username: <#T##String#>, email: <#T##String#>, address: <#T##Address#>, phone: <#T##String#>, website: <#T##String#>, company: <#T##Company#>))
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
