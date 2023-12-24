//
//  QuizOnboardingVC.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import UIKit

@available(iOS 13.0, *)
class QuizOnboardingVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func startPressed() {
        let quizVC = main.instantiateViewController(withIdentifier: "QuizVC")
        quizVC.navigationItem.title = "SuperHero Quiz"
        push(vc: quizVC)
    }
    
}
