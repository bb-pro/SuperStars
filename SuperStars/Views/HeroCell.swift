//
//  CollectionViewCell.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 30/03/23.
//

import UIKit
import Kingfisher

class HeroCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var mainLabel: UILabel! {
        didSet {
            imageView.layer.cornerRadius = 15
        }
    }
    
    func configure(superhero: Superhero) {
        mainLabel.text = superhero.name
        guard let imageUrl = URL(string: superhero.images.lg) else { return }
        imageView.kf.indicatorType = .activity
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.setImage(
            with: imageUrl,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
        ]
        )
    }
    
}
