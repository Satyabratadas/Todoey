//
//  UserListViewController.swift
//  Todoey
//
//  Created by ARC on 25/04/22.
//

import UIKit

class UserListViewController: UIViewController,UITableViewDataSource {
    let tableViewData = Array(repeating: "Item", count: 10)
    
    
    
    

    @IBOutlet weak var userListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListTableView.dataSource = self

      
    }

    @IBAction func logoutBtn(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
        vc.modalPresentationStyle = .fullScreen
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // return UITableViewCell()
        
        let cell:UserListCell = self.userListTableView.dequeueReusableCell(withIdentifier: "UserListCell") as! UserListCell
        cell.userName.text = "test"
        return cell
                
    }
    

}
