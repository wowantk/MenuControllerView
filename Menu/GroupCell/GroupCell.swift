//
//  GroupCell.swift
//  Menu
//
//  Created by macbook on 22.01.2021.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(group:Group){
        self.groupName.text = group.name 
    }

}
