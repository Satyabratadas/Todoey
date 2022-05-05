//
//  ViewController.swift
//  Todoey
//
//  Created by ARC on 21/04/22.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {
   
    
    @IBOutlet weak var username_Input: UITextField!
    @IBOutlet weak var passward_Input: UITextField!
    
    var alert: UIAlertController? = nil
    

    override func viewDidLoad() {
        

        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = ""
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        viewDidAppear(true)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
      }

    @IBAction func loginPressed(_ sender: UIButton) {
       
//        if username_Input.text == "Satya" && passward_Input.text == "12345"{
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "userListViewController")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
            

        


//        }else{
//           alertMessageOk()
//        }
    }
    
    func alertMessageOk() {
        let alert = UIAlertController(title: "Wrong", message:"Username or Passkey wrong " , preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
       }
    
}

