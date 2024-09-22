//
//  MyTableViewCell.swift
//  26 _StoryBoard - UITableViewController,MVC,UserDefaults
//
//  Created by Kristina Kostenko on 18.08.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func refresh(_ model: Model) {
        nameLabel.text = model.name
        detailLabel.text = model.prof
    }
}
