//
//  ViewController.swift
//  Todoey
//
//  Created by ARC on 21/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        
        
//        self.view.addSubview(view)
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
      }

    @IBAction func loginPressed(_ sender: UIButton) {
       
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "userListViewController")
                self.present(viewController, animated: true, completion: nil)
    }
    
}

