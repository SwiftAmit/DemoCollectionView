//
//  Define.swift
//  DemoCollectionView
//
//  Created by saffron on 14/03/18.
//  Copyright © 2018 saffron. All rights reserved.
//

import UIKit

let MAIN_SCREEN:UIScreen            = UIScreen.main
let ScreenWidth:CGFloat             = MAIN_SCREEN.bounds.size.width
let ScreenHeight:CGFloat            = MAIN_SCREEN.bounds.size.height

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
