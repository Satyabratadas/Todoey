//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Satyabrata Das on 11/05/22.
//

import UIKit

class PostListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var UserId : Int = 0
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    let datamanager = dataModelManager()
    var postDetails: [Post] = []
    
    @IBOutlet weak var postListTableView: UITableView!
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
        
        let url = userPostRequest()
//        print(url)
        
//      Api service call and get response
        self.datamanager.userRequest(url: url) { result in
            for item in result {
                let postDetailsItem = Post(userId: item["userId"] as! Int, pid: item["id"] as! Int, title: item["title"] as? String, body: item["body"] as? String)
                self.postDetails.append(postDetailsItem)

            }
            DispatchQueue.main.async {
                self.postListTableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.postDetails.count)
        return self.postDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "PostListCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel!.text = postDetails[indexPath.row].title
        cell.textLabel?.sizeToFit()
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
    
//    Create Url string with UserId
    
    func userPostRequest() -> String{
        let aStr = String(format: "%@?userId=%d", urlString,UserId)
        return aStr
    }
    
    @objc func logoutBtnaction(sender: UIBarButtonItem) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "firstView")
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: self)
        }

    

    

}