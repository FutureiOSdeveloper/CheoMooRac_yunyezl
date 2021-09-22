//
//  UIView+makeRounded.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/23.
//

import UIKit

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
}
