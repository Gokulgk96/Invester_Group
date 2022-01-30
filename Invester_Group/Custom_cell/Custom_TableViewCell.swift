//
//  Custom_TableViewCell.swift
//  Invester_Group
//
//  Created by Gokul Gopalakrishnan on 29/01/22.
//

import UIKit

class Custom_TableViewCell: UITableViewCell {

    @IBOutlet weak var Label_view: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
