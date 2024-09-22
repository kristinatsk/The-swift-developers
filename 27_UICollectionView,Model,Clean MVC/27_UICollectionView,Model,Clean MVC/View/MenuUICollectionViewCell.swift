//
//  MenuUICollectionViewCell.swift
//  27_UICollectionView,Model,Clean MVC
//
//  Created by Kristina Kostenko on 20.08.2024.
//

import UIKit

class MenuUICollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let image = menu?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
