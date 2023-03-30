//
//  CollectionViewCell.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 30/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    
    override func awakeFromNib() {
        imageView.image = UIImage(named: "image")
        mainLabel.text = "Main Text"
    }
}
