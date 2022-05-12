//
//  UserDetailsViewController.swift
//  Todoey
//
//  Created by ARC on 05/05/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var userDetails : UserDetails?
    
    @IBOutlet weak var userDetailsText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButtonItem = UIBarButtonItem.init(
              title: "Log-out",
              style: .plain,
              target: self,
              action: #selector(logoutBtnaction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        rightButtonItem.tintColor = UIColor.black
        userDetailsText.lineBreakMode = .byWordWrapping
        userDetailsText.numberOfLines = 0
        
        userDetailsText.text = "UserName:   \((userDetails?.username)!)\n  \nEmail:   \((userDetails?.email)!)\n  \nAddress:   \((userDetails?.address.street)!),\((userDetails?.address.suite)!)\n  \nCity:   \((userDetails?.address.city)!)\n  \nZipcode:    \((userDetails?.address.zipcode)!)\n  \nPhone:   \((userDetails?.phone)!)\n  \nWebsite:   \((userDetails?.website)!)\n  \nCompany:   \((userDetails?.company.cname)!)\n  \nCP:   \((userDetails?.company.catchPhrase)!)\n  \nBs:   \((userDetails?.company.bs)!)"
        
    }
    
    @IBAction func todoPressAction(_ sender: UIButton) {
    }
    
    @IBAction func postPressAction(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc  = mainStoryboard.instantiateViewController(withIdentifier: "PostList") as! PostListViewController
        vc.modalPresentationStyle = .fullScreen
        vc.UserId = (userDetails?.id)!
        show(vc, sender: self)
        vc.title = (userDetails?.name)!
        self.title = "Back"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = userDetails?.name
    }
    @objc func logoutBtnaction(sender: UIBarButtonItem) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
        }

    
}
