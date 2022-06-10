//
//  UserDetailsViewController.swift
//  Todoey
//
//  Created by ARC on 05/05/22.
//

import UIKit
import CoreData

class UserDetailsViewController: UIViewController {
    var userDetails : UserDetails?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var address : Address?
    var company : Company?
    
    @IBOutlet weak var userDetailsText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false
        let rightButtonItem = UIBarButtonItem.init(
              title: "Log-out",
              style: .plain,
              target: self,
              action: #selector(logoutBtnaction(sender:))
        )
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem = rightButtonItem
        rightButtonItem.tintColor = UIColor.black
        
        let backBarButtonItem = UIBarButtonItem(title:"< Back", style: .plain, target: self, action: #selector(backButton(sender:)))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        fetchAddressData()
        fetchCompanyData()
        userDetailsText.lineBreakMode = .byWordWrapping
        userDetailsText.numberOfLines = 0
        //show the data from data base which is stored from api
        userDetailsText.text = "UserName:   \((userDetails?.username)!)\n  \nEmail:   \((userDetails?.email)!)\n  \nAddress:   \((address?.street)!),\((address?.suite)!)\n  \nCity:   \((address?.city)!)\n  \nZipcode:    \((address?.zipcode)!)\n  \nPhone:   \((userDetails?.phone)!)\n  \nWebsite:   \((userDetails?.website)!)\n  \nCompany:   \((company?.cname)!)\n  \nCP:   \((company?.catchPhrase)!)\n  \nBs:   \((company?.bs)!)"
        
        //show the data direct from api
        //        userDetailsText.text = "UserName:   \((userDetails?.username)!)\n  \nEmail:   \((userDetails?.email)!)\n  \nAddress:   \((userDetails?.address.street)!),\((userDetails?.address.suite)!)\n  \nCity:   \((userDetails?.address.city)!)\n  \nZipcode:    \((userDetails?.address.zipcode)!)\n  \nPhone:   \((userDetails?.phone)!)\n  \nWebsite:   \((userDetails?.website)!)\n  \nCompany:   \((userDetails?.company.cname)!)\n  \nCP:   \((userDetails?.company.catchPhrase)!)\n  \nBs:   \((userDetails?.company.bs)!)"
        
    }
    func fetchAddressData() -> Address {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Address")
        fetchRequest.predicate = NSPredicate(format: "user.id == %@",NSNumber(value: userDetails?.id ?? 0 ))
        var results: [Address]?
        do {
            results = try context.fetch(fetchRequest) as? [Address]
        }catch let err as NSError {
            print(err.debugDescription)
        }
        address = results![0]
        return address!
    }
    func fetchCompanyData() -> Company {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        fetchRequest.predicate = NSPredicate(format: "user.id == %@",NSNumber(value: userDetails?.id ?? 0 ))
        var results: [Company]?
        do {
            results = try context.fetch(fetchRequest) as? [Company]
        }catch let err as NSError {
            print(err.debugDescription)
        }
        company = results![0]
        return company!
    }
    
    @IBAction func todoPressAction(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc  = mainStoryboard.instantiateViewController(withIdentifier: "TodoListViewController") as! TodoListViewController
        vc.modalPresentationStyle = .fullScreen
//        vc.UserIdtodo = (userDetails?.id)!
        show(vc, sender: self)
//        vc.todoTitle = (userDetails?.name)!
    }
    
    @IBAction func postPressAction(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc2  = mainStoryboard.instantiateViewController(withIdentifier: "PostList") as! PostListViewController
//        vc2.UserId = (userDetails?.id)!
//        vc2.users = userDetails
        vc2.modalPresentationStyle = .fullScreen
        show(vc2, sender: self)
        
    }
    @objc func logoutBtnaction(sender: UIBarButtonItem) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
        }
    @objc func backButton(sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }

    
}
