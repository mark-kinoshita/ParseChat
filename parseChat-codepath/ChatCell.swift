//
//  ChatCell.swift
//  ParseChat
//
//  Created by Mark Kinoshita on 2/23/18.
//  Copyright © 2018 Mark Kinoshita. All rights reserved.
//
import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
