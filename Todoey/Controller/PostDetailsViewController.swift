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
        self.navigationItem.leftBarButtonItem?.title = "Back"
        self.title = titleName
  

        let rightButtonItem = UIBarButtonItem.init(
              title: "Log-out",
              style: .plain,
              target: self,
              action: #selector(logoutBtnaction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        rightButtonItem.tintColor = UIColor.black
        postDetailsText.lineBreakMode = .byWordWrapping
        postDetailsText.numberOfLines = 0
        
        postDetailsText.text = "Title:  \((PostDetails?.title)!)\n \nBody:  \((PostDetails?.body)!)"
    }
//    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = titleName
    }
    
    @objc func logoutBtnaction(sender: UIBarButtonItem) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
        }
    

}
