//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Satyabrata Das on 11/05/22.
//

import UIKit
import CoreData

class PostListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var users : UserDetails?
    var UserId : Int = 0
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    let datamanager = dataModelManager()
    var postDetails: [Post] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var postListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(UserId)
        
        
        let rightButtonItem = UIBarButtonItem.init(
              title: "Log-out",
              style: .plain,
              target: self,
              action: #selector(logoutBtnaction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        rightButtonItem.tintColor = UIColor.black
        let backBarButtonItem = UIBarButtonItem(title:"< Back", style: .plain, target: self, action: #selector(backButton(sender:)))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        self.navigationItem.title = users?.name
        let url = userPostRequest()
//        print(url)
//      Api service call and get response
        self.datamanager.userRequest(url: url) { [self] result in
            let newEntity: NSEntityDescription = NSEntityDescription.entity(forEntityName: "Post", in: self.context)!
            for item in result {
//                let array = NSArray(array: result)
                let count = self.filterFetchData(id: item["id"] as! Int)
                if count == 0{
                    let insertPostItem = Post(entity: newEntity, insertInto: self.context)
                    insertPostItem.userId = users!.id
                    insertPostItem.pid = item["id"] as! Int32
                    insertPostItem.title = item["title"] as? String
                    insertPostItem.body = item["body"] as? String
//                    insertPostItem.user = users
                }
                
//                let postDetailsItem = Post(userId: item["userId"] as! Int, pid: item["id"] as! Int, title: item["title"] as? String, body: item["body"] as? String)
//                self.postDetails.append(postDetailsItem)
            }
            do{
                try self.context.save()
            }catch{
                print(error)
            }
            
        }
        sleep(5)
        postDetails = fetchPostDetails()
//        print(postDetails)
        DispatchQueue.main.async {
            self.postListTableView.reloadData()
    }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postDetails.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "PostListCell", for: indexPath) as! PostListCell
        cell.postTitle.text = postDetails[indexPath.row].title
        cell.postTitle.sizeToFit()
        cell.postTitle.numberOfLines = 2
        cell.postTitle.lineBreakMode = .byWordWrapping
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let newVc = self.storyboard!.instantiateViewController(withIdentifier: "PostDetailsView") as! PostDetailsViewController
        newVc.titleName = (users?.name)!
        newVc.PostDetails = postDetails[indexPath.row]
        self.navigationController?.pushViewController(newVc, animated:true)
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
    //    back buton function
    @objc func backButton(sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    func filterFetchData(id:Int) -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "pid == %@",NSNumber(value: id))
        var results: [Post]?
        do {
            results = try context.fetch(fetchRequest) as? [Post]
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return results?.count ?? 0
    }
    func fetchPostDetails() -> [Post] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "userId == %@",NSNumber(value: UserId ))
        var results: [Post]?
        do {
            results = try context.fetch(fetchRequest) as? [Post]
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return results!
    }
    

    

}
