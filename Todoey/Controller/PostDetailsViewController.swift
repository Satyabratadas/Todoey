//
//  PostDetailsViewController.swift
//  Todoey
//
//  Created by Satyabrata Das on 13/05/22.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    var PostDetails : Post?
    var titleName : String = ""

    @IBOutlet weak var postDetailsText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = titleName
  
        
        let rightButtonItem = UIBarButtonItem.init(
              title: "Log-out",
              style: .plain,
              target: self,
              action: #selector(logoutBtnaction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        rightButtonItem.tintColor = UIColor.black
        let backBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backButton(sender:)))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        postDetailsText.lineBreakMode = .byWordWrapping
        postDetailsText.numberOfLines = 0
        
        postDetailsText.text = "Title:  \((PostDetails?.title)!)\n \nBody:  \((PostDetails?.body)!)"
    }

    
    @objc func logoutBtnaction(sender: UIBarButtonItem) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
        }
    //    back buton function
    @objc func backButton(sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    

}
