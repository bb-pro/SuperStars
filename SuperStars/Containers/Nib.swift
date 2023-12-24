//
//  Nib.swift
//  PrettyAlert
//  Football136
//
//  Created by Bektemur Mamashayev on 24/12/2023. . on 2/12/2023.
//
import Foundation
import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
