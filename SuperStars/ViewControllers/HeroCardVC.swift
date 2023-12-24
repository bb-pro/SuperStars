//
//  HeroCardVC.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import UIKit

@available(iOS 13.0, *)
class HeroCardVC: BaseViewController {

    @IBOutlet var mainImageView: UIImageView!
    
    var superHero: Superhero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: superHero.images.lg) else { return }
        mainImageView.setImage(with: url)
    }
    

    @IBAction func savePressed() {
        guard let imageToDownload = mainImageView.image else {
            return // No image to download
        }
        
        UIImageWriteToSavedPhotosAlbum(imageToDownload, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    @IBAction func biographyPressed() {
        let infoVC = main.instantiateViewController(withIdentifier: "HeroInfoVC") as! HeroDetailViewController
        infoVC.superhero = superHero
        infoVC.navigationItem.title = superHero.name
        push(vc: infoVC)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Error saving image:", error)
        } else {
            print("Image saved to photo gallery")
            showSavedMessage()
        }
    }
    
    func showSavedMessage() {
        let savedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        savedLabel.center = view.center
        savedLabel.textAlignment = .center
        savedLabel.text = "Saved"
        savedLabel.textColor = .white
        savedLabel.backgroundColor = UIColor(white: 0, alpha: 0.7)
        savedLabel.layer.cornerRadius = 10
        savedLabel.clipsToBounds = true
        
        view.addSubview(savedLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            savedLabel.removeFromSuperview()
        }
    }
    
    @IBAction func sharePressed() {
        guard let imageToShare = mainImageView.image else { return }
        let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
}
