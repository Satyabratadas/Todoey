//
//  UserListViewController.swift
//  Todoey
//
//  Created by ARC on 25/04/22.
//

import UIKit
import CoreData

class UserListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    
    let url = "https://jsonplaceholder.typicode.com/users"
    let datamanager = dataModelManager()
//    var details: [UserDetails] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var userListTableView: UITableView!
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        super.viewDidLoad()
        let rightButtonItem = UIBarButtonItem.init(
              title: "Log-out",
              style: .plain,
              target: self,
              action: #selector(logoutBtnaction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        rightButtonItem.tintColor = UIColor.black
        
       
//      Api call and recive the response
        self.datamanager.userRequest(url: url) { [self] result in
            let newEntity: NSEntityDescription = NSEntityDescription.entity(forEntityName: "UserDetails", in: self.context)!      //entity initialization with context
            for item in result {
                let insertItem = UserDetails(entity: newEntity, insertInto: self.context)
//                let insertItem = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: self.context) as! UserDetails                                  //set entity attribute value
                insertItem.id = item["id"] as? Int32 ?? 0
//                insertItem.name = item["name"] as? String ?? ""
//                insertItem.username = item["username"] as? String ?? ""
//                insertItem.email = item["email"] as? String ?? ""
//                insertItem.phone = item["phone"] as? String ?? ""
//                insertItem.website = item["website"] as? String ?? ""
                
//                print(item)
                
                
                
//                let address = item["address"] as? [String:Any]
//                let addressList = Address(street: address?["street"] as? String  , suite:address?["suite"] as? String , city:address?["city"] as? String , zipcode: address?["zipcode"] as? String )
//                let company = item["company"] as? [String:Any]
//                let companyList = Company(cname: company?["name"] as? String, catchPhrase: company?["catchPhrase"] as? String, bs: company?["bs"] as? String)
//                let detailsItem = UserDetails(id: item["id"] as! Int, name: item["name"] as? String, username: item["username"] as? String, email: item["email"] as? String, address: addressList , phone: item["phone"] as? String, website: item["website"] as? String, company: companyList)
//                self.details.append(detailsItem)
                
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
            
            DispatchQueue.main.async {
                self.userListTableView.reloadData()
            }
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.details.count;
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell( withIdentifier: "UserListCell", for: indexPath) as! UserListCell
//        cell.selectionStyle = .none
//        cell.userName.text = details[indexPath.row].name
        return cell

    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let newVc = self.storyboard!.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController

//        newVc.title = details[indexPath.row].name
//        newVc.userDetails = details[indexPath.row]
        self.navigationController?.pushViewController(newVc, animated:true)

    }
    @objc func logoutBtnaction(sender: UIBarButtonItem) {
            UserDefaults.standard.removeObject(forKey: "userName")
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
        }
    
    
    
}
