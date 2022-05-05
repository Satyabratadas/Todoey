//
//  UserListViewController.swift
//  Todoey
//
//  Created by ARC on 25/04/22.
//

import UIKit

class UserListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
//    let tableViewData = Array(repeating: "Item", count: 10)
    
    let url = "https://jsonplaceholder.typicode.com/users"
    let datamanager = dataModelManager()
    var details: [UserDetails] = []
    
    
    

    @IBOutlet weak var userListTableView: UITableView!
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)

        super.viewDidLoad()
        


        
       
//      Api call and recive the response
        self.datamanager.userRequest(url: url) { result in
            for item in result {
                let address = item["address"] as? [String:Any]
                let addressList = Address(street: address?["street"] as? String  , suite:address?["suite"] as? String , city:address?["city"] as? String , zipcode: address?["zipcode"] as? String )
                let company = item["company"] as? [String:Any]
                let companyList = Company(cname: company?["name"] as? String, catchPhrase: company?["catchPhrase"] as? String, bs: company?["bs"] as? String)
                let detailsItem = UserDetails(id: item["id"] as! Int, name: item["name"] as? String, username: item["username"] as? String, email: item["email"] as? String, address: addressList , phone: item["phone"] as? String, website: item["website"] as? String, company: companyList)
                self.details.append(detailsItem)
            }
            
            DispatchQueue.main.async {
//                self.userListTableView.dataSource = self
//                self.userListTableView.delegate = self
                self.userListTableView.reloadData()
            }
            
    }
       
    }

    @IBAction func logoutBtn(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
        vc.modalPresentationStyle = .fullScreen
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.details.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell( withIdentifier: "UserListCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel!.text = details[indexPath.row].name
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let newVc = self.storyboard!.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController

        newVc.title = details[indexPath.row].name
        self.navigationController?.pushViewController(newVc, animated:true)
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
