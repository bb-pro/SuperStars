//
//  Ex+UIImageView.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,
                         options: [.transition(.fade(0.3))]
        )
    }
}
