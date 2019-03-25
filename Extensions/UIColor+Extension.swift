//
//  UIColor+Extension.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    static func sapphireBlue() -> UIColor {
        return UIColor(r: 29, g: 195, b: 200)
    }
    
    static func facebookBlue() -> UIColor {
        return UIColor(r: 92, g: 114, b: 232)
    }
    
    static func darkBlue() -> UIColor {
        return UIColor(r: 46, g: 58, b: 70)
    }
    
    static func minDarkBlue() -> UIColor {
        return UIColor(r: 67, g: 81, b: 94)
    }
    
    static func middleGray() -> UIColor {
        return UIColor(r: 162, g: 171, b: 179)
    }
}
