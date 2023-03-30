//
//  HeroDetailViewController.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 30/03/23.
//

import UIKit
import Kingfisher

class HeroDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    
    var superhero: Superhero!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        imageView.kf.indicatorType = .activity
        guard let url = URL(string: superhero.images.lg) else { return }
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        
        imageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .transition(.fade(1)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ]
        )
        textView.text = """
                                Biography
                        
                        Name:   \(superhero.biography.fullName)
                        
                        Place of birth:   \(superhero.biography.placeOfBirth)
                        
                        First Appearence:   \(superhero.biography.firstAppearance)
                        
                        Allieses:   \(superhero.biography.aliases)
                        """
    }

}
