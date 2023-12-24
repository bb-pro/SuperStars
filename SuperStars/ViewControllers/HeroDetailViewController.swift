//
//  HeroDetailViewController.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. 
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
                        
                        Full Name:   \(superhero.biography.fullName)

                        Place of birth:   \(superhero.biography.placeOfBirth)
                        
                        First Appearence:   \(superhero.biography.firstAppearance)
                        
                        Allieses:   \(superhero.biography.aliases)
                        
                        Alter egos: \(superhero.biography.alterEgos)
                        """
    }
    
    @IBAction func copyPressed() {
        // Get the text from the UITextView
        guard let textToCopy = textView.text else { return }

        // Check if there is any text to copy
        guard !textToCopy.isEmpty else {
            return
        }

        // Copy the text to the clipboard
        UIPasteboard.general.string = textToCopy

        // Optionally, provide feedback to the user (e.g., display an alert)
        let alert = UIAlertController(title: "Text Copied", message: "The text has been copied to the clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
