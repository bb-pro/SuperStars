//
//  TabBarController.swift
//  Football136
//
//  Created by Bektemur Mamashayev on 24/12/2023. . on 01/12/23.
//

import UIKit

@available(iOS 13.0, *)
final class TabBarController: UITabBarController {
    
    let mainVCStoryboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        pushVC()
      
        if #available(iOS 15.0, *) {
            // Create a custom appearance instance
            let tabBarAppearance = UITabBarAppearance()

            // Apply the appearance to the tab bar
            self.tabBarController?.tabBar.standardAppearance = tabBarAppearance
        }
    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tabBar.frame.size.height = 100
//        tabBar.frame.origin.y = view.frame.height - 90
//    }
    
    private func setTabbar() {
      
        // Configure the appearance
        let appearance = tabBar.standardAppearance

        appearance.backgroundColor = MyColors.black.color
        appearance.selectionIndicatorTintColor = UIColor.red

        // Apply the appearance to the tab bar
        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        }
        tabBar.tintColor = .red
    }


    func pushVC() {
        let mainVC = mainVCStoryboard.instantiateViewController(withIdentifier: "MainVC")
        mainVC.tabBarItem.image = UIImage(systemName: "star.circle.fill")
        mainVC.tabBarItem.title = "Hero Cards"
//        let mainVCC = UINavigationController(rootViewController: mainVC)
        
        let herolistVC = mainVCStoryboard.instantiateViewController(withIdentifier: "HeroListVC")
        herolistVC.tabBarItem.image = UIImage(systemName: "figure.run")
        herolistVC.tabBarItem.title = "Biography"
        let heroListVCC = UINavigationController(rootViewController: herolistVC)
        
        let quizVC = mainVCStoryboard.instantiateViewController(withIdentifier: "QuizOnboardingVC")
        quizVC.tabBarItem.image = UIImage(systemName: "medal")
        quizVC.tabBarItem.title = "Quiz"
        let quizVCC = UINavigationController(rootViewController: quizVC)
        
        self.viewControllers = [mainVC, heroListVCC, quizVCC]
    }
}
