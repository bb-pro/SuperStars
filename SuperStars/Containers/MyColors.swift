//
//  MyColors.swift
//  PokerMemorina
//
//  Created by Bektemur Mamashayev on 24/12/2023. anvar on 11/08/23.
//

import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(hex: Int) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF
       )
   }
}

enum MyColors: Int, CaseIterable {
    case orange = 0xFF7F00
    case black = 0x0D0D0D
    case lightBlue = 0x99DDFF
    case white = 0xFFFFFF
    case smokeWhite = 0xF8F8F8
    case gray = 0xB4B3B1
    case secondaryText = 0x262C3A

    case purple = 0x626DB3
    case tabBar = 0x22252B
    case green = 0x98DA43
    case pageControl = 0xB3B3B3
    case mainBG = 0xF3FEF8
    case cellBG = 0x05140C
    case bankrollTint = 0x05140CB2
    case blue = 0x019AE6
    case background = 0xFFA14A
    case darkGreen = 0x4E5C5F
    case darkBlue = 0x121826
    case tabColor = 0x85ABB1
    var color: UIColor {
        
        switch self {
        default:
            return UIColor.init(hex: rawValue)
        }
        
    }
}

