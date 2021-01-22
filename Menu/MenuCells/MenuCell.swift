//
//  MenuCell.swift
//  Menu
//
//  Created by macbook on 20.01.2021.
//

import UIKit

class MenuCell: UICollectionViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.labelName.text = nil
        self.labelPrice.text = nil
    }
    
    func setup(product:Product){
        self.image.image = product.image
        self.labelName.text = product.name
        self.labelPrice.text = "\(product.price)"
        
    }

}
