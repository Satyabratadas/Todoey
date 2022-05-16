//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Satyabrata Das on 13/05/22.
//

import UIKit

class TodoListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let urlString = "https://jsonplaceholder.typicode.com/todos"
    var UserIdtodo : Int = 0
    var todoTitle : String = ""
    let dataManager = dataModelManager()
    var todoDetails : [ToDo] = []

    @IBOutlet weak var todoListTableView: UITableView!
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
        
        let backBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backButton(sender:)))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        self.navigationItem.title = todoTitle
        
        let url = userTodoRequest()
        self.dataManager.userRequest(url: url) { result in
            for item in result {
                let todoItem = ToDo(userId: item["userId"] as! Int, tid: item["id"] as! Int, title: item["title"] as? String, complete: item["completed"] as? Bool)
                self.todoDetails.append(todoItem)
            }
            
            DispatchQueue.main.async {
                self.todoListTableView.reloadData()
            }
    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoDetails.count;
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell( withIdentifier: "TodoCellView", for: indexPath) as? TodoCellView
        cell?.selectionStyle = .none
        cell?.todoList.text = todoDetails[indexPath.row].title
        
        if(todoDetails[indexPath.row].complete  == true){
            cell?.taskChecked.image = UIImage(named: "CompleteTask")
        }else{
            cell?.taskChecked.image = UIImage(named: "IncompleteTask")
        }
        return cell!
                
    }
    
    func userTodoRequest() -> String{
        let Str = String(format: "%@?userId=%d", urlString,UserIdtodo)
        return Str
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
