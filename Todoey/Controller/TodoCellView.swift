//
//  TodoCellViewTableViewCell.swift
//  Todoey
//
//  Created by Satyabrata Das on 13/05/22.
//

import UIKit

class TodoCellView: UITableViewCell {
    var iscomplete : Bool = false
   
    @IBOutlet weak var todoList: UILabel!
    
    @IBOutlet weak var taskChecked: UIImageView!
    
}


