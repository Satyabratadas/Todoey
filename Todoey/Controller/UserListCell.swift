//
//  UserListCell.swift
//  Todoey
//
//  Created by ARC on 28/04/22.
//

import UIKit

class UserListCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
