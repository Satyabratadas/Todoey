//
//  UserDetailsViewController.swift
//  Todoey
//
//  Created by ARC on 05/05/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var userDetails : UserDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userDetails?.id)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
