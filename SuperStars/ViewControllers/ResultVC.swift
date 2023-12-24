//
//  ResultVC.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import UIKit

class ResultVC: BaseViewController {

    var result: String!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(result ?? "")/8"
    }
    
    @IBAction func backPressed() {
        popToTopViewController()
    }

}
