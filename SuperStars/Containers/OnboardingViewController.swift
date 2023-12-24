//
//  OnboardingViewController.swift
//  Football
//
//  Created by Bektemur Mamashayev on 24/12/2023. . on 18/09/23.
//
import UIKit

struct Onboarding {
    let mainImage: String
    let progress: String
    let titleImage: String
    
    static func getonboardingData() -> [Onboarding] {
        return [
            Onboarding(mainImage: "onboarding1", progress: "progress1", titleImage: "onb1"),
            Onboarding(mainImage: "onboarding2", progress: "progress2", titleImage: "onb2"),
            Onboarding(mainImage: "onboarding3", progress: "progress3", titleImage: "onb3"),
            Onboarding(mainImage: "onboarding4", progress: "progress4", titleImage: "onb4"),
            Onboarding(mainImage: "onboarding5", progress: "progress5", titleImage: "onb5")
        ]
    }
}

@available(iOS 13.0, *)
final class OnboardingViewController: BaseViewController {
    

    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var nextButtonLast: UIButton!
    @IBOutlet var progressView: UIImageView!
    @IBOutlet var titleImageView: UIImageView!
    private let onboardingData = Onboarding.getonboardingData()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        titleImageView.addShadow()
//        progressView.addShadow()
        updateUI(forIndex: currentIndex)
    }
    
    func updateUI(forIndex index: Int) {
        let data = onboardingData[index]
        mainImage.image = UIImage(named: data.mainImage)
        progressView.image = UIImage(named: data.progress)
        titleImageView.image = UIImage(named: data.titleImage)
        progressView.addShadow()
    }
    func presentTabBar() {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
    
    @IBAction func NextButtonPressed() {
        if currentIndex < onboardingData.count - 1 {
            currentIndex += 1
            updateUI(forIndex: currentIndex)
        } else {
            presentTabBar()
        }
    }
   
    @IBAction func skipButtonPressed() {
        presentTabBar()
    }
    
}



